import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/models/product_model.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addProduct(ProductModel product) async {
    emit(AddProductLoading());
    try {
      // Add the appointment to the "appointments" collection
      await firestore.collection('products').add({
        'boycott': "لا",
        'boycottReason': "جهينه هي افضل المنتجات البديله",
        'country': "مصر",
        'name': "جهينه",
        'category': "جبن وألبان",
        'image':
            "https://gulf365.net/content/uploads/2024/03/27/f2fdad7f9a.jpg",
        'rating': 0.0
      });
      emit(AddProductSuccsess());
    } catch (e) {
      emit(AddProductFailure(errMessage: "Failed to fetch doctors: $e"));
    }
  }
}
