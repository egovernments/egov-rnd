import 'package:hive/hive.dart';

part 'login_hive_model.g.dart';

@HiveType(typeId: 4)
class LoginHiveModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String mobileNumber;

  LoginHiveModel({
    required this.name,
    required this.mobileNumber,
  });
}