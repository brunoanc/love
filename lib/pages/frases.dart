import 'package:flutter/material.dart';
import 'frases_tabs/frases_daily.dart';
import 'frases_tabs/frases_past.dart';

class Frases extends StatefulWidget {
  const Frases({super.key});

  @override
  State<Frases> createState() => _FrasesState();
}

class _FrasesState extends State<Frases> with AutomaticKeepAliveClientMixin {
  @override
  bool wantKeepAlive = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

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
            FrasesPast(),
          ],
        ),
      ),
    );
  }
}
