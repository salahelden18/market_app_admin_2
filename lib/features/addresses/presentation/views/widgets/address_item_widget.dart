import 'package:flutter/material.dart';

class AddressItemWidget extends StatelessWidget {
  final String addressTitle;

  const AddressItemWidget({super.key, required this.addressTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        addressTitle,
        style: const TextStyle(fontSize: 16.0, color: Colors.black),
      ),
    );
  }
}
