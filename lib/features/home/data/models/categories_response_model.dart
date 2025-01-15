import 'package:json_annotation/json_annotation.dart';
part 'categories_response_model.g.dart';


@JsonSerializable()
class CategoryResponseModel {
  @JsonKey(name: 'data')
  List<CategoryData?>? specializationDataList;

  CategoryResponseModel({
    this.specializationDataList,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseModelFromJson(json);
}

@JsonSerializable()
class CategoryData {
  int? id;
  String? name;
  @JsonKey(name: 'data')
  List<Product?>? doctorsList;

  CategoryData({
    this.id,
    this.name,
    this.doctorsList,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}

@JsonSerializable()
class Product {
  int? id;
  String? name;
  String? name_en;
  String? photo;


  Product({
    this.id,
    this.name,
    this.name_en,
    this.photo,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}