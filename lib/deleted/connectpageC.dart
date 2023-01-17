import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:new_flutter/Util/utils.dart';
import 'package:new_flutter/connectpageA.dart';
import 'package:new_flutter/deleted/configurationpage.dart';

import '../protobuf/ble.pb.dart';

class ConnectPageC extends StatefulWidget {
  const ConnectPageC({Key? key, required this.device}) : super(key: key);

  final BluetoothDevice device;

  @override
  State<ConnectPageC> createState() => _ConnectPageWidgetState();
}

class _ConnectPageWidgetState extends State<ConnectPageC> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String state = 'Connecting';
  String btnText = 'Disconnect';

  BluetoothDeviceState deviceState = BluetoothDeviceState.disconnected;

  StreamSubscription<BluetoothDeviceState>? _stateListener;

  List<BluetoothService> bluetoothService = [];

  /// create object of ble.proto
  Information information = Information();
  Information_BleInfo bleInfo = Information_BleInfo();
  Header header = Header();

  Utils utils = Utils();
  ConnectPageState connectPageState = ConnectPageState();

  String serialNum = '';
  String deviceNm = '';
  String deviceAddr = '';
  String fwVersion = '';
  String instId = '';
  String functionId = '';

  int value = 305419896;
  int byteLen = 4;

  int sof = 0x3C;
  int eof = 0x3E;

  @override
  void initState() {
    super.initState();

    deviceNm = widget.device.name;
    deviceAddr = widget.device.id.id;

    // print('ascii decode: ${ascii.decode([sof])}');

    _stateListener = widget.device.state.listen((event) {
      print('event: $event');

      if (deviceState == event) {
        return;
      }

      setBleConnectionState(event);
    });

    setReqCmd();
    connect();

    var result = utils.convertInt2Bytes(value, byteLen, Endian.big);
    print('result : $result, type : ${result.runtimeType}');
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _stateListener?.cancel();
    _unfocusNode.dispose();
    disconnect();

    super.dispose();
  }

  /// Start of BLE Functions

  setBleConnectionState(BluetoothDeviceState event) {
    switch (event) {
      case BluetoothDeviceState.disconnected:
        state = 'Disconnected';
        btnText = 'Connect';
        break;
      case BluetoothDeviceState.disconnecting:
        state = 'Disconnecting';
        break;
      case BluetoothDeviceState.connected:
        state = 'Connected';
        btnText = 'Disconnect';
        break;
      case BluetoothDeviceState.connecting:
        state = "Connecting";
        break;
    }
    deviceState = event;
    setState(() {
      print('connection state => $state');
    });
  }

  Future<bool> connect() async {
    Future<bool>? returnValue;
    setState(() {
      state = "Connecting";
    });
    protoTest();

    await widget.device.connect(autoConnect: false).timeout(Duration(milliseconds: 10000),
        onTimeout: () {
      returnValue = Future.value(false);
      debugPrint('timeout failed');

      setBleConnectionState(BluetoothDeviceState.disconnected);
    }).then((data) async {
      bluetoothService.clear();

      if (returnValue == null) {
        debugPrint('connection successful');
        List<BluetoothService> bleServices = await widget.device.discoverServices();
        setState(() {
          bluetoothService = bleServices;
        });
        returnValue = Future.value(true);
      }
    });

    return returnValue ?? Future.value(false);
  }

  void disconnect() {
    try {
      setState(() {
        state = 'Disconnecting';
      });
      widget.device.disconnect();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void protoTest() {
    getReqCmd();
    setState(() {});

    print('---------------------------------------------------------------'
        '\nserialNumber : $serialNum'
        '\ndeviceName: $deviceNm / deviceMacAddr: $deviceAddr'
        '\nfwVersion: $fwVersion / instrumentId: $instId / functionId: $functionId'
        '\n---------------------------------------------------------------');
  }

  /// Start of Protocol Buffer Functions

  void getReqCmd() {
    serialNum = information.serialNum;

    deviceNm = bleInfo.deviceNm;
    deviceAddr = bleInfo.macAddr;
    fwVersion = bleInfo.fwVersion;
    instId = bleInfo.instId;
    functionId = Information_FuncId.valueOf(bleInfo.function.value).toString();
  }

  void setReqCmd() {
    /// Header
    header.sof = ascii.decode([sof]);
    header.dst = Objects.INTERFACE;
    header.src = Objects.BLE_MODULE;

    information.serialNum = 'SN1234';

    /// BLE Info
    bleInfo.deviceNm = widget.device.name;
    bleInfo.macAddr = widget.device.id.id;
    bleInfo.fwVersion = 'V1.05';
    bleInfo.instId = 'ABC345';
    bleInfo.function = Information_FuncId.GET_BLE;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFF009688),
          title: Text(
            widget.device.name,
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 500,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0x0000000D),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/images/RATEL.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: $deviceNm',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              'FW Version: $fwVersion',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              'Latest Update: 2023/01/01',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 500,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Color(0xFF9BD5D2),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.zero,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                  child: Text(
                                    '%LEL',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Text(
                                  'LEL',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: 500,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Color(0xFF9BD5D2),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.zero,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      '20.9 %',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                      child: Text(
                                        '%',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                    child: Text(
                                      'O2',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: 500,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Color(0xFF9BD5D2),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.zero,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                    child: Text(
                                      '%LEL',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'LEL',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 15, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                state,
                                style: TextStyle(fontFamily: 'Poppins'),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (deviceState == BluetoothDeviceState.connected) {
                                      disconnect();
                                    } else if (deviceState == BluetoothDeviceState.disconnected) {
                                      connect();
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(Color(0xFF009688)),
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8))),
                                  ),
                                  child: Text(
                                    btnText,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 80,
          height: 80,
          child: FloatingActionButton.large(
            backgroundColor: Color(0xFFF59056),
            child: Icon(
              Icons.app_settings_alt_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ConfigurationPageWidget()));
            },
          ),
        ));
  }
}
