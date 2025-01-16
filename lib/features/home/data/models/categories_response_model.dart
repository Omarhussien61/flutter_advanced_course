import 'package:json_annotation/json_annotation.dart';
part 'categories_response_model.g.dart';


@JsonSerializable()
class CategoryResponseModel {
  @JsonKey(name: 'data')
  List<CategoryData?>? CategorydataList;

  CategoryResponseModel({
    this.CategorydataList,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseModelFromJson(json);
}



@JsonSerializable()
class CategoryData {
  int? id;
  String? name;
  String? name_en;
  String? photo;


  CategoryData({
    this.id,
    this.name,
    this.name_en,
    this.photo,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}