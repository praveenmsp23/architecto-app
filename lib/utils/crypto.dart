import 'dart:math';
import 'dart:typed_data';
import 'package:convert/convert.dart';

String generateId(String prefix, [int? size]) {
  if (size == null || size <= 0 || size >= 100) {
    size = 16;
  }
  final random = Random.secure();
  final Uint8List bytes = Uint8List.fromList(
    List<int>.generate(size, (_) => random.nextInt(256)),
  );
  return '${prefix}_${hex.encode(bytes)}';
}
