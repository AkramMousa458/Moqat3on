class ProductModel {
  final String name;
  final String category;
  final String boycott;
  final String boycottReason;
  final String country;
  final String image;
  final double ratign;
  ProductModel({
    required this.name,
    required this.category,
    required this.boycott,
    required this.boycottReason,
    required this.country,
    required this.image,
    required this.ratign,
  });

  // Example factory method to create a Product from a JSON-like map
  factory ProductModel.fromSnapshot(var docs) {
    Map<String, dynamic> data = docs.data() as Map<String, dynamic>;

    return ProductModel(
      name: data['name'] ?? '',
      category: data['category'] ?? '',
      boycott: data['boycott'] ?? '',
      boycottReason: data['boycottReason'] ?? '',
      country: data['country'] ?? '',
      image: data['image'] ?? 'https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg',
      ratign: data['ratign'] ??  0.0,
    );
  }

  // Example method to encode this object to a JSON-like map
  Map<String, dynamic> toMap() => {
        'name': name,
        'category': category,
        'boycott': boycott,
        'boycottReason': boycottReason,
        'country': country,
        'image': image,
        'ratign': ratign,
      };
}
