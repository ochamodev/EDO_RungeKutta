import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:runge_kutta_app/model/response/calculation.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calculations.model.freezed.dart';
part 'calculations.model.g.dart';

@freezed
class Calculations with _$Calculations {
  @JsonSerializable(explicitToJson: true)
  const factory Calculations({
    required List<Calculation> rk1,
    required List<Calculation> rk2,
    required List<Calculation> rk4
  }) = _Calculations;

  factory Calculations.fromJson(Map<String, dynamic> json)
    => _$CalculationsFromJson(json);
}