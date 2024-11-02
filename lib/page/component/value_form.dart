
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runge_kutta_app/model/approximation_options.dart';
import 'package:runge_kutta_app/model/request/solve_runga_kutta.model.dart';
import 'package:runge_kutta_app/state/notifier/app_notifier.dart';
import 'package:runge_kutta_app/util/component/separator.dart';

class ValueForm extends ConsumerStatefulWidget {
  const ValueForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return ValueFormState();
  }

}

class ValueFormState extends ConsumerState<ValueForm> {

  final _aproximationsOptions = [
    const ApproximationOptions(id: 1, text: 'RK1'),
    const ApproximationOptions(id: 2, text: 'RK2'),
    const ApproximationOptions(id: 3, text: 'RK4'),
  ];

  late TextEditingController equationCtrl;
  late TextEditingController initialXCtrl;
  late TextEditingController initialYCtrl;
  late TextEditingController xValueCtrl;
  late TextEditingController stepSizeCtrl;

  @override
  void initState() {
    super.initState();
    equationCtrl = TextEditingController();
    initialXCtrl = TextEditingController();
    initialYCtrl = TextEditingController();
    xValueCtrl = TextEditingController();
    stepSizeCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    ApproximationOptions selected = _aproximationsOptions[0];

    AppNotifier provider = ref.read(appNotifierProvider.notifier);

    return Column(
      children: [
        const Center(
          child: Text(
            'Ingrese los siguientes valores',
          ),
        ),
        const Separator(),
        InfoLabel(
          label: 'Ingrese la ecuación: y \' =',
          child: SizedBox(
            child: TextBox(
              placeholder: 'y - x - 2',
              controller: equationCtrl,
            ),
          ),
        ),
        const Separator(),
        const Center(
          child: Text(
            'Valores iniciales',
          ),
        ),
        const Separator(),
        InfoLabel(
          label: 'Valor inicial x',
          child: TextBox(
            placeholder: 'x0',
            controller: initialXCtrl,
          ),
        ),
        const Separator(),
        InfoLabel(
          label: 'Valor inicial y',
          child: SizedBox(
            child: TextBox(
              placeholder: 'y0',
              controller: initialYCtrl,
            ),
          ),
        ),
        const Separator(),
        const Center(
          child: Text(
            'Valor a calcular y(x)',
          ),
        ),
        InfoLabel(
          label: 'x',
          child: TextBox(
            placeholder: 'x',
            controller: xValueCtrl,
          ),
        ),
        const Separator(),
        const Center(
          child: Text(
            'Valor del paso',
          ),
        ),
        InfoLabel(
          label: 'h',
          child: TextBox(
            placeholder: 'h',
            controller: stepSizeCtrl,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        /*ComboBox(
          value: 1,
          items: _aproximationsOptions.map((e) {
            return ComboBoxItem(
              value: e.id,
              child: Text(e.text),
            );
          }).toList(),
          onChanged: (opt) {

          },
        ),*/
        Button(
          child: const Text('Calcular'),
          onPressed: () {
            provider.makeCalculations(SolveRungeKutta(
                equation: equationCtrl.text,
                x0: double.parse(initialXCtrl.text),
                y0: double.parse(initialYCtrl.text),
                xFinal: double.parse(xValueCtrl.text),
                h: double.parse(stepSizeCtrl.text)
            ));
          },
        )
      ],
    );
  }
}
