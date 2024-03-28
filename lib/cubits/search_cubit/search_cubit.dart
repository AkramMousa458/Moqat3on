import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/lists/chips_lists.dart';
import 'package:scanner/models/product_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  List<ProductModel> filteredList = [];

  void searchUsers(String searchQuery, List<ProductModel> productList) {
    emit(SearchLoading());

    try {
      // Filter products based on search query
      for (var product in productList) {
        if (_calculateRelevance(product, searchQuery) > 0) {
          filteredList.add(product);
        }
      }

      // Sort filteredList based on relevance
      filteredList.sort((a, b) {
        int relevanceA = _calculateRelevance(a, searchQuery);
        int relevanceB = _calculateRelevance(b, searchQuery);
        return relevanceB.compareTo(relevanceA);
      });

      emit(SearchSuccess());
    } catch (e) {
      emit(SearchFailure(
          errMessage: 'Error in search product: ${e.toString()}'));
    }
  }

  int _calculateRelevance(ProductModel product, String searchQuery) {
    String productName = product.name.toLowerCase();
    String searchQueryLowerCase = searchQuery.toLowerCase();

    if (productName.contains(searchQueryLowerCase)) {
      return 1; // Return 1 if the search query is found in the product name
    } else {
      return 0; // Return 0 if the search query is not found in the product name
    }
  }
}
