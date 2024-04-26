import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scanner/models/report_model.dart';

part 'add_report_state.dart';

class AddReportCubit extends Cubit<AddReportState> {
  AddReportCubit() : super(AddReportInitial());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addReport({required ReportModel report}) async {
    emit(AddReportLoading());
    try {
      await firestore.collection('reports').add({
        'product': report.product.toMap(),
        'message': report.message,
      });
      emit(AddReportSuccsess());
    } catch (e) {
      print(e.toString());
      emit(AddReportFailure(errMessage: "Failed to add report: $e"));
    }
  }
}
