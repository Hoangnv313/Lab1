import 'product.dart';

class ProductManager {
  // Danh sách tĩnh gồm List<Product> (gán một số giá trị mặc định)
  static List<Product> mockProducts = [
    Product(id: 'P01', name: 'Laptop MSI Katana', image: 'msi_katana.png', price: 1200.0),
    Product(id: 'P02', name: 'iPhone 15 Pro', image: 'iphone15.png', price: 1000.0),
    Product(id: 'P03', name: 'Bàn phím cơ Akko', image: 'akko_3098.png', price: 80.0),
    Product(id: 'P04', name: 'Chuột Gaming Logitech', image: 'g102.png', price: 50.0),
  ];

  // Phương thức add(product)
  static void add(Product product) {
    mockProducts.add(product);
    print('-> Đã thêm thành công sản phẩm: ${product.name}');
  }

  // Phương thức Edit(product) dựa trên ID
  static void edit(String id, {String? newName, String? newImage, double? newPrice}) {
    try {
      Product found = mockProducts.firstWhere((p) => p.id == id);
      if (newName != null) found.name = newName;
      if (newImage != null) found.image = newImage;
      if (newPrice != null) found.price = newPrice;
      print('-> Đã cập nhật thành công sản phẩm ID: $id');
    } catch (e) {
      print('-> [Lỗi] Không tìm thấy sản phẩm có ID: $id để sửa.');
    }
  }

  // Phương thức Find: Tìm kiếm chính xác đối tượng đầu tiên trùng ID
  static Product? find(String id) {
    try {
      return mockProducts.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  // Phương thức Search khác nhau: Tìm kiếm theo từ khóa chứa trong tên
  static List<Product> search(String keyword) {
    return mockProducts
        .where((p) => p.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  // Phương thức increasePrice để tăng giá lên 10% dùng declarative-map
  static void increasePrice() {
    mockProducts = mockProducts.map((product) {
      product.price = product.price * 1.1; // Tăng giá gốc lên 10%
      return product;
    }).toList();
    print('-> Đã tăng giá 10% toàn bộ sản phẩm bằng Declarative map()!');
  }

  // Hàm in danh sách ra console để kiểm tra kết quả
  static void printAll() {
    print('--- DANH SÁCH SẢN PHẨM HIỆN TẠI ---');
    for (var p in mockProducts) {
      print(p);
    }
    print('-------------------------------------\n');
  }
}