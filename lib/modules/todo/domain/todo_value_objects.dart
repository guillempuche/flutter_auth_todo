import 'package:equatable/equatable.dart';

/// It validates the [task] property of the Todo entity.
///
/// This value object uses [Equatable] as an entity base class to compare objects. It
/// inherites ([props], [toString], [hashcode] and [operator ==]).
class Task extends Equatable {
  const Task._(this._input);

  final String _input;
  static const maxLength = 80;

  factory Task(String _input) {
    if (_input.length > maxLength)
      throw Exception();
    else
      return Task._(_input);
  }

  @override
  List<Object> get props => [_input];

  @override
  String toString() => _input;
}

/// It validates the [note] property of the Todo entity.
///
/// This value object uses [Equatable] as an entity base class to compare objects. It
/// inherites ([props], [toString], [hashcode] and [operator ==]).
class Note extends Equatable {
  const Note._(this._input);

  factory Note(String _input) {
    if (_input.length > maxLength) {
      throw Exception("Note length exceeds $maxLength");
    } else {
      return Note._(_input);
    }
  }

  final String _input;
  static const maxLength = 80;

  @override
  List<Object?> get props => [_input];

  @override
  String toString() => _input;
}
