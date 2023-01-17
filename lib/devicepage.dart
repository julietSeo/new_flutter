import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'connectpage.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key, required this.devices});

  final List<ScanResult> devices;

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  int deviceListLength = 0;

  @override
  void initState() {
    super.initState();
    deviceListLength = widget.devices.length;

    if (deviceListLength > 0) {
      print('이게 잘 될까 ==> ${widget.devices[0].device.id}');
      Fluttertoast.showToast(
          msg: 'No devices Paired',
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.teal,
          textColor: Colors.white);
    } else {
      Fluttertoast.showToast(
        msg: 'No Devices detected',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.teal,
      );
    }

    // TODO: must be deleted later
    var result = utf8.encode('AT+QVERSION\r\n'); //41 54 2b 51 56 45 52 53 49 4f 4e 0d 0a
    print('result >> ${hex.encode(result)}');
  }

  String setDeviceName(ScanResult result) {
    String deviceName = '';

    if (result.device.name.isNotEmpty) {
      deviceName = result.device.name;
    } else {
      deviceName = 'No Name';
    }

    return deviceName;
  }

  Widget itemList(ScanResult r) {
    return ListTile(
      title: Text(
        setDeviceName(r),
        style: TextStyle(fontFamily: 'Poppins'),
      ),
      subtitle: Text(
        r.device.id.id,
        style: TextStyle(
          fontSize: 13,
          fontFamily: 'Poppins_reg',
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.link),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ConnectPage(device: r.device)),
            // MaterialPageRoute(builder: (context) => ConnectPageA(device: r.device)),
          );
          // showDialog(
          //   context: context,
          //   barrierDismissible: true,
          //   builder: (BuildContext context) {
          //     return AlertDialog(
          //       title: Text('알림'),
          //       content: SingleChildScrollView(
          //         child: ListBody(
          //           children: <Widget>[Text('해당 기기를 연결하시겠습니까?')],
          //         ),
          //       ),
          //       actions: <Widget>[
          //         TextButton(
          //           onPressed: () async {
          //             await Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => ConnectPage(device: r.device)),
          //             );
          //             setState(() {
          //               Navigator.pop(context);
          //             });
          //           },
          //           child: Text('예'),
          //         ),
          //         TextButton(
          //           onPressed: () => Navigator.of(context).pop(),
          //           child: Text('아니오'),
          //         )
          //       ],
          //     );
          //   },
          // );
        },
      ),
      onTap: () {
        //TODO: pairing device
        // showDialog(
        //   context: context,
        //   barrierDismissible: true,
        //   builder: (BuildContext context) {
        //     return AlertDialog(
        //       title: Text('알림'),
        //       content: SingleChildScrollView(
        //         child: ListBody(
        //           children: <Widget>[Text('해당 기기를 연결하시겠습니까?')],
        //         ),
        //       ),
        //       actions: <Widget>[
        //         TextButton(
        //           onPressed: () async {
        //             await Navigator.push(
        //               context,
        //               MaterialPageRoute(builder: (context) => ConnectPageC(device: r.device)),
        //             );
        //             setState(() {
        //               Navigator.pop(context);
        //             });
        //           },
        //           child: Text('예'),
        //         ),
        //         TextButton(
        //           onPressed: () => Navigator.of(context).pop(),
        //           child: Text('아니오'),
        //         )
        //       ],
        //     );
        //   },
        // );
      },
    );
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Bluetooth Connection',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(-0.9, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: Text(
                  'Nearby Devices',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                // controller: _scrollController,
                itemBuilder: (context, index) {
                  return itemList(widget.devices[index]);
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: deviceListLength,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
