import 'package:e_commerce_case/core/api_helper/api_connector.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.instance;

reset(){
  injector.reset();
}



void initializeDependencies() {
  // ApiConnector lazy
  injector.registerLazySingleton<ApiConnector>(() => ApiConnector());
  
}