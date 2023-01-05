import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:new_flutter/configurationpage.dart';
import 'package:new_flutter/connectpage.dart';

import 'protobuf/ratel.pb.dart';

class ConnectPageWidget extends StatefulWidget {
  const ConnectPageWidget({Key? key, required this.device}) : super(key: key);

  final BluetoothDevice device;

  @override
  State<ConnectPageWidget> createState() => _ConnectPageWidgetState();
}

enum ClassType {
  information,
  monitoring,
  sensor,
  etc,
}

enum InsttType {
  instrument,
  pc,
  mobile,
  ble,
}

class _ConnectPageWidgetState extends State<ConnectPageWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  CommandRequest request = CommandRequest();
  BLEInfo bleInfo = BLEInfo();

  bool success = false;

  String deviceNm = '';
  String fwVersion = '';

  int seqNum = 1;

  String state = 'Connecting';

  BluetoothDeviceState deviceState = BluetoothDeviceState.disconnected;

  StreamSubscription<BluetoothDeviceState>? _stateListener;

  List<BluetoothService> bluetoothService = [];

  ConnectPageState connectPageState = ConnectPageState();

  @override
  void initState() {
    super.initState();

    _stateListener = widget.device.state.listen((event) {
      print('event: $event');

      if (deviceState == event) {
        return;
      }

      setBleConnectionState(event);
    });

    connect();

    setReqCmd();
    getReqCmd();
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

  /// Set state of connection
  setBleConnectionState(BluetoothDeviceState event) {
    switch (event) {
      case BluetoothDeviceState.disconnected:
        state = 'Disconnected';
        break;
      case BluetoothDeviceState.disconnecting:
        state = 'Disconnecting';
        break;
      case BluetoothDeviceState.connected:
        state = 'Connected';
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

  void getClassTest() {
    // connectPageState.writeData(c, data);
  }

  /// Start of Protocol Buffer Functions

  void getReqCmd() {
    //BLE info
    deviceNm = bleInfo.deviceNm;
    fwVersion = bleInfo.fwVersion;
    setState(() {});

    print('\nsource : ${request.src}\tdest : ${request.dst}'
        '\ncmdType : ${request.cmd}\tsequenceNum : ${request.seq}'
        '\ncommandClass : ${request.class_5}\tfunctionId : ${request.func}');
  }

  void setReqCmd() {
    request.src = InstType.valueOf(InsttType.mobile.index)!;
    request.dst = InstType.valueOf(InsttType.instrument.index)!;

    request.cmd = CommandType.valueOf(parsingValue('0x01'))!;
    request.seq = seqNum++;
    setState(() {});

    request.class_5 = CommandClass.valueOf(ClassType.information.index)!;
    request.func = FunctionID.valueOf(parsingValue('0x03'))!;

    bleInfo.deviceNm = 'GDI Ratel';
    bleInfo.fwVersion = 'v1.01';
  }

  int parsingValue(String value) {
    int result = 0;
    result = int.parse(value);

    return result;
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
                              'Latest Update: 2022/12/21',
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
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFF9BD5D2),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
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
                            height: 150,
                            decoration: BoxDecoration(
                              color: Color(0xFF9BD5D2),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
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
                            height: 150,
                            decoration: BoxDecoration(
                              color: Color(0xFF9BD5D2),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
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
            child: Icon(Icons.app_settings_alt_outlined),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ConfigurationPageWidget()));
            },
          ),
        ));
  }
}
