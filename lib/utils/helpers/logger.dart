// import 'package:flutter/foundation.dart';
// import 'package:logger/logger.dart';

// class AppLogger {
//   AppLogger._();

//   static final Logger _logger = Logger(
//     // In release mode: keep logs minimal (or disable completely).
//     level: kReleaseMode ? Level.warning : Level.trace,
//     printer: PrettyPrinter(
//       methodCount: 1, // stack method count
//       errorMethodCount: 8, // stack trace lines for errors
//       lineLength: 120,
//       colors: true,
//       printEmojis: true,
//       dateTimeFormat: DateTimeFormat.onlyTime,
//     ),
//     // Optional: if you want to disable all logs in release:
//     // filter: _ReleaseFilter(),
//   );

//   /// Optional helper to prefix logs with a tag safely.
//   static String _fmtTag(String? tag) => (tag == null || tag.trim().isEmpty) ? '' : '[$tag] ';

//   static void t(dynamic message, {String? tag, Object? error, StackTrace? stackTrace}) {
//     _logger.t('${_fmtTag(tag)}$message', error: error, stackTrace: stackTrace);
//   }

//   static void d(dynamic message, {String? tag, Object? error, StackTrace? stackTrace}) {
//     _logger.d('${_fmtTag(tag)}$message', error: error, stackTrace: stackTrace);
//   }

//   static void i(dynamic message, {String? tag, Object? error, StackTrace? stackTrace}) {
//     _logger.i('${_fmtTag(tag)}$message', error: error, stackTrace: stackTrace);
//   }

//   static void w(dynamic message, {String? tag, Object? error, StackTrace? stackTrace}) {
//     _logger.w('${_fmtTag(tag)}$message', error: error, stackTrace: stackTrace);
//   }

//   static void e(dynamic message, {String? tag, Object? error, StackTrace? stackTrace}) {
//     _logger.e('${_fmtTag(tag)}$message', error: error, stackTrace: stackTrace);
//   }

//   static void f(dynamic message, {String? tag, Object? error, StackTrace? stackTrace}) {
//     _logger.f('${_fmtTag(tag)}$message', error: error, stackTrace: stackTrace);
//   }
// }

/// Uncomment and use in Logger(filter: _ReleaseFilter()) to disable logs in release.
/// class _ReleaseFilter extends LogFilter {
///   @override
///   bool shouldLog(LogEvent event) => !kReleaseMode;
/// }
