# Quote Buffer
[![Build Status](https://travis-ci.com/simphotonics/quote_buffer.svg?branch=master)](https://travis-ci.com/simphotonics/quote_buffer)

## Introduction

Automated code generation can be used to eliminate the need of writing and maintaining repetitive
parts of a software. In order to add a string literal to generated source code, it is required
to create strings whose content is delimited by escaped quotation marks.

In the following such strings are called *quoted strings*. **QuoteBuffer** simplifies
adding quoted strings to a string buffer.

## Usage

**QuoteBuffer** extends Dart's **StringBuffer**. It adds the following methods
for writing quoted strings to the buffer:
- ```writeQ(Object obj):```:
  Converts an object to a quoted string.
  ```Dart
  var buffer = QuoteBuffer();
  // Adds:'\'29\''
  buffer.writeQ(29);
  ```
- ```writelnQ(Object obj):```
  Converts an object to a quoted string followed by a newline symbol.
  ```Dart
  // Adds:'\'name\'\n'
  buffer.writelnQ('name');
  ```
- ```writeAllQ(Iterable<Object> objects,[String separator]):```
  Converts a list of objects to a quoted string.
  Separators are optional.
  ```Dart
  // Adds:'\'one,two\''
  buffer.writeAllQ(['one','two'], ',');
  ```
- ```writelnAllQ(Iterable<Object> objects,[String separator]):```
  Converts each object in the list of objects
  to a quoted string followed by a newline symbol.
  Separators are optional.
  ```Dart
  // Adds:
  // '\'one\';\n'
  // '\'two\';\n'
  // '\'three\'\n'
  buffer.writelnAllQ(['one','two','three'], ';');
  ```

## Examples

The examples located in the folder [example] show how to use the class **QuoteBuffer** to simplify the
generation of string literals whose content is enclosed by escaped quotation marks. One of the programs demonstrates how to use **QuoteBuffer** in the context of code generation.

## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/quote_buffer/issues
[code_builder]: https://pub.dev/packages/code_builder
[example]: example