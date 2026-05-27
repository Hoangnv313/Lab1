import 'package:flutter/material.dart';

class InventoryList extends StatelessWidget {
  const InventoryList({super.key});

  @override
  Widget build(BuildContext context) {
    // Bọc Expanded ở ngoài cùng để truyền lên MainScreen tránh lỗi Render
    return Expanded(
      flex: 4,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text('Sản phẩm Demo ${index + 1}'),
              subtitle: const Text('Click để xem chi tiết kho...'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }
}