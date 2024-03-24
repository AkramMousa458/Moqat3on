import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/models/product_model.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addProdt(ProductModel product) async {
    emit(AddProductLoading());
    try {
      // Add the appointment to the "appointments" collection
      await firestore.collection('products').add({
        'name': product.name,
        'image': product.image,
      });
      emit(AddProductSuccsess());
    } catch (e) {
      emit(AddProductFailure(errMessage: "Failed to fetch doctors: $e"));
    }
  }
}

