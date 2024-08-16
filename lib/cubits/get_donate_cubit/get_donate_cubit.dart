import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/core/api_service.dart';
import 'package:scanner/core/failure.dart';
import 'package:scanner/models/donate_model.dart';

part 'get_donate_state.dart';

class GetDonateCubit extends Cubit<GetDonateState> {
  GetDonateCubit() : super(GetDonateInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final ApiService _apiService = ApiService();
  List<DonateModel> donateList = [];

  Future<void> getDonate() async {
    emit(GetDonateLoading());
    try {
      var data = await _apiService.get(endPoint: 'denotion/getAllDenotion');

      // QuerySnapshot querySnapshot = await firestore.collection("donate").get();
      // _donateList.clear();
      // _donateList = querySnapshot.docs
      //     .map((doc) => DonateModel.fromSnapshot(doc))
      //     .toList();

      List<dynamic> donatesData = data['data'];
      donateList = donatesData
          .map(
            (donateData) => DonateModel.fromSnapshot(donateData),
          )
          .toList();
      emit(GetDonateSuccess(donateList: donateList));
    } catch (e) {
      if (e is DioException) {
        emit(GetDonateFailure(
            errMessage: ServerFailure.fromDioError(e).errMessage));
      } else {
        emit(GetDonateFailure(
            errMessage: ServerFailure(e.toString()).errMessage));
      }
      emit(
          GetDonateFailure(errMessage: ServerFailure(e.toString()).errMessage));
    }
  }
}
