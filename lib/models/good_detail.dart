import 'package:json_annotation/json_annotation.dart'; 
  
part 'good_detail.g.dart';


@JsonSerializable()
  class GoodDetail extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'skus')
  List<Skus> skus;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'cate')
  String cate;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'postFee')
  double postFee;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'banners')
  List<String> banners;

  GoodDetail(this.id,this.title,this.skus,this.description,this.cate,this.status,this.postFee,this.createTime,this.image,this.banners,);

  factory GoodDetail.fromJson(Map<String, dynamic> srcJson) => _$GoodDetailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodDetailToJson(this);

}

  
@JsonSerializable()
  class Skus extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'stock')
  int stock;

  @JsonKey(name: 'sale')
  int sale;

  @JsonKey(name: 'specs')
  List<Specs> specs;

  Skus(this.id,this.price,this.stock,this.sale,this.specs,);

  factory Skus.fromJson(Map<String, dynamic> srcJson) => _$SkusFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SkusToJson(this);

}

  
@JsonSerializable()
  class Specs extends Object {

  @JsonKey(name: 'key')
  String key;

  @JsonKey(name: 'value')
  String value;

  Specs(this.key,this.value,);

  factory Specs.fromJson(Map<String, dynamic> srcJson) => _$SpecsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SpecsToJson(this);

}

  
