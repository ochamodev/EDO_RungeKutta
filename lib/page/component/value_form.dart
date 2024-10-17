
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runge_kutta_app/model/approximation_options.dart';

class ValueForm extends ConsumerWidget {
  ValueForm({super.key});

  final _aproximationsOptions = [
    ApproximationOptions(id: 1, text: 'RK1'),
    ApproximationOptions(id: 2, text: 'RK2'),
    ApproximationOptions(id: 3, text: 'RK4'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    ApproximationOptions selected = _aproximationsOptions[0];

    return Column(
      children: [
        const Center(
          child: Text(
            'Ingrese los siguientes valores',
          ),
        ),
        InfoLabel(
          label: 'Ingrese la ecuación:',
          child: const SizedBox(
            child: TextBox(
              placeholder: 'y\'=',
            ),
          ),
        ),
        const Center(
          child: Text(
            'Valores iniciales',
          ),
        ),
        InfoLabel(
          label: 'x0',
          child: const TextBox(
            placeholder: 'x0',
          ),
        ),
        InfoLabel(
          label: 'y0',
          child: const SizedBox(
            child: TextBox(
              placeholder: 'y0',
            ),
          ),
        ),
        const Center(
          child: Text(
            'Valor a calcular y(x)',
          ),
        ),
        InfoLabel(
          label: 'x',
          child: const TextBox(
            placeholder: 'x',
          ),
        ),
        const Center(
          child: Text(
            'Valor del paso',
          ),
        ),
        InfoLabel(
          label: 'h',
          child: const TextBox(
            placeholder: 'h',
          ),
        ),
        const Center(
          child: Text(
            'Visualización a mostrar',
          ),
        ),
        ComboBox(
          value: 1,
          items: _aproximationsOptions.map((e) {
            return ComboBoxItem(
              value: e.id,
              child: Text(e.text),
            );
          }).toList(),
          onChanged: (opt) {

          },
        )
      ],
    );
  }
}