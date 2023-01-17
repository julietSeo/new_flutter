import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Util/utils.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({Key? key, required this.device}) : super(key: key);

  final BluetoothDevice device;

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  FlutterBluePlus fBle = FlutterBluePlus.instance;

  String state = 'Connecting';
  String btnText = 'Disconnect';

  BluetoothDeviceState deviceState = BluetoothDeviceState.disconnected;

  StreamSubscription<BluetoothDeviceState>? _stateListener;

  List<BluetoothService> bluetoothService = [];

  List<int> notifyData = [];

  late FocusNode focusNode;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Utils utils = Utils();

  List<bool> getStatus = List.filled(13, false);

  double temperature = 0;
  double gasConc = 0;

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();

    _stateListener = widget.device.state.listen((event) {
      debugPrint('event: $event');

      if (deviceState == event) {
        return;
      }

      setBleConnectionState(event);
    });

    connect();
  }

  @override
  void dispose() {
    super.dispose();

    _stateListener?.cancel();

    focusNode.dispose();

    // disconnect();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  ///연결 상태 갱신
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
    setState(() {});
  }

  ///start connecting
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

        for (BluetoothService service in bleServices) {
          print("Service UUID: ${service.uuid}");
          for (BluetoothCharacteristic c in service.characteristics) {
            if (c.properties.notify && c.descriptors.isNotEmpty) {}

            if (!c.isNotifying) {
              try {
                await c.setNotifyValue(true);
                c.value.listen((value) {
                  setState(() {
                    print('notifyData = $value');
                    notifyData = value;
                  });

                  if (value.isNotEmpty) {
                    showToast('데이터 송신중...');
                    print('송신데이터 : ${utils.getRawData(notifyData)}');
                    getStatus = List.filled(13, false);

                    List<int> newDatas = [];
                    if (utils.getRawData(notifyData).length > 13) {
                      for (int i = 7; i < notifyData.length - 3; i++) {
                        newDatas.add(notifyData[i]);
                      }
                      // instrument status
                      setInstStatus(newDatas, 0, 4);

                      // temperature & gas concentration
                      temperature = setDoubleValue(newDatas, 12, 4, 10);
                      print("temperature : $temperature");
                      gasConc = setDoubleValue(newDatas, 16, 8, 1000);
                      print("gasConc : $gasConc");
                    }
                  }
                });

                await Future.delayed(const Duration(milliseconds: 100));
              } catch (e) {
                print('Error ${c.uuid} $e');
              }
            }
          }
        }

        returnValue = Future.value(true);
      }
    });

    return returnValue ?? Future.value(false);
  }

  void setInstStatus(List<int> obj, int start, int cnt) {
    String temp = "";
    temp = utils.getRawData(obj).substring(start, start + cnt);

    var bin = int.parse(temp, radix: 16).toRadixString(2);
    print("$bin / ${bin.length}");

    if (bin.length < 13) {
      for (int i = 0; i < 13 - bin.length + i; i++) {
        bin = "0$bin";
      }
    }
    print("binary : $bin");

    for (var i = bin.length - 1; i >= 0; i--) {
      if (bin[i] == "1") {
        getStatus[i] = true;
      } else {
        getStatus[i] = false;
      }
    }
  }

  double setDoubleValue(List<int> obj, int start, int cnt, int times) {
    double result = 0;
    String temp = "";

    temp = utils.getRawData(obj).substring(start, start + cnt);

    result = int.parse(temp, radix: 16) / times;

    return result;
  }

  ///disconnecting
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

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.teal.withOpacity(0.5),
      textColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.device.name,
          style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
        ),
        backgroundColor: Color(0xFF162A75),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(focusNode),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFFF5F5F5),
                        ),
                        child: Checkbox(
                          value: getStatus[12],
                          onChanged: (newValue) async {
                            setState(() {
                              getStatus[12] = newValue!;
                            });
                          },
                          activeColor: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Boot Up',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFFF5F5F5),
                        ),
                        child: Checkbox(
                          value: getStatus[11],
                          onChanged: (newValue) async {
                            setState(() {
                              getStatus[11] = newValue!;
                            });
                          },
                          activeColor: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Sensor Channel Enabled',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFFF5F5F5),
                        ),
                        child: Checkbox(
                          value: getStatus[10],
                          onChanged: (newValue) async {
                            setState(() {
                              getStatus[10] = newValue!;
                            });
                          },
                          activeColor: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Alarm 1',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFFF5F5F5),
                        ),
                        child: Checkbox(
                          value: getStatus[9],
                          onChanged: (newValue) async {
                            setState(() {
                              getStatus[9] = newValue!;
                            });
                          },
                          activeColor: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Alarm 2',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFFF5F5F5),
                        ),
                        child: Checkbox(
                          value: getStatus[8],
                          onChanged: (newValue) async {
                            setState(() {
                              getStatus[8] = newValue!;
                            });
                          },
                          activeColor: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Latched Alarm 1',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFFF5F5F5),
                        ),
                        child: Checkbox(
                          value: getStatus[7],
                          onChanged: (newValue) async {
                            setState(() {
                              getStatus[7] = newValue!;
                            });
                          },
                          activeColor: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Latched Alarm 2',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFFF5F5F5),
                        ),
                        child: Checkbox(
                          value: getStatus[6],
                          onChanged: (newValue) async {
                            setState(() {
                              getStatus[6] = newValue!;
                            });
                          },
                          activeColor: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Over-Range',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFFF5F5F5),
                        ),
                        child: Checkbox(
                          value: getStatus[5],
                          onChanged: (newValue) async {
                            setState(() {
                              getStatus[5] = newValue!;
                            });
                          },
                          activeColor: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Warning',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFFF5F5F5),
                        ),
                        child: Checkbox(
                          value: getStatus[4],
                          onChanged: (newValue) async {
                            setState(() {
                              getStatus[4] = newValue!;
                            });
                          },
                          activeColor: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Fault',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFFF5F5F5),
                        ),
                        child: Checkbox(
                          value: getStatus[3],
                          onChanged: (newValue) async {
                            setState(() {
                              getStatus[3] = newValue!;
                            });
                          },
                          activeColor: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Latched Warning',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFFF5F5F5),
                        ),
                        child: Checkbox(
                          value: getStatus[2],
                          onChanged: (newValue) async {
                            setState(() {
                              getStatus[2] = newValue!;
                            });
                          },
                          activeColor: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Latched Fault',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFFF5F5F5),
                        ),
                        child: Checkbox(
                          value: getStatus[1],
                          onChanged: (newValue) async {
                            setState(() {
                              getStatus[1] = newValue!;
                            });
                          },
                          activeColor: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Bump Test',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFFF5F5F5),
                        ),
                        child: Checkbox(
                          value: getStatus[0],
                          onChanged: (newValue) async {
                            setState(() {
                              getStatus[0] = newValue!;
                            });
                          },
                          activeColor: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Gas Calibrating',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                    child: Text(
                      'Temperature : ${temperature.toString()}',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                    child: Text(
                      'Gas Concentration : ${gasConc.toString()}',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF162A75)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                          ),
                          onPressed: () {
                            if (deviceState == BluetoothDeviceState.connected) {
                              disconnect();
                            } else if (deviceState == BluetoothDeviceState.disconnected) {
                              connect();
                            }
                          },
                          child: Text(
                            btnText,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
