import 'package:logger/logger.dart';

//?-----------------------------------------------------------------------------
// logger helper getter
Logger getLogger(String className) {
  return Logger(
    printer: PrettyPrinter(
        errorMethodCount: 3,
        methodCount: 0,
        noBoxingByDefault: true,
        lineLength: 30,
        printTime: false,
        colors: true),
  );
}

//?-----------------------------------------------------------------------------
class CustomLogPrinter extends LogPrinter {
  final String className;
  CustomLogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];
    final message = event.message;

    return [color!('$emoji $className: $message')];
  }
}
//?-----------------------------------------------------------------------------
// Levels of logger
// enum Level {
//!   verbose,
//!   debug, => use for class debugging
//!   info, => use for function debugging
//!   warning, => use for failures
//!   error, => use for exceptions..and critical events
//!   wtf,
//!   nothing,
// }