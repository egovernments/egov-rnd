import 'package:isar/isar.dart';

part 'localization.g.dart';

@Collection()
class LocalizationWrapper {
  Id id = Isar.autoIncrement;

  late String locale;

  late List<Localization>? localization;
}

@embedded
class Localization {
  late String code;

  late String message;

  late String module;

  late String locale;
}
