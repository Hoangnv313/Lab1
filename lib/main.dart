import 'package:flutter/material.dart';
import 'dart:convert';
import 'product.dart';
import 'product_manager.dart';

// --- GIỮ NGUYÊN CÁC HÀM LOGIC TEST CỦA BẠN ---
void testFactoryFromJson() {
  print('--- Test 1: Khởi tạo sản phẩm từ chuỗi JSON ---');
  String jsonString = '{"id": "P05", "name": "Tai nghe Sony WH-1000XM5", "image": "sony_wh.png", "price": 350.0}';
  Map<String, dynamic> parsedJson = jsonDecode(jsonString);
  Product newProduct = Product.fromJson(parsedJson);
  print('Sản phẩm từ JSON factory: $newProduct\n');

  // Test luôn hàm add(product)
  ProductManager.add(newProduct);
}

void testEditAndFind() {
  print('\n--- Test 2: Chỉnh sửa và Tìm kiếm (Find) ---');
  // Sửa sản phẩm P02
  ProductManager.edit('P02', newName: 'iPhone 15 Pro Max', newPrice: 1099.0);
  ProductManager.printAll();

  // Tìm kiếm chính xác (Find)
  var found = ProductManager.find('P03');
  print('Kết quả Find ID P03 -> $found\n');
}

void testSearchAndIncreasePrice() {
  print('--- Test 3: Search từ khóa và Tăng giá 10% ---');
  // Tìm kiếm linh hoạt
  var searchResults = ProductManager.search('msi');
  print('Kết quả Search từ khóa "msi": $searchResults\n');

  // Tăng giá bằng declarative-map
  ProductManager.increasePrice();
  ProductManager.printAll();
}

// --- HÀM MAIN: VỪA CHẠY LOGIC TEST, VỪA KHỞI CHẠY APP UI ---
void main() {
  print('==== KHỞI CHẠY LAB 1 (DART FLUTTER ) ====\n');

  // 1. Chạy đống logic in ra tab Console cho cô chấm điểm
  ProductManager.printAll();
  testFactoryFromJson();
  testEditAndFind();
  testSearchAndIncreasePrice();

  print('==== HOÀN THÀNH BÀI LAB 1 ====');

  // 2. Kích hoạt giao diện ứng dụng để hiển thị ảnh lên Chrome
  runApp(const MyApp());
}

// --- PHẦN GIAO DIỆN APP CÓ CHỨA ẢNH ---
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quản lý sản phẩm Lab 1',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý sản phẩm - Lab 1'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '==== KHỞI CHẠY LAB 1 (DART FLUTTER) ====',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Dùng hẳn Unsplash link để vượt rào CORS load ảnh cực nét
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=500&auto=format&fit=crop',
                width: 400,
                height: 250,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    width: 400,
                    height: 250,
                    color: Colors.grey[200],
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Đang tải hiển thị dữ liệu hình ảnh...');
                },
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              'Kết quả Test dữ liệu đã in đầy đủ tại tab Console bên dưới!',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}