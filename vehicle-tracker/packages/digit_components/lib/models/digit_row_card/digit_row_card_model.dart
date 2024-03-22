// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
part 'digit_row_card_model.g.dart';
part 'digit_row_card_model.freezed.dart';

@freezed
class DigitRowCardModel with _$DigitRowCardModel {
  @JsonSerializable(explicitToJson: true)
  const factory DigitRowCardModel({
    required String label,
    required String value,
    @Default(false) bool isSelected,
  }) = _DigitRowCardModel;

  factory DigitRowCardModel.fromJson(Map<String, dynamic> json) =>
      _$DigitRowCardModelFromJson(json);
}
