import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/core/api_service.dart';
import 'package:scanner/core/failure.dart';
import 'package:scanner/models/product_model.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this._apiService) : super(GetProductsInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final ApiService _apiService;

  List<ProductModel> allProductsList = [];

  Future<void> getAllProducts() async {
    emit(GetProductsLoading());
    try {
      var data = await _apiService.get(endPoint: 'product/getAllProduct');
      List<dynamic> productsData = data['data'];
      allProductsList = productsData
          .map(
            (product) => ProductModel.fromSnapshot(product),
          )
          .toList();
      emit(GetProductsSuccess(allProducts: allProductsList));
    } catch (e) {
      if (e is DioException) {
        emit(GetProductsFailure(
            errMessage: ServerFailure.fromDioError(e).errMessage));
      } else {
        emit(GetProductsFailure(
            errMessage: ServerFailure(e.toString()).errMessage));
      }
    }
  }

  Future<void> getProductsByCategory(String category) async {
    emit(GetProductsLoading());
    try {
      List<ProductModel> filteredProductsList = [];
      for (var element in allProductsList) {
        if (element.category.toLowerCase() == category.toLowerCase()) {
          filteredProductsList.add(element);
        }
      }

      emit(GetProductsSuccess(allProducts: filteredProductsList));
    } catch (e) {
      emit(GetProductsFailure(errMessage: "Failed to fetch products: $e"));
    }
  }
}
