import 'package:flutter/material.dart';

import 'protobuf/ratel.pb.dart';

class ConfigurationPageWidget extends StatefulWidget {
  const ConfigurationPageWidget({Key? key}) : super(key: key);

  @override
  _ConfigurationPageWidgetState createState() => _ConfigurationPageWidgetState();
}

class _ConfigurationPageWidgetState extends State<ConfigurationPageWidget> {
  TextEditingController? textController1;
  bool? sensorCO2Value;
  TextEditingController? textController2;
  bool? ledO2Value;
  bool? ledCO2Value;
  TextEditingController? textController3;
  bool? caliO2Value;
  bool? caliCO2Value;

  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool gasEnable = false;

  CommandRequest request = CommandRequest();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();

    request.func = FunctionID.INFO_GET_SENSOR;
    request.gasEnable = true;

    gasEnable = request.gasEnable;
    print('gasEnable=$gasEnable');
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF009688),
        title: Text(
          'Configuration',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 130,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          print('EDIT pressed ...');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF59056)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                        ),
                        child: Text(
                          'EDIT',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 130,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          print('SAVE pressed ...');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF59056)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                        ),
                        child: Text(
                          'SAVE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Container(
                    width: 500,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 500,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xC9009688),
                          ),
                          alignment: AlignmentDirectional(-0.85, 0),
                          child: Text(
                            'Sensor',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFBFBFB),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          width: 500,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: Text(
                                      'O2 Enable',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                  Switch(
                                    value: gasEnable,
                                    onChanged: (newValue) async {
                                      setState(() => gasEnable = newValue);
                                      print('SENSOR > Gas Enable> $newValue');
                                    },
                                    activeColor: Color(0xFFF59056),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: Text(
                                      'CO2 Enable',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                  Switch(
                                    value: sensorCO2Value ??= true,
                                    onChanged: (newValue) async {
                                      setState(() => sensorCO2Value = newValue);
                                      print('SENSOR > CO2> $newValue');
                                    },
                                    activeColor: Color(0xFFF59056),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Container(
                    width: 500,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 500,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xC9009688),
                          ),
                          alignment: AlignmentDirectional(-0.85, 0),
                          child: Text(
                            'LED',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFBFBFB),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          width: 500,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: Text(
                                      'O2 Enable',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                  Switch(
                                    value: ledO2Value ??= true,
                                    onChanged: (newValue) async {
                                      setState(() => ledO2Value = newValue);
                                      print('LED > O2> $newValue');
                                    },
                                    activeColor: Color(0xFFF59056),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: Text(
                                      'CO2 Enable',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                  Switch(
                                    value: ledCO2Value ??= true,
                                    onChanged: (newValue) async {
                                      setState(() => ledCO2Value = newValue);
                                      print('LED > CO2> $newValue');
                                    },
                                    activeColor: Color(0xFFF59056),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Container(
                    width: 500,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 500,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xC9009688),
                          ),
                          alignment: AlignmentDirectional(-0.85, 0),
                          child: Text(
                            'Calibration',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFBFBFB),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          width: 500,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: Text(
                                      'O2 Enable',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                  Switch(
                                    value: caliO2Value ??= true,
                                    onChanged: (newValue) async {
                                      setState(() => caliO2Value = newValue);
                                      print('CALI > O2> $newValue');
                                    },
                                    activeColor: Color(0xFFF59056),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: Text(
                                      'CO2 Enable',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                  Switch(
                                    value: caliCO2Value ??= true,
                                    onChanged: (newValue) async {
                                      setState(() => caliCO2Value = newValue);
                                      print('CALI > CO2> $newValue');
                                    },
                                    activeColor: Color(0xFFF59056),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
