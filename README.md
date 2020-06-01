# Quote Buffer
[![Build Status](https://travis-ci.com/simphotonics/quote_buffer.svg?branch=master)](https://travis-ci.com/simphotonics/quote_buffer)

## Introduction

In order to add a string literal to generated source code, it is required
to create strings whose content is delimited by escaped quotation marks.

In the following such strings are called *quoted strings*. [QuoteBuffer]
extends Dart's `StringBuffer` by providing methods that simplify
adding quoted strings to the buffer.

## Usage

[QuoteBuffer] adds the following methods
for writing quoted strings to the buffer:
1. `writeQ(Object obj)`: Writes `delimiter`, `obj`, `delimiter` to the buffer.
  ```Dart
  ...
  final buffer = QuoteBuffer();
  buffer.writeQ(29);
  print(buffer.toString());
  ```
  Console output:
  ```Console
  # dart example.dart
  '29'
  ```
- `writelnQ(Object obj)`: Writes `delimiter`, `obj`, `delimiter`, `newline symbol` to the buffer.
  ```Dart
  ...
  final buffer = QuoteBuffer();
  buffer.writelnQ('name');
  print(buffer.toString());
  ```
  Console output:
  ```Console
  # dart example.dart
  'name'

  ```
- `writeAllQ(Iterable\<Object\> objects,[String separator])`: Writes `delimiter`, sequence of `objects`, `delimiter` to the buffer.
  ```Dart
  ...
  final buffer = QuoteBuffer(delimiter: QuotationMark.Double);
  buffer.writeAllQ(['one','two','three','four'], ',');
  print(buffer.toString());
  ```
  Console output:
  ```Console
  # dart example.dart
  "one, two, three, four"
  ```
- `writelnAllQ(Iterable\<Object\> objects,{String separator1, String separator2})`: Writes `objects` in sequence: `delimiter`, `objects[0]`, `separator1`, `delimiter`, `separator2`, `newline symbol`, etc.
  ```Dart
  ...
  final buffer = QuoteBuffer(delimiter: QuotationMark.Double);
  buffer.writelnAllQ(['one','two','three','four'], separator1 = ' #', separator2 = ',');
  print(buffer.toString());
  ```
  Console output:
  ```Console
  # dart example.dart
  "one #",
  "two #",
  "three #",
  "four"

  ```

## Examples

The examples located in the folder [example] show how to use the class [QuoteBuffer] to simplify the generation of string literals whose content is enclosed by escaped quotation marks. One of the programs demonstrates how to use [QuoteBuffer] in the context of code generation.

## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/quote_buffer/issues
[code_builder]: https://pub.dev/packages/code_builder
[example]: example
[QuoteBuffer]: https://pub.dev/packages/quote_buffer