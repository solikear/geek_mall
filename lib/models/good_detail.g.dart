// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'good_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodDetail _$GoodDetailFromJson(Map<String, dynamic> json) {
  return GoodDetail(
    json['id'] as String,
    json['title'] as String,
    (json['skus'] as List)
        ?.map(
            (e) => e == null ? null : Skus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['description'] as String,
    json['cate'] as String,
    json['status'] as String,
    (json['postFee'] as num)?.toDouble(),
    json['createTime'] as String,
    json['image'] as String,
    (json['banners'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$GoodDetailToJson(GoodDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'skus': instance.skus,
      'description': instance.description,
      'cate': instance.cate,
      'status': instance.status,
      'postFee': instance.postFee,
      'createTime': instance.createTime,
      'image': instance.image,
      'banners': instance.banners,
    };

Skus _$SkusFromJson(Map<String, dynamic> json) {
  return Skus(
    json['id'] as String,
    (json['price'] as num)?.toDouble(),
    json['stock'] as int,
    json['sale'] as int,
    (json['specs'] as List)
        ?.map(
            (e) => e == null ? null : Specs.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SkusToJson(Skus instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'stock': instance.stock,
      'sale': instance.sale,
      'specs': instance.specs,
    };

Specs _$SpecsFromJson(Map<String, dynamic> json) {
  return Specs(
    json['key'] as String,
    json['value'] as String,
  );
}

Map<String, dynamic> _$SpecsToJson(Specs instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };
