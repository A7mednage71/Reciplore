import 'package:json_annotation/json_annotation.dart';

part 'all_categories_model.g.dart';

@JsonSerializable()
class AllCategoriesModel {
  final List<CategoryModel> categories;

  AllCategoriesModel({required this.categories});

  factory AllCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$AllCategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllCategoriesModelToJson(this);
}

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: '_id')
  final String categoryId;

  @JsonKey(name: 'name')
  final String categoryName;

  @JsonKey(name: 'image')
  final CategoryImageModel categoryImage;

  @JsonKey(name: 'description')
  final String categoryDescription;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryDescription,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CategoryImageModel {
  @JsonKey(name: 'secure_url')
  final String secureUrl;

  @JsonKey(name: 'public_id')
  final String publicUrl;

  CategoryImageModel({required this.secureUrl, required this.publicUrl});

  factory CategoryImageModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryImageModelToJson(this);
}
