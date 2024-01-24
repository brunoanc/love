import 'package:flutter/material.dart';
import 'frases_tabs/frases_daily.dart';

class Frases extends StatelessWidget {
  const Frases({super.key});

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
        body: const TabBarView(
          children: [
            FrasesDaily(),
            Icon(Icons.calendar_month),
          ],
        ),
      ),
    );
  }
}
