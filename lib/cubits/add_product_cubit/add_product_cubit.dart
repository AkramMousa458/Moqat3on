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
        'boycottReason': "فيروز  دعم لسرئيل  ",
        'country': "مصر",
        'name': "فيروز ",
        'category': "مشروبات",
        'image':
            "https://cdnprod.mafretailproxy.com/sys-master-root/h9f/h8a/49521874403358/480Wx480H_3845_main.jpg",
        'rating': 0.0
      });
      emit(AddProductSuccsess());
    } catch (e) {
      emit(AddProductFailure(errMessage: "Failed to fetch doctors: $e"));
    }
  }
}
