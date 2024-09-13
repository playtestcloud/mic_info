import 'package:flutter/material.dart';
import 'package:mic_info/mic_info.dart';
import 'package:mic_info/model/mic_info_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _micInfoPlugin = MicInfo();
  List<Device> mic = [];
  int index = 0;

  @override
  void initState() {
    getDefault();
    super.initState();
  }

  void getDefault() async {
    mic = await _micInfoPlugin.getDefaultMicrophone();
    setState(() {
      index = 0;
    });
  }

  void getWired() async {
    mic = await _micInfoPlugin.getWiredMicrophone();
    setState(() {
      index = 1;
    });
  }

  void getBluetooth() async {
    mic = await _micInfoPlugin.getBluetoothMicrophone();
    setState(() {
      index = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text("Microphone's info :- \n$mic"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (itemIndex) {
            if (itemIndex == 0) {
              getDefault();
            } else if (itemIndex == 1) {
              getWired();
            } else if (itemIndex == 2) {
              getBluetooth();
            }
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.phone_android,
                  color: Colors.blueAccent,
                ),
                icon: Icon(Icons.phone_android),
                label: 'Defaut'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.headphones,
                  color: Colors.blueAccent,
                ),
                icon: Icon(Icons.headphones),
                label: 'Wired'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.bluetooth,
                  color: Colors.blueAccent,
                ),
                icon: Icon(Icons.bluetooth),
                label: 'Bluetooth'),
          ],
        ),
      ),
    );
  }
}
