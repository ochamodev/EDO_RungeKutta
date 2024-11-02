
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runge_kutta_app/model/request/solve_runga_kutta.model.dart';
import 'package:runge_kutta_app/page/component/calculations_table.dart';
import 'package:runge_kutta_app/page/component/value_form.dart';
import 'package:runge_kutta_app/state/app_state.dart';
import 'package:runge_kutta_app/state/notifier/app_notifier.dart';
import 'package:runge_kutta_app/state/provider/theme_provider.dart';
import 'package:runge_kutta_app/util/theme.dart';
import 'package:widget_zoom/widget_zoom.dart';


class RungeKuttaPage extends ConsumerWidget {
  const RungeKuttaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppThemeState appThemeState = ref.watch(appThemeProvider);
    final AppState state = ref.watch(appNotifierProvider);
     return Acrylic(
      shadowColor: appThemeState.color.light,
      child: ScaffoldPage(
        header: const PageHeader(
          title: Text('Método Runge kutta'),
        ),
        content: Padding(
          padding: const EdgeInsets.all(32),
          child: SizedBox(
            child: Row(
              children: [
                Flexible(
                  child: ValueForm(),
                ),
                Spacer(),
                Flexible(
                  flex: 2,
                  child: CalculationsTable(),
                ),
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: WidgetZoom(
                    heroAnimationTag: 'tag',
                    zoomWidget: Image.network(
                      'http://localhost:8000${state.imageUrl.url}?t=${DateTime.now().millisecond}',
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}