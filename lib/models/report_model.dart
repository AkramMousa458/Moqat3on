class ReportModel {
  final int productId;
  final String message;

  ReportModel({
    required this.productId,
    required this.message,
  });

  factory ReportModel.fromSnapshot(var data) {
    // Map<String, dynamic> data = docs.data() as Map<String, dynamic>;

    return ReportModel(
      productId: data['id'],
      message: data['message'] ?? '',
    );
  }
}
