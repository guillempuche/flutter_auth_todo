import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/models.dart';
import '../tab/tab_bloc.dart';
import '../widgets/extra_actions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(builder: (context, activeTab) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Todos'),
          actions: [
            // FilterButton(visible: activeTab == AppTab.todos),
            ExtraActions(),
          ],
        ),
      );
    });
  }
}
