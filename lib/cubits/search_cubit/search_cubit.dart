import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/lists/chips_lists.dart';
import 'package:scanner/models/product_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  List<ProductModel> filteredList = [];

  void searchUsers(String searchQuery) {
    emit(SearchLoading());// Sort users based on relevance to search query
    
    try {
      chipsBannedProductList.sort((a, b) {
        // Calculate relevance of each user to the search query
        int relevanceA = _calculateRelevance(a, searchQuery);
        int relevanceB = _calculateRelevance(b, searchQuery);

        emit(SearchSuccess());
        // Sort based on relevance
        return relevanceB.compareTo(relevanceA);

      });
    } catch (e) {
      emit(SearchFailure(
          errMessage: 'Error in search product: ${e.toString()}'));
    }
  }

  int _calculateRelevance(ProductModel product, String searchQuery) {
    String fullName = '${product.name} ${product.name}';
    String searchQueryLowerCase = searchQuery.toLowerCase();

    if (fullName.toLowerCase().contains(searchQueryLowerCase)) {
      return 1;
    } else {
      return 0;
    }
  }
}
