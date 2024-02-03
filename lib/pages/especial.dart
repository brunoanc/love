import 'package:flutter/material.dart';
import 'package:love/pages/especial_tabs/especial_past.dart';
import 'especial_tabs/especial_day.dart';

class Especial extends StatefulWidget {
  const Especial({super.key});

  @override
  State<Especial> createState() => _EspecialState();
}

class _EspecialState extends State<Especial> {
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
                  Tab(icon: Icon(Icons.celebration_outlined, color: theme.colorScheme.onPrimary)),
                  Tab(icon: Icon(Icons.calendar_month, color: theme.colorScheme.onPrimary)),
                ],
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            EspecialDay(),
            EspecialPast(),
          ],
        ),
      ),
    );
  }
}
