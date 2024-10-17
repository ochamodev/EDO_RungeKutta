import 'package:freezed_annotation/freezed_annotation.dart';

part 'approximation_options.freezed.dart';

@freezed
class ApproximationOptions with _$ApproximationOptions {
  const factory ApproximationOptions({
    required int id,
    required String text
  }) = _ApproximationOptions;
}
