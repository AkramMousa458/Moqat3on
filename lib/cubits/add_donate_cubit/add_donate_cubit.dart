
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/models/donate_model.dart';

part 'add_donate_state.dart';

class AddDonateCubit extends Cubit<AddDonateState> {
  AddDonateCubit() : super(AddDonateInitial());

    final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addDonate(DonateModel donateModel) async {
    emit(AddDonateLoading());
    try {
      await firestore.collection('donate').add({
        'text': donateModel.text,
        'image': donateModel.image,
        'url': donateModel.url,
      });
      emit(AddDonateSuccess());
    } catch (e) {
      emit(AddDonateFailure(errMessage: "Failed to add donate : $e"));
    }
  }
}
