import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key, required this.device});

  final List<DiscoveredDevice> device;

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  int deviceListLength = 0;

  @override
  void initState() {
    super.initState();

    deviceListLength = widget.device.length;
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  String getName(DiscoveredDevice r) {
    String name = '';
    if (r.name.isNotEmpty) {
      name = r.name;
    } else {
      name = 'No Name';
    }

    return name;
  }

  Widget itemList(DiscoveredDevice r) {
    return ListTile(
      title: Text(
        getName(r),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        r.id,
      ),
      leading: IconButton(
        icon: Icon(Icons.link),
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('알림'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[Text('해당 기기를 연결하시겠습니까?')],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('예'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('아니오'),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Bluetooth LE Scan',
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
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                // controller: _scrollController,
                itemBuilder: (context, index) {
                  return itemList(widget.device[index]);
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
