class DonateModel {
  final String name, image, url;
  DonateModel({
    required this.name,
    required this.image,
    required this.url,
  });

  factory DonateModel.fromSnapshot(var data) {
    // Map<String, dynamic> data = docs.data() as Map<String, dynamic>;

    return DonateModel(
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      url: data['url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'image': image,
        'url': url,
      };
}
