import '../../../data/repos/products_repo/products_repo.dart';
import 'package:flutter/material.dart';
import "../../../data/models/products_model.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  Future<void> getTodayDealsProducts() async {
    emit(ProductsLoading());
    var result = await productsRepo.getTodayDealsProducts();

    result.fold((failure) {
      emit(ProductsFailure(failure.message));
    }, (productsList) {
      emit(ProductsSuccess(productsList));
    });
  }

  Future<void> fetchProductsByCategory(String category) async {
    emit(CategoryLoading());
    var result = await productsRepo.fetchProductsByCategory(category);

    result.fold((failure) {
      emit(CategoryFailure(failure.message));
    }, (categoryList) {
      emit(CategorySuccess(categoryList));
    });
  }
}
