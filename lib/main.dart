import 'dart:convert';
import 'product.dart';
import 'product_manager.dart';

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

void main() {
  print('==== KHỞI CHẠY LAB 1 (DART FLUTTER ) ====\n');

  // In danh sách mặc định ban đầu
  ProductManager.printAll();

  // Chạy các hàm kiểm thử
  testFactoryFromJson();
  testEditAndFind();
  testSearchAndIncreasePrice();

  print('==== HOÀN THÀNH BÀI LAB 1 ====');
}