import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'solve_runga_kutta.model.freezed.dart';
part 'solve_runga_kutta.model.g.dart';

@freezed
class SolveRungeKutta with _$SolveRungeKutta {
  @JsonSerializable(explicitToJson: true)
  const factory SolveRungeKutta({
    required String equation,
    required double x0,
    required double y0,
    @JsonKey(name: "x_final") required double xFinal,
    required double h
  }) = _SolveRungeKutta;

  factory SolveRungeKutta.fromJson(Map<String, dynamic> json) =>
      _$SolveRungeKuttaFromJson(json);


}

