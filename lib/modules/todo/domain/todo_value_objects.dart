import 'package:equatable/equatable.dart';

/// It validates the [task] property of the Todo entity.
///
/// This value object uses [Equatable] as an entity base class to compare objects. It
/// inherites ([props], [toString], [hashcode] and [operator ==]).
class Task extends Equatable {
  const Task._(this.input);

  final String input;
  static const maxLength = 80;

  factory Task(String input) {
    if (input.length > maxLength)
      throw Exception();
    else
      return Task._(input);
  }

  @override
  List<Object> get props => [input];
}

/// It validates the [note] property of the Todo entity.
///
/// This value object uses [Equatable] as an entity base class to compare objects. It
/// inherites ([props], [toString], [hashcode] and [operator ==]).
class Note extends Equatable {
  const Note._(this.input);

  factory Note(String input) {
    if (input.length > maxLength) {
      throw Exception();
    } else {
      return Note._(input);
    }
  }

  final String? input;
  static const maxLength = 80;

  @override
  List<Object?> get props => [input];
}
