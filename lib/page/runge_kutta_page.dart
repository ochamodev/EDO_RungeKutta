
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/provider/theme_provider.dart';

class RungeKuttaPage extends ConsumerWidget {
  const RungeKuttaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeProvider);

    return Acrylic(
      shadowColor: appThemeState.color.light,
      child: ScaffoldPage(
        header: const PageHeader(
          title: Text("Método Runge kutta"),
        ),
        content: SizedBox(
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: InfoLabel(
                        label: "Ingrese la ecuación:",
                        child: const SizedBox(
                          child: TextBox(
                            placeholder: "y'=",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                              label: Expanded(
                                child: Text("Xn"),
                              )
                          ),
                          DataColumn(
                              label: Expanded(
                                child: Text("RK1"),
                              )
                          ),
                          DataColumn(
                              label: Expanded(
                                child: Text("RK2"),
                              )
                          ),
                          DataColumn(
                              label: Expanded(
                                child: Text("RK4"),
                              )
                          ),
                        ],
                        rows: [],
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                  child: Image.network("https://user-images.githubusercontent.com/1616682/93912098-23060300-fcb8-11ea-823f-be8dfe9c24b9.png")
              ),
              Flexible(
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        "Ingrese los valores iniciales: ",
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: InfoLabel(
                        label: "Ingrese la ecuación:",
                        child: SizedBox(
                          child: TextBox(
                            placeholder: "y'=",
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: InfoLabel(
                        label: "Ingrese la ecuación:",
                        child: SizedBox(
                          child: TextBox(
                            placeholder: "y'=",
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: InfoLabel(
                        label: "Ingrese la ecuación:",
                        child: SizedBox(
                          child: TextBox(
                            placeholder: "y'=",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}