class DonateModel {
  final String text, image, url;
  DonateModel({
    required this.text,
    required this.image,
    required this.url,
  });

  factory DonateModel.fromSnapshot(var data) {
    // Map<String, dynamic> data = docs.data() as Map<String, dynamic>;

    return DonateModel(
      text: data['text'] ?? '',
      image: data['image'] ?? '',
      url: data['url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        'text': text,
        'image': image,
        'url': url,
      };
}
