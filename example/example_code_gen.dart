import 'package:ansicolor/ansicolor.dart';
import 'package:code_builder/code_builder.dart';
import 'package:quote_buffer/quote_buffer.dart';
import 'package:dart_style/dart_style.dart';
import 'package:meta/meta.dart';

// To run this program go to the folder 'quote_buffer/example'
// in your terminal and type
//
// # dart example_code_gen.dart
//
// followed by enter.
main() {
  // Column Info
  Map<String, String> columnMap = {
    'id': 'INTEGER PRIMARY KEY',
    'firstName': 'TEXT NOT NULL',
    'lastName': 'TEXT NOT NULL',
  };

  AnsiPen green = AnsiPen()..green(bold: true);
  AnsiPen blue = AnsiPen()..blue(bold: true);

  print(green('Running Code Generation Example:\n'));

  // Generate field
  Field init = _init(
    tableName: 'User',
    columnMap: columnMap,
  );

  // Generate source code
  String sourceCode = init.accept(DartEmitter()).toString();

  // Format source code
  String formatedCode = DartFormatter().format(sourceCode);

  formatedCode = blue(formatedCode);

  // Prints:
  // /// Statement used to initialize the table User.
  // final String init = 'CREATE TABLE User ('
  //     'id INTEGER PRIMARY KEY,'
  //     'firstName TEXT NOT NULL,'
  //     'lastName TEXT NOT NULL'
  //     ')';
  print(formatedCode);
}

/// Creates source code representing a field of type [String] and name 'init'.
Field _init(
    {@required String tableName, @required Map<String, String> columnMap}) {
  var buffer = QuoteBuffer();
  // Specify table name
  buffer.writelnQ('CREATE TABLE $tableName (');
  // Specify columns
  List<String> columns = [];
  // Iterate over each entry in columnMap
  for (MapEntry<String, String> column in columnMap.entries) {
    columns.add('${column.key} ${column.value}');
  }

  // Add a separator and a newline symbol after each column specification.
  buffer.writelnAllQ(columns, ',');

  buffer.writelnQ(')');

  return Field((b) => b
    ..modifier = FieldModifier.final$
    ..name = 'init'
    ..assignment = Code(buffer.toString())
    ..type = refer('String')
    ..docs.add('/// Statement used to initialize the '
        'table $tableName.'));
}
