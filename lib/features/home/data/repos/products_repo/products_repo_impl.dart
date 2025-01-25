import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/networking/api_endpoints.dart';
import '../../../../../core/networking/api_service.dart';
import '../../../../../core/networking/api_failure.dart';
import '../../models/products_model.dart';

import 'products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ApiService apiService;

  ProductsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<ProductsModel>>> getTodayDealsProducts() async {
    try {
      final response =
          await apiService.get(endpoint: ApiEndpoints.getTodayDealsProducts());

      // Safely check if the response contains a non-null list under "products"
      if (response["products"] is List) {
        List<ProductsModel> products = [];
        for (var item in response["products"]) {
          // Ensure that item is not null and is of the correct structure
          if (item != null) {
            products.add(ProductsModel.fromJson(item));
          }
        }
        return Right(products);
      } else {
        // Handle the case where "products" is not a list
        return Left(
            ServerFailure("Invalid response format: products not found."));
      }
    } catch (e) {
      // Error handling, specifically for DioException and generic error
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductsModel>>> fetchProductsByCategory(
      String category) async {
    try {
      final response = await apiService.get(
          endpoint: ApiEndpoints.fetchProductsByCategory(category));
      List<ProductsModel> categoryList = [];
      for (var item in response["products"]) {
        categoryList.add(ProductsModel.fromJson(item));
      }
      return Right(categoryList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
