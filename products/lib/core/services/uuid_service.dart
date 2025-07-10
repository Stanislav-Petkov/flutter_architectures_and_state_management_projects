import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@singleton
class UuidService {
  final Uuid _uuid = const Uuid();

  String generate() => _uuid.v4();
}
