import 'package:ansicolor/ansicolor.dart';
import 'package:quote_buffer/quote_buffer.dart';

// To run this program go to the folder 'quote_buffer/example'
// in your terminal and type
//
// # dart bin/example.dart
//
// followed by enter.
main(List<String> args) {
  List<String> strings = ['one', 'two', 'three', 'four'];
  strings.addAll(args);

  AnsiPen green = AnsiPen()..green(bold: true);
  final buffer = StringBuffer();

  // Adds:'\'1\'' (Note: Objects are first converted to strings.)
  print(green('buffer.writeQ') + '(29);');
  buffer.writeQ(29);
  print(buffer.toString());
  buffer.clear();

  // Adds:'\'name\'\n'
  print(green('buffer.writelnQ') +
      '(\'name\', delimiter: QuotationMark.DOUBLE);');
  buffer.writelnQ('name', delimiter: QuotationMark.DOUBLE);
  print(buffer.toString());
  buffer.clear();

  // Prints:
  // "one,two,three,four"
  buffer.writeAllQ(strings, separator: ',');
  print(green('buffer.writeAllQ') +
      '([\'one\',\'two\',\'three\',\'four\'], separator: \',\');');
  print(buffer.toString());
  buffer.clear();

  print(
    green('buffer.writelnAllQ(') +
        '[\'one\',\'two\',\'three\',\'four\'], separator1: \'#\', separator2: \',\');',
  );
  buffer.writelnAllQ(
    strings,
    separator1: '#',
    separator2: ',',
    delimiter: QuotationMark.DOUBLE,
  );
  print(buffer.toString());
}
