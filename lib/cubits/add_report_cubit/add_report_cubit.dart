import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scanner/core/api_service.dart';
import 'package:scanner/models/report_model.dart';

part 'add_report_state.dart';

class AddReportCubit extends Cubit<AddReportState> {
  AddReportCubit(this._apiService) : super(AddReportInitial());
  final ApiService _apiService;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addReport({required ReportModel report}) async {
    emit(AddReportLoading());
    try {
      await _apiService.post(
          endPoint: 'report/createReport',
          data: {"message": report.message, "productId": report.productId});
      // await firestore.collection('reports').add({
      //   'userEmail': report.userEmail,
      //   'userName': report.userName,
      //   'product': report.product.toMap(),
      //   'message': report.message,
      // });
      emit(AddReportSuccsess());
    } catch (e) {
      emit(AddReportFailure(errMessage: "Failed to add report: $e"));
    }
  }
}
