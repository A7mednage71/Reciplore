// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCategoriesModel _$AllCategoriesModelFromJson(Map<String, dynamic> json) =>
    AllCategoriesModel(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllCategoriesModelToJson(AllCategoriesModel instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      categoryId: json['_id'] as String,
      categoryName: json['name'] as String,
      categoryImage:
          CategoryImageModel.fromJson(json['image'] as Map<String, dynamic>),
      categoryDescription: json['description'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      '_id': instance.categoryId,
      'name': instance.categoryName,
      'image': instance.categoryImage,
      'description': instance.categoryDescription,
    };

CategoryImageModel _$CategoryImageModelFromJson(Map<String, dynamic> json) =>
    CategoryImageModel(
      secureUrl: json['secure_url'] as String,
      publicUrl: json['public_id'] as String,
    );

Map<String, dynamic> _$CategoryImageModelToJson(CategoryImageModel instance) =>
    <String, dynamic>{
      'secure_url': instance.secureUrl,
      'public_id': instance.publicUrl,
    };
