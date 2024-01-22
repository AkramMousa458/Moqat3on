import 'package:barcode_finder/barcode_finder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scanner/lists/codes_lists.dart';
import 'package:scanner/methods/fetch_product.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitial());

  String scanResult = '';

  void scanfromCamera(String data) {
    if (int.parse(data) != -1) {
      try {
        scanResult = fetchProduct(
            data,
            CodesLists.countryCodes,
            CodesLists.companyCodes8,
            CodesLists.companyCodes7,
            CodesLists.companyCodes6,
            CodesLists.companyCodes5,
            CodesLists.companyCodes4);
        emit(ScanSuccsess());
      } on Exception catch (e) {
        scanResult = '-1';
        emit(ScanFailed(errMessage: e.toString()));
      }
    }
  }

  void scanfromGallery() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        String barcode =
            await BarcodeFinder.scanFile(path: pickedFile.path) ?? '-1';
        scanfromCamera(barcode);
      }
    } catch (e) {
      emit(ScanFailed(errMessage: 'error when pick image'));
    }
  }
}
