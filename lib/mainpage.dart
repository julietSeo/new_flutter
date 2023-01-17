import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import 'devicepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> with TickerProviderStateMixin {
  final FlutterBluePlus _fBle = FlutterBluePlus.instance;

  List<ScanResult> scanResults = [];
  // TODO: deal with bonded devices
  // List<BluetoothDevice> bondedDevices = [];

  bool isScanning = false;

  late final AnimationController _animatedController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 1),
    value: 1.0,
  );

  late final Animation<double> _animation =
      CurvedAnimation(parent: _animatedController, curve: Curves.easeInToLinear);

  @override
  void dispose() {
    _animatedController.dispose();

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

    _animatedController.addListener(() {
      setState(() {});
    });

    _fBle.state.listen((event) async {
      if (event == BluetoothState.on) {
        scan();
        _fBle.isScanning.listen((event) async {
          isScanning = event;
          if (event) {
            // await Future.delayed(Duration(seconds: 4));
            setState(() {
              // if (event) {
              //   getPairedDevice();
              // }
            });
          }
        });
      }
    });

    // _fBle.isScanning.listen((event) async {
    //   isScanning = event;
    //   if (event) {
    //     await Future.delayed(Duration(seconds: 4));
    //     setState(() {
    //       // if (event) {
    //       //   getPairedDevice();
    //       // }
    //     });
    //   }
    // });
  }

  void showAnimation() {
    _animatedController.repeat(reverse: true);
  }

  Future<List<BluetoothDevice>> getBondedDevices() async {
    return Future.value(FlutterBluePlus.instance.bondedDevices);
  }

  void scan() async {
    if (await Permission.bluetoothScan.request().isGranted) {}
    Map<Permission, PermissionStatus> status = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
    ].request();

    if (!isScanning) {
      _fBle.startScan(timeout: Duration(seconds: 5));
      showAnimation();

      // showLoading();
      await Future.delayed(Duration(seconds: 5));
      hideLoading();

      _fBle.scanResults.listen((results) {
        for (var r in results) {
          // if (bondedDevices.isNotEmpty) {
          //   _fBle.stopScan();
          //   Navigator.of(context).pop();
          //   break;
          // }

          if (scanResults.indexWhere((element) => element.device.id.id == r.device.id.id) < 0) {
            if (r.device.name == "RATEL") {
              scanResults.add(r);
            }
          }
        }
        setState(() {});
      });
    } else {
      _fBle.stopScan();
    }
  }

  // void getPairedDevice() async {
  //   if (await Permission.bluetoothScan.request().isGranted) {}
  //   Map<Permission, PermissionStatus> status = await [
  //     Permission.bluetoothScan,
  //     Permission.bluetoothConnect,
  //   ].request();
  //
  //   getBondedDevices().then((value) {
  //     for (var element in value) {
  //       setState(() {
  //         if (element.name.contains('GDI')) {
  //           bondedDevices.add(element);
  //         }
  //       });
  //     }
  //
  //     if (bondedDevices.isNotEmpty) {
  //       print('페어드 기기 ==> ${bondedDevices[0].name}');
  //       gotoConnectPage(bondedDevices[0]);
  //     }
  //   });
  // }

  void showLoading() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void hideLoading() {
    // Navigator.of(context).pop();
    _animatedController.stop(canceled: true);
    _animatedController.value = 1.0;

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DevicePage(devices: scanResults),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: SizedBox(
            width: 85,
            height: 85,
            child: FloatingActionButton(
              onPressed: () {
                scan();
              },
              backgroundColor: Colors.teal,
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
