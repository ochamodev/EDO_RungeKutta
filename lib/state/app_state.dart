import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

class CalculationRow {
  final double xn;
  final double rk1;
  final double rk2;
  final double rk4;
  const CalculationRow({
    this.xn = 0,
    this.rk1 = 0,
    this.rk2 = 0,
    this.rk4 = 0
  });
}

class CalculationResultUrl {
  final String url;
  const CalculationResultUrl({
    required this.url
  });
}

@freezed
class AppState with _$AppState {
  const factory AppState({
    required List<CalculationRow> calculations,
    required CalculationResultUrl imageUrl
  }) = _AppState;
}