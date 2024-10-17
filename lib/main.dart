import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runge_kutta_app/page/runge_kutta_page.dart';
import 'package:runge_kutta_app/state/provider/theme_provider.dart';
import 'package:runge_kutta_app/util/theme.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp())
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppThemeState appThemeState = ref.watch(appThemeProvider);
    return FluentApp(
      title: 'Flutter Demo',
      theme: FluentThemeData(
        brightness: appThemeState.mode == ThemeMode.dark
            ? Brightness.dark
            : Brightness.light,
        accentColor: appThemeState.color,
      ),
      home: const RungeKuttaPage(),
    );
  }
}