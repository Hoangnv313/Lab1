import 'package:flutter/material.dart';
import 'dart:convert';
import 'models/product.dart';
import 'models/product_manager.dart';
import 'screens/main_screen.dart';

void testFactoryFromJson() {
  print('--- Test 1: Khởi tạo sản phẩm từ chuỗi JSON ---');
  String jsonString = '{"id": "P05", "name": "Tai nghe Sony WH-1000XM5", "image": "sony_wh.png", "price": 350.0}';
  Map<String, dynamic> parsedJson = jsonDecode(jsonString);
  Product newProduct = Product.fromJson(parsedJson);
  print('Sản phẩm từ JSON factory: $newProduct\n');
  ProductManager.add(newProduct);
}

void testEditAndFind() {
  print('\n--- Test 2: Chỉnh sửa và Tìm kiếm (Find) ---');
  ProductManager.edit('P02', newName: 'iPhone 15 Pro Max', newPrice: 1099.0);
  ProductManager.printAll();
  var found = ProductManager.find('P03');
  print('Kết quả Find ID P03 -> $found\n');
}

void testSearchAndIncreasePrice() {
  print('--- Test 3: Search từ khóa và Tăng giá 10% ---');
  var searchResults = ProductManager.search('msi');
  print('Kết quả Search từ khóa "msi": $searchResults\n');
  ProductManager.increasePrice();
  ProductManager.printAll();
}

// --- HÀM MAIN CHẠY SONG SONG CẢ HAI PHẦN ---
void main() {
  print('==== KHỞI CHẠY LOGIC TEST (CONSOLE) ====\n');

  // Chạy đống logic in ra tab Run/Console cho cô chấm điểm bài cũ
  ProductManager.printAll();
  testFactoryFromJson();
  testEditAndFind();
  testSearchAndIncreasePrice();

  print('==== HOÀN THÀNH LOGIC TEST - KHỞI CHẠY FLUTTER UI ====\n');

  // Kích hoạt giao diện ứng dụng Lab 4
  runApp(const Lab4App());
}

class Lab4App extends StatefulWidget {
  const Lab4App({super.key});

  @override
  State<Lab4App> createState() => _Lab4AppState();
}

class _Lab4AppState extends State<Lab4App> {
  bool isDarkMode = false;

  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 4 - Product Management',
      // Định nghĩa ThemeData sáng/tối để tùy biến [cite: 50]
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // Điều khiển thay đổi giao diện [cite: 51]
      home: MainScreen(
        isDarkMode: isDarkMode,
        onThemeChanged: toggleTheme,
      ),
    );
  }
}