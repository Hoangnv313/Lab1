import 'package:flutter/material.dart';
import '../models/product_manager.dart'; // Đường dẫn mới
import '../screens/product_detail_screen.dart'; // Import màn hình Detail

class InventoryList extends StatelessWidget {
  const InventoryList({super.key});

  @override
  Widget build(BuildContext context) {
    // Sửa lại cho đúng biến mockProducts
    final products = ProductManager.mockProducts;

    return Expanded(
      flex: 4,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent.withOpacity(0.2),
                child: Text(product.id, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              ),
              title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('Giá: \$${product.price}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              // THÊM SỰ KIỆN ONTAP Ở ĐÂY ĐỂ CHUYỂN TRANG
              onTap: () {
                Navigator.push( // Sử dụng Navigator.push + MaterialPageRoute
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product), // Pass Object
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}