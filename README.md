# Quote Buffer


## Introduction

Automated code generation can be used to eliminate the need of writing and maintaining repetitive
parts of a software. In order to add a string literal to the generated source code, it is required
to create strings whose content is delimited by escaped quotation marks. In the following such
string are called *quoted strings*.

`QuoteBuffer` simplifies adding quoted strings to a string buffer.

## Usage

`QuoteBuffer` adds the following methods for writing quoted strings to `StringBuffer`:
- `writeQ(Object obj)`
    Converts an object to a quoted string.
- `writelnQ(Object obj)`
    Converts an object to a quoted string followed by a newline symbol.
- `writeAllQ(Iterable<Object> objects,[String separator])`
     Converts a list of objects to a quoted string. Separators are optional.
- `writelnAllQ(Iterable<Object> objects,[String separator])`
     Converts each object in the list of objects to a quoted string followed by
      a newline symbol. Separators are optional.


Using a program it is easy to demonstrate how these methods work.
The program can be run in a terminal by navigating to the
folder *example* in your local copy of this library and using the command:
```Shell
$ dart example.dart
```

```Dart
import 'package:quote_buffer/quote_buffer.dart';

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
  // '1'
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
  // '\"one,two,three,four\"'
  buffer.writeAllQ(strings, ',');

  // Prints:
  // "one,two,three,four"
  print(buffer.toString());
}
```

### Code Generation

The intended use of `QuoteBuffer` is with source code generating packages like [code_builder].
Function `_init` below shows how to generate a quoted string that represents a valid multi-line Dart `String` literal.

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

  // stringlnAll adds a newline symbol ----------------- Usage of QuoteBuffer
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

/// Statement used to initialize the table User.
final String init = 'CREATE TABLE User ('
    'id INTEGER PRIMARY KEY,'
    'firstName TEXT NOT NULL,'
    'lastName TEXT NOT NULL'
    ')';
```


## Examples

For a simple example on how to use `QuoteBuffer` see:
[example.dart](https://github.com/simphotonics/quote_buffer/blob/master/example/example.dart).

## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/quote_buffer/issues
[code_builder]: https://pub.dev/packages/code_builder
[example]: https://github.com/simphotonics/quote_buffer/tree/master/example
