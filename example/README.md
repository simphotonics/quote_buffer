# Quote Buffer
[![Build Status](https://travis-ci.com/simphotonics/quote_buffer.svg?branch=master)](https://travis-ci.com/simphotonics/quote_buffer)


## Examples

The examples located in this folder show how to use the class [QuoteBuffer] to simplify the
generation of string literals whose content is enclosed by escaped quotation marks.

Using a program it is easy to demonstrate how these methods work.
The program can be run in a terminal by navigating to the
folder *example* in your local copy of this library and using the command:
```Shell
$ dart example.dart
```

```Dart
import 'package:ansicolor/ansicolor.dart';
import 'package:quote_buffer/quote_buffer.dart';

// To run this program in a console navigate to the folder 'quote_buffer/example'
// in your local copy of the library and use the command
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
```

## Code Generation

The intended use of **QuoteBuffer** is with source code generating packages like [code_builder].
Function **_init** below shows how to generate a quoted string that represents a valid multi-line Dart String literal.

```Dart
import 'package:code_builder/code_builder.dart';
import 'package:quote_buffer/quote_buffer.dart';
import 'package:dart_style/dart_style.dart';
import 'package:meta/meta.dart';

main(List<String> args) {

  // Column Info:
  // Keys representing column name,
  // Values representing column type and constraints.
  Map<String, String> columnMap = {
    'id': 'INTEGER PRIMARY KEY',
    'firstName': 'TEXT NOT NULL',
    'lastName': 'TEXT NOT NULL',
  };

  // Generate field
  Field init = _init(
    tableName: 'User',
    columnMap: columnMap,
  );

  // Generate source code
  String sourceCode = init.accept(DartEmitter()).toString();

  // Format source code
  String formatedCode = DartFormatter().format(sourceCode);

  // Prints:
  // /// Statement used to initialize the table User.
  // final String init = 'CREATE TABLE User ('
  //     'id INTEGER PRIMARY KEY, '
  //     'firstName TEXT NOT NULL, '
  //     'lastName TEXT NOT NULL'
  //     ')';
  print(formatedCode);
}

/// Creates source code representing a field of type [String] and name 'init'.
Field _init(
    {@required String tableName, @required Map<String, String> columnMap}) {
  var buffer = QuoteBuffer();

  // Specify table name
  // Start of multi-line string literal ---------------- Usage of QuoteBuffer
  buffer.writelnQ('CREATE TABLE $tableName (');

  // Specify columns
  List<String> columns = [];
  // Iterate over each entry in columnMap
  for (MapEntry<String, String> column in columnMap.entries) {
    columns.add('${column.key} ${column.value}');
  }

  // writelnAllQ adds a newline symbol ----------------- Usage of QuoteBuffer
  // and a separator after each column entry.
  buffer.writelnAllQ(columns, ',');

  // End of multi-line string literal ------------------ Usage of QuoteBuffer
  buffer.writelnQ(')');

  return Field((b) => b
    ..modifier = FieldModifier.final$
    ..name = 'init'
    ..assignment = Code(buffer.toString())
    ..type = refer('String')
    ..docs.add('/// Statement used to initialize the '
        'table $tableName.'));
}
```
The program above can be run in a terminal by navigating to the
folder *example* in your local copy of this library and using the command:
```Shell
$ dart example_code_gen.dart
```
The expected output is:
```Shell
/// Statement used to initialize the table User.
final String init = 'CREATE TABLE User ('
    'id INTEGER PRIMARY KEY,'
    'firstName TEXT NOT NULL,'
    'lastName TEXT NOT NULL'
    ')';
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/quote_buffer/issues
[code_builder]: https://pub.dev/packages/code_builder
