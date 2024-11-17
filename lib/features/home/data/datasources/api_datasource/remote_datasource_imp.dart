import 'package:e_commerce_case/core/api_helper/api_connector.dart';
import 'package:e_commerce_case/core/constants/paths.dart';
import 'package:e_commerce_case/features/home/data/datasources/api_datasource/remote_datasource.dart';
import 'package:e_commerce_case/features/home/data/models/category.dart';
import 'package:e_commerce_case/main.dart';

class RemoteDatasourceImp extends RemoteDatasource {
  final ApiConnector apiConnector;

  RemoteDatasourceImp({required this.apiConnector});

  @override
  Future<List<Category>> getCategories() async {
    var response = await apiConnector.get(Paths.categories);
    final categoryList = (response as List<dynamic>).map((e){
      final category = Category.fromJson(e as Map<String, dynamic>);
      return category;
    }).toList();
    return categoryList;
  }
}
