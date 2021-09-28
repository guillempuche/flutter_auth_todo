import 'package:auth_with_todo/modules/todo/infraestructure/firebase_todo_repository.dart';
import 'package:auth_with_todo/modules/user/infrastructure/firebase_user_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/modules/user/service/authentication_bloc/authentication_bloc.dart';
import '/modules/todo/service/filtered_todos_bloc/filtered_todos_bloc.dart';
import '/modules/todo/service/todo_bloc/todo_bloc.dart';
import '../todos/add_edit_screen.dart';
import '../tab/tab_bloc.dart';
import 'home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(userRepository: FirebaseUserRepository())
                  ..add(AuthAppStarted())),
        BlocProvider<TodoBloc>(
            create: (context) =>
                TodoBloc(todoRepository: FirebaseTodoRepository())
                  ..add(TodoLoaded())),
      ],
      child: MaterialApp(
        title: 'Todos',
        routes: {
          '/': (context) =>
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                if (state is AuthLogIn) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider<TabBloc>(create: (context) => TabBloc()),
                      BlocProvider<FilteredTodosBloc>(
                          create: (context) => FilteredTodosBloc(
                              todosBloc: context.read<TodoBloc>())),
                      // BlocProvider<StatsBloc>(create: ()),
                    ],
                    child: const HomeScreen(),
                  );
                } else if (state is AuthLogOut) {
                  return const Center(
                      child: Text("Could not authenticate with Firestore"));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
          '/addTodo': (context) => AddEditScreen(),
        },
      ),
    );
  }
}
