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

  var buffer = QuoteBuffer();

  // Adds:'\'1\'' (Note: Objects are first converted to strings.)
  buffer.writeQ(1);

  // Adds a new line
  buffer.writeln('');

  // Adds:'\'name\'\n'
  buffer.writelnQ('name');

  // Adds:'\'one,two,three,four\''
  buffer.writeAllQ(strings, ',');

  // Adds a new line
  buffer.writeln('');

  // Adds:'\'======\'\n'
  buffer.writelnQ('======');

  // Adds:
  // '\'one\';\n'
  // '\'two\';\n'
  // '\'three\';\n''
  // '\'four\'\n'
  buffer.writelnAllQ(strings, ';');

  // Prints:
  // 'name'
  // 'one,two,three,four'
  // '======'
  // 'one';
  // 'two';
  // 'three';
  // 'four'
  print(buffer.toString());

  buffer = QuoteBuffer(
    delimiter: QuotationMark.Double,
  );

  // Adds:
  // '\"one\"'
  // '\"two\"'
  // '\"three\"'
  // '\"four\"'
  buffer.writeAllQ(strings, ',');

  // Prints:
  // "one,two,three,four"
  print(buffer.toString());
}
