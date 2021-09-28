import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/modules/todo/service/todo_bloc/todo_bloc.dart';
import '../models/models.dart';

class ExtraActions extends StatelessWidget {
  const ExtraActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      if (state is TodoLoadSuccess) {
        final isAllComplete = state.todos.every((todo) => todo.complete);

        return PopupMenuButton<ExtraAction>(
          onSelected: (action) {
            switch (action) {
              case ExtraAction.clearCompleted:
                context.read<TodoBloc>().add(TodoClearCompleted());
                break;
              case ExtraAction.toggleAllComplete:
                context.read<TodoBloc>().add(TodoAllToggled());
                break;
            }
          },
          itemBuilder: (context) => <PopupMenuItem<ExtraAction>>[
            PopupMenuItem<ExtraAction>(
              value: ExtraAction.toggleAllComplete,
              child: Text(
                isAllComplete ? 'Mark all incomplete' : 'Mark all complete',
              ),
            ),
            const PopupMenuItem<ExtraAction>(
              value: ExtraAction.clearCompleted,
              child: Text('Clear completed'),
            )
          ],
        );
      } else {
        return Container();
      }
    });
  }
}
