import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product; // Nhận Object Product từ trang trước

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar trong suốt để ảnh Hero tràn lên trên đẹp hơn
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, shadows: [Shadow(blurRadius: 10, color: Colors.black)]),
          onPressed: () => Navigator.pop(context), // Nút Back trở về Home
        ),
      ),
      // Bọc SingleChildScrollView để responsive và có thể cuộn [cite: 89]
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Hero Banner: Hiển thị ảnh sản phẩm [cite: 79]
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=800&auto=format&fit=crop', // Ảnh minh họa độ nét cao
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 350,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported, size: 50),
                  ),
                ),
                // Gradient mờ làm nổi bật chữ [cite: 79]
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                    ),
                  ),
                ),
                // Tên sản phẩm đè lên ảnh
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    product.name,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. Giá và Chips phân loại [cite: 80]
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(1)}',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                      ),
                      Wrap(
                        spacing: 8,
                        children: const [
                          Chip(label: Text('In Stock'), backgroundColor: Colors.greenAccent),
                          Chip(label: Text('Tech')),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // 3. Action Buttons (Favorite / Rate / Share) [cite: 82]
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(Icons.favorite_border, 'Favorite'),
                      _buildActionButton(Icons.star_border, 'Rate'),
                      _buildActionButton(Icons.share, 'Share'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(),

                  // 4. Overview Text (Mô tả) [cite: 81]
                  const Text('Overview', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    'Đây là màn hình chi tiết sản phẩm.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.blueAccent, size: 28),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500)),
      ],
    );
  }
}