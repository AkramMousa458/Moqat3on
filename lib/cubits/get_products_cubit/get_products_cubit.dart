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
          await firestore.collection("products").get();
      allProductsList.clear();
      allProductsList = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      emit(GetProductsSuccess(allProducts: allProductsList));
    } catch (e) {
      emit(GetProductsFailure(errMessage: "Failed to fetch products: $e"));
    }
  }

  Future<void> getProductsByCategory(String category) async {
    emit(GetProductsLoading());
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection("products")
          .where("category", isEqualTo: category)
          .get();
      List<ProductModel> filteredProductsList = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      emit(GetProductsSuccess(allProducts: filteredProductsList));
    } catch (e) {
      emit(GetProductsFailure(errMessage: "Failed to fetch products: $e"));
    }
  }
}
