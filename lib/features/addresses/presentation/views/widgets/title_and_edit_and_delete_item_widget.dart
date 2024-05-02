import 'package:flutter/material.dart';

class TitleAndEditAndDeleteItemWidget extends StatelessWidget {
  final String title;
  final String id;
  final VoidCallback deleteOnTap;
  final VoidCallback editOnTap;

  const TitleAndEditAndDeleteItemWidget({
    super.key,
    required this.title,
    required this.id,
    required this.deleteOnTap,
    required this.editOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
          IconButton(
            onPressed: editOnTap,
            icon: const Icon(Icons.edit, color: Colors.amber),
          ),
          IconButton(
            onPressed: deleteOnTap,
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
