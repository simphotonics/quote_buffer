import 'package:quote_buffer/quote_buffer.dart';
import 'package:ansicolor/ansicolor.dart';

/// To run this program in a terminal navigate to the
/// root directory of the package `quote_buffer`and use:
/// ```Console
/// $ dart example/bin/example.dart
/// ```
/// followed by enter.
void main(List<String> args) {
  final green = AnsiPen()..green(bold: true);
  final blue = AnsiPen()..blue(bold: true);
  final magenta = AnsiPen()..magenta(bold: true);

  final strings = <String>['one', 'two', 'three'];
  strings.addAll(args);

  final buffer = StringBuffer();

  print(magenta('QuoteBuffer Extension - Example'));

  // Adds:'\'1\'' (Note: Objects are first converted to strings.)
  print(green('// Adding quotation marks.'));
  print(blue('buffer.writeQ(29);'));
  buffer.writeQ(29);
  print(buffer.toString());
  buffer.clear();

  // Adds:'\'name\'\n'
  print(green('// Adding double quotation marks and newline.'));
  print(blue('buffer.writelnQ'
      '(\'name\', delimiter: QuotationMark.DOUBLE);'));
  buffer.writelnQ('name', delimiter: Punctuation.doubleQuotationMark);
  print(buffer.toString());
  buffer.clear();

  // Prints:
  // 'one', 'two', 'three', 'four'
  print(green('// Adding separator and quotation marks.'));
  buffer.writeAllQ(strings);
  print(blue('buffer.writeAllQ'
      '([\'one\',\'two\',\'three\',\'four\'], separator: \', \');'));
  print(buffer.toString());
  buffer.clear();

  print(green('// Adding separator1, quotation marks, separator2, newline.'));
  print(blue(
    'buffer.writelnAllQ('
    '[\'one\',\'two\',\'three\',\'four\'], separator1: \'#\', separator2: \',\');',
  ));
  buffer.writelnAllQ(
    strings,
    separator1: '#',
    separator2: ',',
    delimiter: Punctuation.doubleQuotationMark,
  );
  print(buffer.toString());
}
