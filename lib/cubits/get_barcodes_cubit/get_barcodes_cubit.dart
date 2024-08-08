import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/models/company_barcode_model.dart';
import 'package:scanner/models/country_barcode_model.dart';

part 'get_barcodes_state.dart';

class GetBarcodesCubit extends Cubit<GetBarcodesState> {
  GetBarcodesCubit() : super(GetBarcodesInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<CompanyBarcodeModel> companiesBarcodesList = [];
  List<CountryBarcodeModel> countriesBarcodesList = [];

  Future<void> getCompaniesBarcodes() async {
    emit(GetBarcodesLoading());
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection("companiesBarcode").get();
      companiesBarcodesList.clear();
      companiesBarcodesList = querySnapshot.docs
          .map((doc) => CompanyBarcodeModel.fromSnapshot(doc))
          .toList();
      emit(GetBarcodesSuccess());
      // for (var element in companiesBarcodesList) {
      //   element.toMap();
      // }
    } catch (e) {
      emit(GetBarcodesFailure(errMessage: "Failed to fetch products: $e"));
    }
  }

  Future<void> getCountriesBarcodes() async {
    emit(GetBarcodesLoading());
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection("countriesBarcode").get();
      countriesBarcodesList.clear();
      countriesBarcodesList = querySnapshot.docs
          .map((doc) => CountryBarcodeModel.fromSnapshot(doc))
          .toList();
      emit(GetBarcodesSuccess());
    } catch (e) {
      emit(GetBarcodesFailure(errMessage: "Failed to fetch products: $e"));
    }
  }
}
