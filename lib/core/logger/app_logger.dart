part of 'logger.dart';

final logger = Logger(
    printer: PrettyPrinter(
  methodCount: 0,
  errorMethodCount: 5,
  lineLength: 50,
  colors: true,
  printEmojis: true,
  printTime: false,
));

///Custom Logger (boleh pakai global variable seperti di atas atau class di bawah)
class AppLogger {
  final String className;

  final _logger = Logger(
      printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    printTime: false,
  ));

  AppLogger(this.className);

  void error(dynamic error) {
    _logger.e('Error at $className', error);
  }

  void info(String message) {
    _logger.i('$className : $message');
  }
}
