import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:runge_kutta_app/model/response/calculations.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calculate_runge_kutta.model.freezed.dart';
part 'calculate_runge_kutta.model.g.dart';

@freezed
class CalculateRungeKutta with _$CalculateRungeKutta {
  @JsonSerializable(explicitToJson: true)
  const factory CalculateRungeKutta({
    @JsonKey(name: "calcs") required Calculations calculations,
    required String graph_url
  }) = _CalculateRungeKutta;

  factory CalculateRungeKutta.fromJson(Map<String, dynamic> json) =>
      _$CalculateRungeKuttaFromJson(json);

}