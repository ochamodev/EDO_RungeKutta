

import 'package:dio/dio.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:runge_kutta_app/model/request/solve_runga_kutta.model.dart';
import 'package:runge_kutta_app/model/response/calculate_runge_kutta.model.dart';
import 'package:runge_kutta_app/state/app_state.dart';


class AppNotifier extends StateNotifier<AppState> {
  final _apiUrl = 'http://localhost:8000/runge-kutta';

  AppNotifier() : super(AppState(calculations: [], imageUrl: CalculationResultUrl(url: '')));


  void makeCalculations(SolveRungeKutta params) async {
    final Dio dio = Dio();
    final Response response = await dio.post(
      _apiUrl,
      data: params.toJson(),
      options: Options(
        headers: {
          'Content-Type': 'application/json'
        }
      )
    );
    if (response.statusCode == 200) {
      final CalculateRungeKutta data = CalculateRungeKutta.fromJson(
          response.data
      );
      final AppState newState = mapResponseToAppState(data);
      state = newState;
    }
  }

  AppState mapResponseToAppState(CalculateRungeKutta response) {
    final List<CalculationRow> rows = [];

    for (int i = 0; i < response.calculations.rk1.length; i++) {
      final double x = response.calculations.rk1[i].x;
      final CalculationRow row = CalculationRow(
        xn: x,
        rk1: response.calculations.rk1[i].y,
        rk2: response.calculations.rk2[i].y,
        rk4: response.calculations.rk4[i].y
      );
      rows.add(row);
    }
    return AppState(
        calculations: rows,
        imageUrl: CalculationResultUrl(
            url: response.graph_url
        )
    );
  }

}

final appNotifierProvider = StateNotifierProvider<AppNotifier, AppState>((ref) => AppNotifier());