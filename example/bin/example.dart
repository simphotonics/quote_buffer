import 'package:ansicolor/ansicolor.dart';
import 'package:quote_buffer/quote_buffer.dart';

// To run this program go to the folder 'quote_buffer/example'
// in your terminal and type
//
// # dart example.dart
//
// followed by enter.
main(List<String> args) {
  List<String> strings = ['one', 'two', 'three', 'four'];
  strings.addAll(args);

  AnsiPen green = AnsiPen()..green(bold: true);
  AnsiPen blue = AnsiPen()..blue(bold: true);
  var buffer = QuoteBuffer();

  // Adds:'\'1\'' (Note: Objects are first converted to strings.)
  print(green('buffer.writeQ(29);'));
  buffer.writeQ(29);
  print(buffer.toString());
  buffer.clear();

  // Adds:'\'name\'\n'
  print(green('buffer.writelnQ(\'name\');'));
  buffer.writelnQ('name');
  print(buffer.toString());
  buffer.clear();

  buffer = QuoteBuffer(
    delimiter: QuotationMark.Double,
  );
  buffer.writeAllQ(strings, ',');

  // Prints:
  // "one,two,three,four"
  print(blue('final buffer = QuoteBuffer('
      'delimiter: QuotationMark.Double,'
      '); '));
      
  print(green('buffer.writeAllQ([\'one\',\'two\',\'three\',\'four\'],\',\');'));
  print(buffer.toString());
  buffer.clear();

  print(green(
    'buffer.writelnAllQ([\'one\',\'two\',\'three\',\'four\'], separator1: \'#\', separator2: \',\');',
  ));
  buffer.writelnAllQ(strings, separator1: '#', separator2: ',');
  print(buffer.toString());
}
