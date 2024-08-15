class CountryBarcodeModel {
  final String name, firstCode, lastCode;

  CountryBarcodeModel({
    required this.name,
    required this.firstCode,
    required this.lastCode,
  });

   factory CountryBarcodeModel.fromSnapshot(var data) {
    // Map<String, dynamic> data = docs.data() as Map<String, dynamic>;

    return CountryBarcodeModel(
      name: data['name'] ?? '',
      firstCode: data['firstCode'] ?? 0,
      lastCode: data['lastCode'] ?? 0,
    );
  }
}
