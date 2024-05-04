import 'package:scanner/models/product_model.dart';

class ReportModel {
  final String userEmail;
  final String userName;
  final ProductModel product;
  final String message;

  ReportModel({
    required this.userEmail,
    required this.userName,
    required this.product,
    required this.message,
  });

  factory ReportModel.fromSnapshot(var docs) {
    Map<String, dynamic> data = docs.data() as Map<String, dynamic>;

    return ReportModel(
      userEmail: data['userEmail'],
      userName: data['userName'],
      product: data['product'],
      message: data['message'] ?? '',
    );
  }
}
