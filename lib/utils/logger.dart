// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

class Logger {
  static void projectLog(
    dynamic message, {
    String name = '',
    dynamic error,
    StackTrace? stacktrace,
    int level = 84,
  }) {
    if (kDebugMode) {
      developer.log(
        message is String ? message : message?.toString() ?? 'null',
        time: DateTime.now(),
        level: level,
        stackTrace: stacktrace,
        name: name,
      );
    }
  }
}
