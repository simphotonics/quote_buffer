import 'package:quote_buffer/quote_buffer.dart';

/// To run this program in a terminal navigate to the
/// root directory of the package `quote_buffer`and use:
/// ```Console
/// $ dart example/bin/example.dart
/// ```
/// followed by enter.
void main(List<String> args) {
  final reset = '\u001B[0m';
  String green(String input) => '\u001B[32m$input$reset';
  String blue(String input) => '\u001B[34m$input$reset';
  String yellow(String input) => '\u001B[33m$input$reset';

  final strings = <String>['one', 'two', 'three'];
  strings.addAll(args);

  final buffer = StringBuffer();

  print(green('-------------------------------'));
  print(green('QuoteBuffer Extension - Example'));
  print(green('-------------------------------'));

  // Adds:'\'1\'' (Note: Objects are first converted to strings.)
  print(yellow('// Adding quotation marks.'));
  print(blue('buffer.writeQ(29);'));
  buffer.writeQ(29);
  print(buffer.toString());
  buffer.clear();

  // Adds:'\'name\'\n'
  print(yellow('// Adding double quotation marks and newline.'));
  print(blue('buffer.writelnQ'
      '(\'name\', delimiter: QuotationMark.double);'));
  buffer.writelnQ('name', delimiter: QuotationMark.double);
  print(buffer.toString());
  buffer.clear();

  // Prints:
  // 'one', 'two', 'three', 'four'
  print(yellow('// Adding separator and quotation marks.'));
  buffer.writeAllQ(strings);
  print(blue('buffer.writeAllQ'
      '([\'one\',\'two\',\'three\',\'four\'], separator: \', \');'));
  print(buffer.toString());
  buffer.clear();

  print(yellow('// Adding separator1, quotation marks, separator2, newline.'));
  print(blue(
    'buffer.writelnAllQ('
    '[\'one\',\'two\',\'three\',\'four\'], separator1: \'#\', separator2: \',\');',
  ));
  buffer.writelnAllQ(
    strings,
    separator1: '#',
    separator2: ',',
    delimiter: QuotationMark.double,
  );
  print(buffer.toString());
}
