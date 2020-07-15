# Quote Buffer
[![Build Status](https://travis-ci.com/simphotonics/quote_buffer.svg?branch=master)](https://travis-ci.com/simphotonics/quote_buffer)

## Introduction

In order to add a string literal to generated source code, it is required
to create strings whose content is delimited by escaped quotation marks.

In the following such strings are called *quoted strings*. [QuoteBuffer]
is an extension on Dart's `StringBuffer` and providing methods that simplify
adding quoted strings to the buffer.

## Usage

To use this library include [quote_buffer] as dependency in your `pubspec.yaml` file.
The section below lists the methods provided for writing *quoted strings* to the
buffer and shows the console output obtained by printing the buffer content.
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
    buffer..writeAllQ(
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
    buffer..writelnAllQ(
      ['one','two','three','four'],
      separator1: ' #',
      separator2: ',',
      delimiter: QuotationMark.DOUBLE,
    );
    print(buffer..toString()); // Console output below \/
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

The examples located in the folder [example] show how to use the class [QuoteBuffer] to simplify the generation of string literals whose content is enclosed by escaped quotation marks. One of the programs demonstrates how to use [QuoteBuffer] in the context of code generation.

## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/quote_buffer/issues
[code_builder]: https://pub.dev/packages/code_builder
[example]: example
[QuoteBuffer]: https://pub.dev/packages/quote_buffer
[quote_buffer]: https://pub.dev/packages/quote_buffer