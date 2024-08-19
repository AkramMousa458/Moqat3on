import 'dart:convert';

import 'package:flutter/foundation.dart';

class CompanyBarcodeModel {
  final String name;
  final int barcodeNumber;

  CompanyBarcodeModel({
    required this.name,
    required this.barcodeNumber,
  });

  factory CompanyBarcodeModel.fromSnapshot(var data) {
    // Map<String, dynamic> data = docs.data() as Map<String, dynamic>;

    return CompanyBarcodeModel(
      name: data['name'] ?? '',
      barcodeNumber: data['barcodeNumber'] ?? 0,
    );
  }

  // Method to encode this object to a JSON-like map
  Map<String, dynamic> toMap() => {
        'name': name,
        'barcodeNumber': barcodeNumber,
      };

  // Method to print the data in JSON format
  String toJson() => jsonEncode(toMap());

}
