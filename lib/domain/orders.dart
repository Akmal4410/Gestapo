class Orders {
  final String orderId;
  final String productName;
  final String image;
  final int size;
  final int price;
  final int cartCount;
  final bool isActive;
  final int deliveryProcess;
  final String payment;
  final String address;

  Orders({
    required this.orderId,
    required this.productName,
    required this.image,
    required this.size,
    required this.price,
    required this.cartCount,
    required this.isActive,
    required this.deliveryProcess,
    required this.payment,
    required this.address,
  });
}
