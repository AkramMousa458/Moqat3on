import 'package:scanner/models/product_model.dart';

class ReportModel {
  final ProductModel product;
  final String message;

  ReportModel({
    required this.product,
    required this.message,
  });

  factory ReportModel.fromSnapshot(var docs) {
    Map<String, dynamic> data = docs.data() as Map<String, dynamic>;

    return ReportModel(
      product:  ProductModel.fromSnapshot(data['product']),
      message: data['message'] ?? '',
    );
  }
}
