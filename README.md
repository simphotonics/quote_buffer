# Quote Buffer
[![Build Status](https://travis-ci.com/simphotonics/quote_buffer.svg?branch=master)](https://travis-ci.com/simphotonics/quote_buffer)

## Introduction

In order to add a string literal to generated source code, it is required
to create strings whose content is delimited by escaped quotation marks.

In the following such strings are called *quoted strings*. [QuoteBuffer]
extends Dart's `StringBuffer` by providing methods that simplify
adding quoted strings to the buffer.

## Usage

To use this library include [quote_buffer] as dependency in your `pubspec.yaml` file. The buffer can be configured to use single or double quotation marks. The constructor parameter `delimiter` defaults
to `QuotationMark.Single`.
```Dart
/// QuoteBuffer with single quotation mark as string delimiter.
final bufferS = QuoteBuffer();

/// QuoteBuffer with double quotation mark as string delimiter.
final bufferD = QuoteBuffer(delimiter: QuotationMark.Double);
```

The section below lists the methods provided for writing *quoted strings* to the buffer and shows the console output obtained by printing the buffer.
1. **writeQ**(Object obj)

    Writes *delimiter*, *obj*, *delimiter* to the buffer.
    ```Dart
    bufferS.writeQ(29);
    print(bufferS.toString()); // Console output below \/
    ```
    ```Console
    '29'
    ```

2. **writelnQ**(Object obj)

    Writes *delimiter*, *obj*, *delimiter*, *newline symbol* to the buffer.
    ```Dart
    final bufferS = QuoteBuffer();
    bufferS.writelnQ('name');
    print(bufferS.toString()); // Console output below \/
    ```
    ```Console
    'name'


    ```
3. **writeAllQ**(Iterable objects,[String separator])

    Writes *delimiter*, sequence of *objects*, *delimiter* to the buffer.
    ```Dart
    bufferD.writeAllQ(
      ['one','two','three','four'],
       ',',
    );
    print(buffer.toString()); // Console output below \/
    ```
    ```Console
    "one, two, three, four"
    ```

4. **writelnAllQ**(Iterable objects,{String separator1, String separator2})

    Writes *objects* in sequence: *delimiter*, *objects[0]*, *separator1*, *delimiter*, *separator2*, *newline symbol*, etc.
    ```Dart
    bufferD.writelnAllQ(
      ['one','two','three','four'],
      separator1 = ' #',
      separator2 = ',',
    );
    print(bufferD.toString()); // Console output below \/
    ```
    ```Console
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