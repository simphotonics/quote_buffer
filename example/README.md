[![Dart](https://github.com/simphotonics/quote_buffer/actions/workflows/dart.yml/badge.svg)](https://github.com/simphotonics/quote_buffer/actions/workflows/dart.yml)

## Quote Buffer - Example

The example located in this folder show how to use the extension [`Quote`][Quote] to simplify the
generation of string literals whose content is enclosed by escaped quotation marks.

Using a program it is easy to demonstrate how these methods work.
The program can be run in a terminal by navigating to the
folder *example* in your local copy of this library and using the command:
```Shell
$ dart bin/example.dart
```

<details> <summary> Show file contents.</summary>

```Dart
import 'package:quote_buffer/quote_buffer.dart';

/// Ansi color modifier: Reset to default.
const String RESET = '\u001B[0m';

/// Ansi color modifier.
const String BLUE = '\u001B[94m';

/// Ansi color modifier.
const String GREEN = '\u001B[1;32m';

String blue(String input) => BLUE + input + RESET;
String green(String input) => GREEN + input + RESET;

/// To run this program in a terminal navigate to the
/// root directory of the package `quote_buffer`and use:
/// ```Console
/// $ dart -enable-experiment=non-nullabe example/bin/example.dart
/// ```
/// followed by enter.
void main(List<String> args) {
  final strings = <String>['one', 'two', 'three', 'four'];
  strings.addAll(args);

  final buffer = StringBuffer();

  print(green('QuoteBuffer Extension - Example'));

  // Adds:'\'1\'' (Note: Objects are first converted to strings.)
  print('// Adding quotation marks.');
  print(blue('buffer.writeQ(29);'));
  buffer.writeQ(29);
  print(buffer.toString());
  buffer.clear();

  // Adds:'\'name\'\n'
  print('// Adding double quotation marks and newline.');
  print(blue('buffer.writelnQ'
      '(\'name\', delimiter: QuotationMark.DOUBLE);'));
  buffer.writelnQ('name', delimiter: QuotationMark.DOUBLE);
  print(buffer.toString());
  buffer.clear();

  // Prints:
  // 'one', 'two', 'three', 'four'
  print('// Adding separator and quotation marks.');
  buffer.writeAllQ(strings);
  print(blue('buffer.writeAllQ'
      '([\'one\',\'two\',\'three\',\'four\'], separator: \', \');'));
  print(buffer.toString());
  buffer.clear();

  print('// Adding separator1, quotation marks, newline.');
  print(blue(
    'buffer.writelnAllQ('
    '[\'one\',\'two\',\'three\',\'four\'], separator1: \'#\', separator2: \',\');',
  ));
  buffer.writelnAllQ(
    strings,
    separator1: '#',
    separator2: ',',
    delimiter: QuotationMark.DOUBLE,
  );
  print(buffer.toString());
}
```
</details>

## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/quote_buffer/issues
[Quote]: https://pub.dev/documentation/quote_buffer/latest/quote_buffer/Quote.html
