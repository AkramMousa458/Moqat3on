class CompanyBarcodeModel {
  final String name;
  final int barcodeNumber;

  CompanyBarcodeModel({
    required this.name,
    required this.barcodeNumber,
  });

  factory CompanyBarcodeModel.fromSnapshot(var docs) {
    Map<String, dynamic> data = docs.data() as Map<String, dynamic>;

    return CompanyBarcodeModel(
      name: data['name'] ?? '',
      barcodeNumber: data['barcodeNumber'] ?? 0,
    );
  }
}
