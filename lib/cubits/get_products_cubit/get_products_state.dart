part of 'get_products_cubit.dart';

@immutable
sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsSuccess extends GetProductsState {
  final List<ProductModel> allProducts;
  GetProductsSuccess({required this.allProducts});
}

final class GetProductsFailure extends GetProductsState {
  final String errMessage;

  GetProductsFailure({required this.errMessage});
}
