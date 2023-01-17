import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_flutter/connectpageA.dart';

class CommPage extends StatefulWidget {
  const CommPage({Key? key, required this.characteristic}) : super(key: key);

  final BluetoothCharacteristic characteristic;

  @override
  State<CommPage> createState() => _ComPageWidgetState();
}

class _ComPageWidgetState extends State<CommPage> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _textController = TextEditingController();

  ConnectPageState connectPage = ConnectPageState();

  String setData = '';
  String sendData = '';

  @override
  void initState() {
    super.initState();
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

  void checkTextEmpty() {
    String txt;

    txt = _textController.text;

    if (txt.isEmpty) {
      showToast('데이터를 입력하세요');
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
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF162A75),
        title: Text(
          'Communication',
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                    child: Text(
                      'Get',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              connectPage.writeData(widget.characteristic, 'AT+QBLEADDR?');
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF162A75)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                            ),
                            child: Text(
                              'get BLE address',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: SizedBox(
                            width: 300,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                connectPage.writeData(widget.characteristic, 'AT+QBLENAME?');
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Color(0xFF162A75)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                              ),
                              child: Text(
                                'get BLE name',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: SizedBox(
                            width: 300,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                connectPage.writeData(widget.characteristic, 'AT+QBLESTAT');
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Color(0xFF162A75)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                              ),
                              child: Text(
                                'get BLE state',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: SizedBox(
                            width: 300,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                connectPage.writeData(widget.characteristic, "AT+QBLECONNLIST");
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Color(0xFF162A75)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                              ),
                              child: Text(
                                'get connected Devices',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                    child: Text(
                      'Set',
                      style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              _unfocusNode.requestFocus();
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  barrierColor: Colors.transparent,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.indigoAccent,
                                      title: Text(
                                        'set BLE name',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      content: TextField(
                                        autofocus: true,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                          ),
                                        ),
                                        cursorColor: Colors.white12,
                                        controller: _textController,
                                        onChanged: (value) {
                                          setState(() {
                                            setData = value;
                                          });
                                        },
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            checkTextEmpty();
                                            connectPage.writeData(
                                                widget.characteristic, "AT+QBLENAME=$setData");

                                            _textController.clear();
                                            showToast("전송 완료!");
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            '전송',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            _textController.clear();
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            '취소',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF162A75)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                            ),
                            child: Text(
                              'set BLE name',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: 0,
                        ),
                        SizedBox(
                          width: 300,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              _unfocusNode.requestFocus();
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  barrierColor: Colors.transparent,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.indigoAccent,
                                      title: Text(
                                        'Send Messages',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      content: TextField(
                                        autofocus: true,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                          ),
                                        ),
                                        cursorColor: Colors.white12,
                                        controller: _textController,
                                        onChanged: (value) {
                                          setState(() {
                                            sendData = value;
                                          });
                                        },
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            checkTextEmpty();
                                            connectPage.writeData(widget.characteristic, sendData);

                                            _textController.clear();
                                            showToast("전송 완료!");
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            '전송',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            _textController.clear();
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            '취소',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF162A75)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                            ),
                            child: Text(
                              'send msg to BLE module',
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
          ),
        ),
      ),
    );
  }
}
