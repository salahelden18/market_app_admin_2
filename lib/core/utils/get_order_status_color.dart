import 'package:flutter/material.dart';

Color getOrderStatusColor(String status) {
  final statusName = status.toLowerCase();

  if (statusName.startsWith('canceled')) {
    return Colors.red;
  } else if (statusName == "delivered") {
    return Colors.green;
  } else {
    return Colors.amber;
  }
}
