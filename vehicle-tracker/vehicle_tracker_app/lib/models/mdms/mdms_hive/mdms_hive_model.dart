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

  MdmsHiveModel({
    required this.name,
    required this.code,
    required this.languages,
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
