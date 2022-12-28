import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String productName;
  final List<dynamic> images;
  final String description;
  final String category;
  final String size;
  final String price;

  Product({
    required this.productName,
    required this.images,
    required this.description,
    required this.category,
    required this.size,
    required this.price,
  });

  Map<String, dynamic> toJason() {
    return {
      'product': productName,
      'images': images,
      'description': description,
      'category': category,
      'size': size,
      'price': price,
    };
  }

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['product'],
      images: json['images'],
      description: json['description'],
      category: json['category'],
      size: json['size'],
      price: json['price'],
    );
  }

  static Stream<List<Product>> getProducts() {
    return FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Admin')
        .collection('Products')
        .snapshots()
        .map(
          (snapshots) => snapshots.docs
              .map(
                (docs) => Product.fromJson(docs.data()),
              )
              .toList(),
        );
  }

  static Future<void> addProduct({
    required String productName,
    required List<String> images,
    required String description,
    required String category,
    required String size,
    required String price,
  }) async {
    final docProduct = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Admin')
        .collection('Products')
        .doc(productName);

    final product = Product(
      productName: productName,
      images: images,
      description: description,
      category: category,
      size: size,
      price: price,
    );

    final json = product.toJason();
    await docProduct.set(json);
  }
}
