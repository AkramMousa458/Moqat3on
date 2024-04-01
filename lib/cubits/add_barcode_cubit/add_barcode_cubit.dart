import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/models/company_barcode_model.dart';
import 'package:scanner/models/country_barcode_model.dart';

part 'add_barcode_state.dart';

class AddBarcodeCubit extends Cubit<AddBarcodeState> {
  AddBarcodeCubit() : super(AddBarcodeInitial());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addCompanyBarcode(CompanyBarcodeModel barcodeModel) async {
    emit(AddBarcodeLoading());
    try {
      await firestore.collection('companiesBarcode').add({
        'name': barcodeModel.name,
        'barcodeNumber': barcodeModel.barcodeNumber,
      });
      emit(AddBarcodeSuccess());
    } catch (e) {
      emit(AddBarcodeFailure(errMessage: "Failed to add barcode : $e"));
    }
  }

  Future<void> addCountryBarcode(CountryBarcodeModel barcodeModel) async {
    emit(AddBarcodeLoading());
    try {
      await firestore.collection('countriesBarcode').add({
        'name': barcodeModel.name,
        'firstCode': barcodeModel.firstCode,
        'lastCode': barcodeModel.lastCode,
      });
      emit(AddBarcodeSuccess());
    } catch (e) {
      emit(AddBarcodeFailure(errMessage: "Failed to add barcode : $e"));
    }
  }
}
