# Quote Buffer
[![Build Status](https://travis-ci.com/simphotonics/quote_buffer.svg?branch=master)](https://travis-ci.com/simphotonics/quote_buffer)

## Introduction

In the context of source code generation it is required to enclose emitted strings with
(escaped) quotation marks. In the following, such strings are called *quoted strings*.
Manually delimiting strings with quotation marks is error-prone
and repetitive especially when dealing with a collection of string-items.

The package [`quote_buffer`][quote_buffer] provides [`Quote`][Quote]
an extension on Dart's [`StringBuffer`][StringBuffer] that adds  methods for
transforming single objects and lists of objects into *quoted strings*.

## Usage

To use this library include [quote_buffer] as dependency in your `pubspec.yaml` file.
The section below lists the methods provided for writing *quoted strings* to the
buffer and shows the console output obtained by printing the buffer content.
It is assumed that `buffer` is an instance of `StringBuffer`.
1. **writeQ**(Object obj, {QuotationMark delimiter})

    Writes *delimiter*, *obj*, *delimiter* to the buffer.
    ```Dart
    buffer.writeQ(29);
    print(buffer.toString()); // Console output below \/
    ```
    ```Console
    '29'
    ```

2. **writelnQ**(Object obj, {QuotationMark delimiter})

    Writes *delimiter*, *obj*, *delimiter*, *newline symbol* to the buffer.
    ```Dart
    final bufferS = QuoteBuffer();
    buffer.writelnQ('name', delimiter: QuotationMark.DOUBLE);
    print(buffer.toString()); // Console output below \/
    print('--- ---');
    ```
    ```Console
    "name"

    --- ---
    ```
3. **writeAllQ**(Iterable objects, {String separator, QuotationMark delimiter})

    Writes *delimiter*, sequence of *objects*, *delimiter* to the buffer.
    ```Dart
    buffer.writeAllQ(
      ['one','two','three','four'],
       separator: ',',
    );
    print(buffer.toString()); // Console output below \/
    ```
    ```Console
    "one, two, three, four"
    ```

4. **writelnAllQ**(Iterable objects, {String separator1, String separator2, QuoationMark delimiter})

    Writes *objects* in sequence: *delimiter*, *objects[0]*, *separator1*, *delimiter*, *separator2*, *newline symbol*, etc.
    ```Dart
    buffer.writelnAllQ(
      ['one','two','three','four'],
      separator1: ' #',
      separator2: ',',
      delimiter: QuotationMark.DOUBLE,
    );
    print(buffer.toString()); // Console output below \/
    print('--- ---');
    ```
    ```Console
     "one #",
     "two #",
     "three #",
     "four"

     --- ---
    ```

## Examples

The example located in the folder [example] shows how to use the extension [`Quote`][Quote] to simplify the generation of string literals whose content is enclosed by escaped quotation marks.

## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/quote_buffer/issues

[example]: example
[quote_buffer]: https://pub.dev/packages/quote_buffer
[Quote]: https://pub.dev/documentation/quote_buffer/latest/quote_buffer/Quote.html
[StringBuffer]: https://api.dart.dev/stable/2.8.4/dart-core/StringBuffer-class.html