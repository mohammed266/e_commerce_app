import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/products_repo/products_repo_impl.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  //dio & ApiService
  Dio dio = await DioFactory.getInstance();
  getIt.registerSingleton<ApiService>(ApiService(dio));
  //repos
  getIt.registerSingleton<ProductsRepoImpl>(
      ProductsRepoImpl( getIt.get<ApiService>()));

}