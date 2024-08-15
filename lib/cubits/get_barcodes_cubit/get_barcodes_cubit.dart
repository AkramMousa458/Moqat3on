import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/core/api_service.dart';
import 'package:scanner/models/company_barcode_model.dart';
import 'package:scanner/models/country_barcode_model.dart';

part 'get_barcodes_state.dart';

class GetBarcodesCubit extends Cubit<GetBarcodesState> {
  GetBarcodesCubit(this._apiService) : super(GetBarcodesInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final ApiService _apiService;

  List<CompanyBarcodeModel> companiesBarcodesList = [];
  List<CountryBarcodeModel> countriesBarcodesList = [];

  Future<void> getCompaniesBarcodes() async {
    emit(GetBarcodesLoading());
    try {
      var data =
          await _apiService.get(endPoint: 'companyCode/getAllCompanyCode');
      List<dynamic> barcodesData = data['data'];
      companiesBarcodesList = barcodesData
          .map(
            (barcode) => CompanyBarcodeModel.fromSnapshot(barcode),
          )
          .toList();

      emit(GetBarcodesSuccess());
    } catch (e) {
      emit(GetBarcodesFailure(errMessage: "Failed to fetch products: $e"));
    }
  }

  Future<void> getCountriesBarcodes() async {
    emit(GetBarcodesLoading());
    try {
      var data =
          await _apiService.get(endPoint: 'countryCode/getAllCountryCode');
      List<dynamic> barcodesData = data['data'];
      countriesBarcodesList = barcodesData
          .map(
            (barcode) => CountryBarcodeModel.fromSnapshot(barcode),
          )
          .toList();
      emit(GetBarcodesSuccess());
    } catch (e) {
      emit(GetBarcodesFailure(errMessage: "Failed to fetch products: $e"));
    }
  }
}
