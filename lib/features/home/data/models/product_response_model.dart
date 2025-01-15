import 'package:json_annotation/json_annotation.dart';

part 'product_response_model.g.dart';

@JsonSerializable()
class ProductsResponseModel {
  @JsonKey(name: 'data')
  List<ProductData?>? specializationDataList;

  ProductsResponseModel({
    this.specializationDataList,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);
}

@JsonSerializable()
class ProductData {
  int? id;
  String? name;
  @JsonKey(name: 'doctors')

  ProductData({
    this.id,
    this.name,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
}

