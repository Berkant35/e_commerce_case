import 'package:e_commerce_case/features/home/domain/entities/home_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class Category with EquatableMixin {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'metaDescription')
  String? metaDescription;
  @JsonKey(name: 'metaKeywords')
  String? metaKeywords;
  Category({
    this.id,
    this.name,
    this.metaDescription,
    this.metaKeywords,
  });

  factory Category.fromJson(Map<String, dynamic> json){
    try{
      return _$CategoryFromJson(json);
    }catch(e){
      return Category();
    }
  }


  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  List<Object?> get props => [id, name];

  //convert to entity

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id.toString(),
      name: name ?? "",
    );
  }

  Category copyWith({
    int? id,
    String? name,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}

