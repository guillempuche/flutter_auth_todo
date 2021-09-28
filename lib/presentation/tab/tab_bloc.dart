import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/models.dart';

part 'tab_event.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  TabBloc() : super(AppTab.todos) {
    on<TabUpdated>(
        (TabUpdated event, Emitter<AppTab> emit) => emit(event.updatedTab));
  }
}
