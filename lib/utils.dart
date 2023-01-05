import 'dart:typed_data';

import 'package:flutter/material.dart';

class Utils extends StatelessWidget {
  const Utils({Key? key}) : super(key: key);

  List<int>? convertInt2Bytes(value, int bytesSize, Endian order) {
    try {
      int maxBytes = 8;
      var bytes = Uint8List(maxBytes)..buffer.asByteData().setInt64(0, value, order);
      List<int> intArray;

      if (order == Endian.big) {
        intArray = bytes.sublist(maxBytes - bytesSize, maxBytes).toList();
      } else {
        intArray = bytes.sublist(0, bytesSize).toList();
      }
      return intArray;
    } catch (e) {
      print('covert errer: $e');
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
