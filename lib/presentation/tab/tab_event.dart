part of 'tab_bloc.dart';

abstract class TabEvent extends Equatable {}

class TabUpdated extends TabEvent {
  TabUpdated(this.updatedTab);

  final AppTab updatedTab;

  @override
  List<Object> get props => [updatedTab];

  @override
  String toString() => 'TabUpdated { updatedTab: $updatedTab }';
}
