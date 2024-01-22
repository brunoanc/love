import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Frases extends StatefulWidget {
  const Frases({super.key});

  @override
  State<Frases> createState() => _FrasesState();
}

class _FrasesState extends State<Frases> {
  bool revealButtonLoading = false;
  String loadingButtonText = 'Cargando amor...';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                indicatorColor: theme.colorScheme.onPrimary,
                tabs: [
                  Tab(icon: Icon(Icons.today, color: theme.colorScheme.onPrimary)),
                  Tab(icon: Icon(Icons.calendar_month, color: theme.colorScheme.onPrimary)),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tu mensajito de hoy es:',
                      style: theme.textTheme.headlineSmall!.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    //BigCard(text: 'Te amo con todo mi corazoncito bebé preciosa <3'),
                    ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: revealButtonLoading
                          ? FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Lottie.asset(
                                  width: 40,
                                  height: 40,
                                  'assets/loading.json'
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  loadingButtonText,
                                  style: theme.textTheme.headlineSmall,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                          : FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Lottie.asset(
                                  width: 40,
                                  height: 40,
                                  'assets/wired-outline-1865-shooting-stars.json'
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Revelar',
                                  style: theme.textTheme.displaySmall,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                      ),
                      onPressed: () {
                        setState(() {
                          revealButtonLoading = true;
                        });

                        Future.delayed(const Duration(seconds: 5), () {
                          setState(() {
                            loadingButtonText = 'Buscando palabras bonitas...';
                          });

                          Future.delayed(const Duration(seconds: 5), () {
                            setState(() {
                              loadingButtonText = 'Escribiendo tu mensajito...';
                            });
                          });
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            const Icon(Icons.calendar_month),
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(20),

        // ↓ Make the following change.
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
