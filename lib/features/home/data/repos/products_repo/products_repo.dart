import 'package:dartz/dartz.dart';
import '../../../../../core/networking/api_failure.dart';
import '../../models/products_model.dart';

abstract class ProductsRepo {
  Future<Either<Failure,List<ProductsModel>>> getTodayDealsProducts();
  Future<Either<Failure,List<ProductsModel>>> fetchProductsByCategory(String category);
}