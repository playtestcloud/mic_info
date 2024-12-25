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
  List<MicInfoDevice> mics = <MicInfoDevice>[];
  int index = 0;

  @override
  void initState() {
    super.initState();
    getActive();
  }

  void getActive() async {
    mics = await MicInfo.getActiveMicrophones();
    setState(() {
      index = 0;
    });
  }

  void getBluetooth() async {
    mics = await MicInfo.getBluetoothMicrophones();
    setState(() {
      index = 1;
    });
  }

  void getDefault() async {
    mics = await MicInfo.getDefaultMicrophones();
    setState(() {
      index = 2;
    });
  }

  void getWired() async {
    mics = await MicInfo.getWiredMicrophones();
    setState(() {
      index = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Microphone info'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              if (mics.isEmpty)
                const Text('No microphones for the selected category'),
              for (final mic in mics) Text('${mic.productName} (${mic.id})'),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (itemIndex) {
            switch (itemIndex) {
              case 0:
                getActive();
                break;
              case 1:
                getBluetooth();
                break;
              case 2:
                getDefault();
                break;
              case 3:
                getWired();
                break;
            }
          },
          currentIndex: index,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(Icons.mic),
              label: 'Active',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(Icons.bluetooth),
              label: 'Bluetooth',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(Icons.phone_android),
              label: 'Default',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(Icons.headset_mic),
              label: 'Wired',
            ),
          ],
        ),
      ),
    );
  }
}
