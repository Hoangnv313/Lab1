import 'package:flutter/material.dart';
import '../widgets/product_info_card.dart';
import '../widgets/product_input_form.dart';
import '../widgets/inventory_list.dart';

class MainScreen extends StatelessWidget { // [cite: 45]
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const MainScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold( // [cite: 45]
      appBar: AppBar( // [cite: 47]
        title: const Text('Lab 4 - Product Management UI'),
        actions: [
          Row(
            children: [
              const Icon(Icons.dark_mode),
              Switch( // Nút toggle theme [cite: 51]
                value: isDarkMode,
                onChanged: onThemeChanged,
                activeColor: Colors.amber,
              ),
              const SizedBox(width: 10),
            ],
          )
        ],
      ),
      body: Column( // [cite: 38]
        children: [
          // Bọc vùng nhập liệu trong Expanded và SingleChildScrollView để chống tràn màn hình (Overflow) [cite: 56]
          Expanded(
            flex: 6,
            child: SingleChildScrollView( // [cite: 56]
              padding: const EdgeInsets.all(16.0), // [cite: 41]
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('1. Core Widgets', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10), // [cite: 39]
                  const ProductInfoCard(), // Gọi Widget bài 1

                  const Divider(height: 30),

                  const Text('2. Input Controls', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const ProductInputForm(), // Gọi Widget bài 2
                ],
              ),
            ),
          ),

          const Divider(thickness: 2, height: 1),

          const Padding( // [cite: 39]
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('3. Inventory List (Real Data)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),

          const InventoryList(), // Gọi danh sách bài 3 & 5 (Hiện dữ liệu thật)
        ],
      ),
      floatingActionButton: FloatingActionButton( // [cite: 49]
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Hệ thống Quản lý sẵn sàng!')),
          );
        },
        child: const Icon(Icons.bolt),
      ),
    );
  }
}