part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductsModel> productsList;

  ProductsSuccess(this.productsList);
}

final class ProductsFailure extends ProductsState {
  final String errMessage;

  ProductsFailure(this.errMessage);
}

final class CategoryLoading extends ProductsState {}

final class CategorySuccess extends ProductsState {
  final List<ProductsModel> categoryList;

  CategorySuccess(this.categoryList);
}

final class CategoryFailure extends ProductsState {
  final String errMessage;

  CategoryFailure(this.errMessage);
}
