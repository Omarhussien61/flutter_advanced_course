

import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networking/api_constants.dart';
import 'package:flutter_complete_project/features/home/data/models/categories_response_model.dart';
import 'package:retrofit/retrofit.dart';

import '../models/product_response_model.dart';
import 'home_api_constants.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl : ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApiConstants.productsEP)
  Future<ProductsResponseModel> getProduct();
  @GET(HomeApiConstants.categoryEP)
  Future<CategoryResponseModel> getCatgory();
}