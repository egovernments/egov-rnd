import 'package:hive/hive.dart';

part 'localization_hive_model.g.dart';

@HiveType(typeId: 0)
class LocalizationHiveModel extends HiveObject {
  @HiveField(0)
  String code;

  @HiveField(1)
  String message;

  @HiveField(2)
  String locale;

  LocalizationHiveModel({
    required this.code,
    required this.message,
    required this.locale,
  });
}
