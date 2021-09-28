import 'package:uuid/uuid.dart';

/// Create a unique identifier to use on entities.
class UniqueId {
  UniqueId(id) : _id = id ?? const Uuid().v4();

  final String _id;

  @override
  String toString() => _id;
}
