import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/models/product_model.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<ProductModel> allProductsList = [];

  Future<void> getAllProducts() async {
    emit(GetProductsLoading());
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection("Products").get();
      allProductsList.clear();
      allProductsList = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      for (var element in allProductsList) {
        print('----------------------------------------');
        print('Name : ${element.name}');
        print('Contry : ${element.country}');
        print('boycottReason : ${element.boycottReason}');
        print('boycott : ${element.boycott}');
        print('----------------------------------------');
      }
      
      
      emit(GetProductsSuccess(allProducts: allProductsList));
    } catch (e) {
      emit(GetProductsFailure(errMessage: "Failed to fetch doctors: $e"));
    }
  }
}
