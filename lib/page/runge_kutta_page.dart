
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runge_kutta_app/page/component/calculations_table.dart';
import 'package:runge_kutta_app/page/component/value_form.dart';
import 'package:runge_kutta_app/state/provider/theme_provider.dart';
import 'package:runge_kutta_app/util/theme.dart';


class RungeKuttaPage extends ConsumerWidget {
  const RungeKuttaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppThemeState appThemeState = ref.watch(appThemeProvider);

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
                    child: Image.network(
                      'https://platform.polygon.com/wp-content/uploads/sites/2/chorus/uploads/chorus_asset/file/13712762/Samus_Returns.jpg?quality=90&strip=all&crop=6.875%2C0%2C86.25%2C100&w=2048'
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