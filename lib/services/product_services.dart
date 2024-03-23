import 'package:http/http.dart' as http;
import 'package:shoply/model/product_models.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/utils/values_manager.dart';

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(
      Uri.parse(AppStrings.baseUrl + AppStrings.endPoint1),
    );
    if (response.statusCode == AppSize.s200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception(AppStrings.failedToLoadProduct);
    }
  }
}
