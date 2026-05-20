class Product {
  String id;
  String name;
  String image;
  double price;

  // Phương thức khởi tạo (Constructor)
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  // Phương thức factory để map một Json về Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  @override
  String toString() {
    return 'Product(ID: $id, Name: $name, Price: \$${price.toStringAsFixed(1)}, Image: $image)';
  }
}