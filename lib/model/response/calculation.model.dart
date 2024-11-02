import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calculation.model.freezed.dart';
part 'calculation.model.g.dart';

@freezed
class Calculation with _$Calculation {
  @JsonSerializable(explicitToJson: true)
  const factory Calculation({
    required double x,
    required double y,
  }) = _Calculation;

  factory Calculation.fromJson(Map<String, dynamic> json) =>
      _$CalculationFromJson(json);
}