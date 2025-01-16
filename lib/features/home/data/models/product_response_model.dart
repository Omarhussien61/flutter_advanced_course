import 'package:json_annotation/json_annotation.dart';

part 'product_response_model.g.dart';

@JsonSerializable()
class ProductsResponseModel {
  @JsonKey(name: 'data')
  List<ProductData?>? ProductsDataList;

  ProductsResponseModel({
    this.ProductsDataList,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);
}

@JsonSerializable()
class ProductData {
  int? id;
  String? name;
  String? name_en;
  String? media;

  ProductData({
    this.id,
    this.name,
    this.name_en,
    this.media,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
}

