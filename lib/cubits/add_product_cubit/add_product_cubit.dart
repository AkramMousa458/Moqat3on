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
        'boycott': "نعم",
        'boycottReason': "بيريل هو دعم للجيش الاسرئيلي",
        'country': "مصر",
        'name': "بيريل",
        'category': "drink",
        'image':
            "https://clockit.io/wp-content/uploads/2023/08/mcdonalds-shift-hours-1000x1000.jpg",
        'rating': 0.0
      });
      emit(AddProductSuccsess());
    } catch (e) {
      emit(AddProductFailure(errMessage: "Failed to fetch doctors: $e"));
    }
  }
}
