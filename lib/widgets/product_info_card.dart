import 'package:flutter/material.dart';

class ProductInfoCard extends StatelessWidget {
  const ProductInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card( // [cite: 26]
      elevation: 4,
      child: Column(
        children: [
          Image.network( // [cite: 25]
            'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=500',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 100),
          ),
          const ListTile( // [cite: 26]
            leading: Icon(Icons.inventory, color: Colors.blue),
            title: Text('Laptop Gaming MSI Katana', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Giá: \$999 - Cấu hình cao'),
          ),
        ],
      ),
    );
  }
}