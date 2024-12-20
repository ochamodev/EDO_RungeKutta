
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as Material;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runge_kutta_app/state/app_state.dart';
import 'package:runge_kutta_app/state/notifier/app_notifier.dart';

class CalculationsTable extends ConsumerWidget {
  CalculationsTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const BorderSide tableBorder = const BorderSide();
    final AppState appState = ref.watch(appNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 12,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFF5F5F5).withOpacity(0.4),
                  ),
                ],
              ),
              child: Material.DataTable(
                headingRowColor: Material.WidgetStateProperty.all(FluentTheme.of(context).accentColor),
                dataRowColor: Material.WidgetStateProperty.all(Colors.transparent),
                headingTextStyle: FluentTheme.of(context).typography.subtitle?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                columnSpacing: MediaQuery.sizeOf(context).width * 0.03,
                dataTextStyle: FluentTheme.of(context).typography.body,
                border: TableBorder(
                    top: tableBorder,
                    bottom: tableBorder,
                    left: tableBorder,
                    right: tableBorder,
                    horizontalInside: BorderSide(),
                    verticalInside: BorderSide(),
                    borderRadius: BorderRadius.circular(3.0)
                ),
                columns: const <Material.DataColumn>[
                  Material.DataColumn(
                      label: Text('Xn')
                  ),
                  Material.DataColumn(
                      label: Text('RK1')
                  ),
                  Material.DataColumn(
                      label: Text('RK2')
                  ),
                  Material.DataColumn(
                      label: Text('RK4')
                  ),
                ],
                rows: mapItems(appState.calculations)
              ),
            ),
          ),
        )
      ],
    );
  }

  List<Material.DataRow> mapItems(List<CalculationRow> items) {
    const int decimalPlaces = 4;
    return items.map((CalculationRow it) {
      return Material.DataRow(
        cells: [
          Material.DataCell(Text(it.xn.toStringAsFixed(4))),
          Material.DataCell(Text(it.rk1.toStringAsFixed(4))),
          Material.DataCell(Text(it.rk2.toStringAsFixed(4))),
          Material.DataCell(Text(it.rk4.toStringAsFixed(4)))
        ]
      );
    }).toList();
  }

}
