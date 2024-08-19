// import 'package:barcode_finder/barcode_finder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scanner/helper/fetch_product.dart';
import 'package:scanner/models/company_barcode_model.dart';
import 'package:scanner/models/country_barcode_model.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitial());

  String scanResult = '';

  void scanfromCamera(
      {required List<CountryBarcodeModel> countriesBarcodes,
      required List<CompanyBarcodeModel> companiesBarcodes,
      required String data}) {
    emit(ScanLoading());
    if (int.parse(data) != -1) {
      try {
        scanResult = fetchProduct(
          productCode: data, countriesBarcodes: countriesBarcodes,
          companiesBarcodes: companiesBarcodes,
        );
        emit(ScanSuccsessCamera());
      } on Exception catch (e) {
        scanResult = '-1';
        emit(ScanFailed(errMessage: e.toString()));
      }
    }
  }

  void scanfromGallery({
    required List<CountryBarcodeModel> countriesBarcodes,
    required List<CompanyBarcodeModel> companiesBarcodes,
  }) async {
    // emit(ScanLoading());
    // try {
    //   final pickedFile =
    //       await ImagePicker().pickImage(source: ImageSource.gallery);
    //   if (pickedFile != null) {
    //     String barcode =
    //         await BarcodeFinder.scanFile(path: pickedFile.path) ?? '-1';
    //     if (int.parse(barcode) != -1) {
    //       try {
    //         scanResult = fetchProduct(
    //           productCode: barcode,
    //           countriesBarcodes: countriesBarcodes,
    //           companiesBarcodes: companiesBarcodes,
    //         );
    //         emit(ScanSuccsessGallery());
    //       } on Exception catch (e) {
    //         scanResult = '-1';
    //         emit(ScanFailed(errMessage: e.toString()));
    //       }
    //     }
    //   } else {
    //     emit(ScanInitial());
    //   }
    // } catch (e) {
    //   scanResult = '';
    //   emit(ScanFailed(errMessage: 'يوجد خطأ! تأكد من الصورة المراد مسحها'));
    // }
  }

  void scanfromNumber({
    required List<CountryBarcodeModel> countriesBarcodes,
    required List<CompanyBarcodeModel> companiesBarcodes,
    required String data,
  }) {
    emit(ScanLoading());
    if (int.parse(data) != -1) {
      try {
        scanResult = fetchProduct(
          productCode: data,
          countriesBarcodes: countriesBarcodes,
          companiesBarcodes: companiesBarcodes,
        );
        emit(ScanSuccsessNumber());
      } on Exception catch (e) {
        scanResult = '-1';
        emit(ScanFailed(errMessage: e.toString()));
      }
    }
  }
}
