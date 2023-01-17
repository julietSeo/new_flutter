import 'package:flutter/material.dart';
import 'package:new_flutter/Util/utils.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.datas}) : super(key: key);

  final List<int> datas;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<bool> status = [];
  double temperature = 0;
  double gasConc = 0;

  String tempStr = "";

  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Utils utils = Utils();

  @override
  void initState() {
    super.initState();

    print(utils.getRawData(widget.datas));
    List<int> newDatas = [];
    for (int i = 7; i < widget.datas.length - 3; i++) {
      newDatas.add(widget.datas[i]);
    }

    String str = utils.getRawData(newDatas);

    // instrument status
    tempStr = str.substring(0, 4);
    print("tempStr: ${int.parse(tempStr, radix: 16)}");

    var s = int.parse(tempStr, radix: 16).toRadixString(2);
    print(s);
    var len = s.length;

    if (len < 13) {
      for (int i = 0; i < 13 - len + i; i++) {
        s = "0$s";
      }
    }

    for (var i = s.length - 1; i >= 0; i--) {
      if (s[i] == "1") {
        status.add(true);
        setState(() {});
      } else {
        status.add(false);
        setState(() {});
      }
      print(status);
    }

    // temperature
    tempStr = str.substring(12, 16);
    temperature = int.parse(tempStr, radix: 16) / 10;
    print("temperature: $temperature");

    // gas concentration
    tempStr = str.substring(16, 24);
    gasConc = int.parse(tempStr, radix: 16) / 1000;
    print("gasConc: $gasConc");
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF162A75),
        title: Text(
          'Response from device',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        actions: [],
        centerTitle: true,
      ),
      body: SafeArea(
        child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Expanded(
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
                              value: status[0],
                              onChanged: (newValue) async {
                                setState(() {
                                  status[0] = newValue!;
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
                              value: status[1],
                              onChanged: (newValue) async {
                                setState(() {
                                  status[1] = newValue!;
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
                              value: status[2],
                              onChanged: (newValue) async {
                                setState(() {
                                  status[2] = newValue!;
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
                              value: status[3],
                              onChanged: (newValue) async {
                                setState(() {
                                  status[3] = newValue!;
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
                              value: status[4],
                              onChanged: (newValue) async {
                                setState(() {
                                  status[4] = newValue!;
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
                              value: status[5],
                              onChanged: (newValue) async {
                                setState(() {
                                  status[5] = newValue!;
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
                              value: status[6],
                              onChanged: (newValue) async {
                                setState(() {
                                  status[6] = newValue!;
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
                              value: status[7],
                              onChanged: (newValue) async {
                                setState(() {
                                  status[7] = newValue!;
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
                              value: status[8],
                              onChanged: (newValue) async {
                                setState(() {
                                  status[8] = newValue!;
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
                              value: status[9],
                              onChanged: (newValue) async {
                                setState(() {
                                  status[9] = newValue!;
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
                              value: status[10],
                              onChanged: (newValue) async {
                                setState(() {
                                  status[10] = newValue!;
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
                              value: status[11],
                              onChanged: (newValue) async {
                                setState(() {
                                  status[11] = newValue!;
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
                              value: status[12],
                              onChanged: (newValue) async {
                                setState(() {
                                  status[12] = newValue!;
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
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                        child: Text(
                          'Gas Concentration : ${gasConc.toString()}',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
