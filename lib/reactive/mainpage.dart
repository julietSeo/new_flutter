import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:new_flutter/reactive/devicepage.dart';
import 'package:permission_handler/permission_handler.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> with TickerProviderStateMixin {
  final flutterReactiveBle = FlutterReactiveBle();

  List<DiscoveredDevice> discoveredDevices = [];
  StreamSubscription? subscription;

  bool isScanning = false;

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 1),
  )..repeat(reverse: true);

  late final Animation<double> _animation =
      CurvedAnimation(parent: _animationController, curve: Curves.easeInToLinear);

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();

    flutterReactiveBle.statusStream.listen((status) {
      if (BleStatus.ready == status) {
        print("ready ble");
      } else if (BleStatus.unauthorized == status) {
        print("unauthorized ble");
      } else {
        print('etc ble');
      }
    });

    scan();
  }

  void scan() async {
    if (await Permission.bluetoothScan.request().isGranted) {}
    Map<Permission, PermissionStatus> status = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
    ].request();

    flutterReactiveBle
        .scanForDevices(withServices: [], scanMode: ScanMode.balanced)
        .where((event) => event.name.contains('GDI'))
        .listen((device) {
          if (discoveredDevices.indexWhere((e) => e.id == device.id) < 0) {
            discoveredDevices.add(device);
          }
          setState(() {});
          if (discoveredDevices.isNotEmpty) {
            print(discoveredDevices[discoveredDevices.length - 1].id);
          }
        }, onError: (e) {
          print('error = ${e.toString()}');
        });

    await Future.delayed(Duration(seconds: 5));
    hideLoading();
  }

  void hideLoading() {
    if (discoveredDevices.isNotEmpty) {
      print(discoveredDevices.length);
    }
    // Navigator.of(context).pop();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DevicePage(device: discoveredDevices),
        ));
    subscription?.cancel();
    subscription = null;

    bleClear();
  }

  void bleClear() async {
    await flutterReactiveBle.clearGattCache('04:7F:0E:00:02:53');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: SizedBox(
            width: 90,
            height: 90,
            child: FloatingActionButton(
              onPressed: () {
                // scan();
              },
              child: Icon(
                Icons.bluetooth_outlined,
                color: Colors.white,
                size: 45,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
