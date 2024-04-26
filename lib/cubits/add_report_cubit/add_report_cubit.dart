import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scanner/models/report_model.dart';

part 'add_report_state.dart';

class AddReportCubit extends Cubit<AddReportState> {
  AddReportCubit() : super(AddReportInitial());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addReport(ReportModel product) async {
    emit(AddReportLoading());
    try {
      await firestore.collection('reports').add({
        'product': product.product,
        'message': product.message,
      });
      emit(AddReportSuccsess());
    } catch (e) {
      emit(AddReportFailure(errMessage: "Failed to add report: $e"));
    }
  }
}
