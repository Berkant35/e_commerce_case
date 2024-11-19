import 'package:e_commerce_case/core/api_helper/api_connector.dart';
import 'package:e_commerce_case/core/locale_helper/hive_connector.dart';
import 'package:e_commerce_case/features/home/data/datasources/api_datasource/remote_datasource.dart';
import 'package:e_commerce_case/features/home/data/datasources/api_datasource/remote_datasource_imp.dart';
import 'package:e_commerce_case/features/home/data/datasources/locale_datasource/locale_datasource.dart';
import 'package:e_commerce_case/features/home/data/repositories/home_repositories_imp.dart';
import 'package:e_commerce_case/features/home/domain/repositories/home_repository.dart';
import 'package:e_commerce_case/features/home/domain/usecases/get_categories.dart';
import 'package:e_commerce_case/features/home/domain/usecases/get_product_by_categories.dart';
import 'package:e_commerce_case/features/home/domain/usecases/get_product_detail.dart';
import 'package:get_it/get_it.dart';
import 'features/home/data/datasources/locale_datasource/locale_datasource_imp.dart';

GetIt injector = GetIt.instance;

reset(){
  injector.reset();
}

void initializeDependencies() {
  // ApiConnector lazy
  injector.registerLazySingleton<ApiConnector>(() => ApiConnector());
  // Hive Connector lazy
  injector.registerLazySingleton<HiveConnector>(()=>HiveConnector("e_commerce_case"));
  // Api
  injector.registerLazySingleton<HomeRemoteDatasource>(() => HomeRemoteDatasourceImp(apiConnector: injector()));

  //locale
  injector.registerLazySingleton<LocaleDatasource>(() => LocaleDatasourceImp(hiveConnector: injector()));

  //Repositories
  injector.registerLazySingleton<HomeRepository>(() => HomeRepositoriesIml(
      homeRemoteDatasource: injector(),
      localDatasourceImp: injector()));

  //use cases
  injector.registerLazySingleton<GetCategories>(() => GetCategories(injector()));
  injector.registerLazySingleton<GetProductList>(() => GetProductList(injector()));
  injector.registerLazySingleton<GetProductDetail>(() => GetProductDetail(injector()));
}