import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/models/donate_model.dart';

part 'get_donate_state.dart';

class GetDonateCubit extends Cubit<GetDonateState> {
  GetDonateCubit() : super(GetDonateInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<DonateModel> _donateList = [];

  Future<void> getDonate() async {
    emit(GetDonateLoading());
    try {
      QuerySnapshot querySnapshot = await firestore.collection("donate").get();
      _donateList.clear();
      _donateList = querySnapshot.docs
          .map((doc) => DonateModel.fromSnapshot(doc))
          .toList();
      emit(GetDonateSuccess(donateList: _donateList));
    } catch (e) {
      emit(GetDonateFailure(errMessage: "Failed to fetch products: $e"));
    }
  }
}
