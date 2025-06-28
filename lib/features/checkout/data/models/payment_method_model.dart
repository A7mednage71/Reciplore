class PaymentMethodModel {
  final String name;
  final String image;
  final bool isAvailable;

  PaymentMethodModel({
    required this.name,
    required this.image,
     this.isAvailable = true,
  });
}
