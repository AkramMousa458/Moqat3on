import 'package:flutter/material.dart';
import 'package:scanner/widgets/barcode_scanner_widget.dart';

void barcodeScanner(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext builder) {
      return SizedBox(
        height: MediaQuery.of(context).size.height / 1.3,
        child: Scaffold(
          appBar: barcodeScannerAppBar(context),
          body: barcodeScannerBody(context),
        ),
      );
    },
  );
}
