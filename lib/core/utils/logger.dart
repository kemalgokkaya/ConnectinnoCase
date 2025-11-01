import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

enum LogType { debug, warning, error }

class AppLogger {
  static void log(dynamic message, {LogType type = LogType.debug}) {
    if (!kReleaseMode) {
      var logger = Logger(
        printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 8,
          lineLength: 120,
          colors: true,
          printEmojis: true,
        ),
      );
      var log = switch (type) {
        LogType.warning => logger.w(message),
        LogType.error => logger.e(message),
        _ => logger.d(message),
      };

      log;
    }
  }
}
