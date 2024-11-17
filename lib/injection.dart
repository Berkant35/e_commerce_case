import 'package:e_commerce_case/core/api_helper/api_connector.dart';
import 'package:e_commerce_case/features/home/data/datasources/api_datasource/remote_datasource.dart';
import 'package:e_commerce_case/features/home/data/datasources/api_datasource/remote_datasource_imp.dart';
import 'package:e_commerce_case/features/home/data/repositories/home_repositories_iml.dart';
import 'package:e_commerce_case/features/home/domain/repositories/home_repository.dart';
import 'package:e_commerce_case/features/home/domain/usecases/get_categories.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.instance;

reset(){
  injector.reset();
}



void initializeDependencies() {
  // ApiConnector lazy
  injector.registerLazySingleton<ApiConnector>(() => ApiConnector());

  // Api
  injector.registerLazySingleton<RemoteDatasource>(() => RemoteDatasourceImp(apiConnector: injector()));

  //Repositories
  injector.registerLazySingleton<HomeRepository>(() => HomeRepositoriesIml(remoteDatasource: injector()));

  //use cases
  injector.registerLazySingleton<GetCategories>(() => GetCategories(injector()));
}