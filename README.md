# Quote Buffer
[![Dart](https://github.com/simphotonics/quote_buffer/actions/workflows/dart.yml/badge.svg)](https://github.com/simphotonics/quote_buffer/actions/workflows/dart.yml)

## Introduction

In the context of source code generation it is often required to enclose
emitted strings with (escaped) quotation marks.
In the following, such strings are called *quoted strings*.
Manually delimiting strings with quotation marks is error-prone
and repetitive especially when dealing with a collection of string-items.

The package [`quote_buffer`][quote_buffer] provides [`Quote`][Quote]
an extension on Dart's [`StringBuffer`][StringBuffer] that adds  methods for
transforming single objects and iterables into *quoted strings*.

## Usage

To use this library include [`quote_buffer`][quote_buffer]
as dependency in your `pubspec.yaml` file.
The section below lists the methods provided
and shows the console output obtained by printing the buffer content.

1. [`writeQ`][writeQ]: Writes `quotationMark + obj + quotationMark`
   to the buffer.
    ```Dart
    import 'package:quote_buffer/quote_buffer.dart';

    final b = StringBuffer();
    b.writeQ(29);
    print(b.toString()); // Console output below
    ```
    ```Console
    '29'
    ```

2. [`writelnQ`][writelnQ]: Writes `quotationMark + obj + quotationMark + newline`
   to the buffer.
    ```Dart
    import 'package:quote_buffer/quote_buffer.dart';

    final b = StringBuffer();
    b.writelnQ('name', quotationMark: QuotationMark.double);
    print(b.toString()); // Console output below
    print('--- ---');
    ```
    ```Console
    "name"

    --- ---
    ```
3. [`writeAllQ`][writeAllQ]: Writes `quotationMark + objects[0] + quotationMark + separator ...`,
   to the buffer.
    ```Dart
    import 'package:quote_buffer/quote_buffer.dart';

    final b = StringBuffer();
    b.writeAllQ(['one','two','three'], separator: ', ');
    print(b.toString()); // Console output below
    ```
    ```Console
    'one', 'two', 'three',
    ```

4. [`writelnAllQ`][writelnAllQ]: Writes `quotationMark + objects[0] + separator1 + quotationMark + separator2 + newline ...` to the buffer.
    ```Dart
    import 'package:quote_buffer/quote_buffer.dart';

    final b = StringBuffer();
    b.writelnAllQ(
      ['one','two','three'],
      separator1: '#',
      separator2: ',',
      quotationMark: QuotationMark.double,
    );
    print(b.toString()); // Console output below
    print('--- ---');
    ```
    ```Console
     "one#",
     "two#",
     "three#",

     --- ---
    ```

5. [`writelnAll`][writelnAll]: Writes `objects[0] + separator + newline ...` to the buffer.
    ```Dart
    import 'package:quote_buffer/quote_buffer.dart';
    final b = StringBuffer();
    b.writelnAll(['one','two','three'], separator: ',');
    print(b.toString()); // Console output below
    print('--- ---');
    ```
    ```Console
     one,
     two,
     three,

     --- ---
    ```

The methods writing an `Iterable` to the [`StringBuffer`][StringBuffer] accept
the parameter `addTrailingSeparator`. Its value may be set to `false`
to prevent the addition of a trailing separator.


## Examples

The example located in the folder [example] shows how to use the extension
[`Quote`][Quote] to simplify the generation of string literals whose content is enclosed by escaped quotation marks.

## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/quote_buffer/issues

[example]: https://github.com/simphotonics/quote_buffer/tree/main/example

[quote_buffer]: https://pub.dev/packages/quote_buffer

[Quote]: https://pub.dev/documentation/quote_buffer/latest/quote_buffer/Quote.html

[StringBuffer]: https://api.dart.dev/stable/dart-core/StringBuffer-class.html

[writeAllQ]: https://pub.dev/documentation/quote_buffer/latest/quote_buffer/Quote/writeAllQ.html

[writeQ]: https://pub.dev/documentation/quote_buffer/latest/quote_buffer/Quote/writeQ.html

[writelnQ]: https://pub.dev/documentation/quote_buffer/latest/quote_buffer/Quote/writelnQ.html

[writeAllQ]: https://pub.dev/documentation/quote_buffer/latest/quote_buffer/Quote/writeAllQ.html

[writelnAll]: https://pub.dev/documentation/quote_buffer/latest/quote_buffer/Quote/writelnAll.html

[writelnAllQ]: https://pub.dev/documentation/quote_buffer/latest/quote_buffer/Quote/writelnAllQ.html