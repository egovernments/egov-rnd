// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'mdms_hive_model.g.dart';

@HiveType(typeId: 1)
class MdmsHiveModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String code;

  @HiveField(2)
  List<LanguageHiveModel> languages;

  @HiveField(3)
  List<CityHiveModel> cityHive;

  MdmsHiveModel({
    required this.name,
    required this.code,
    required this.languages,
    required this.cityHive,
  });
}

@HiveType(typeId: 2)
class LanguageHiveModel extends HiveObject {
  @HiveField(0)
  String label;

  @HiveField(1)
  String value;

  LanguageHiveModel({
    required this.label,
    required this.value,
  });
}

@HiveType(typeId:5)
class CityHiveModel extends HiveObject {


  @HiveField(0)
  String cityCode;

  @HiveField(1)
  String cityName;

  CityHiveModel({
    required this.cityCode,
    required this.cityName,
  });

}