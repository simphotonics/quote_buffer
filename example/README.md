# Quote Buffer
[![Build Status](https://travis-ci.com/simphotonics/quote_buffer.svg?branch=master)](https://travis-ci.com/simphotonics/quote_buffer)


## Examples

The examples located in this folder show how to use the class `QuoteBuffer` to simplify the
generation of string literals whose content is enclosed by escaped quotation marks.

The file [example.dart] demonstrates how to use the methods:
- `writeQ(Object obj)`
    Converts an object to a quoted string.
- `writelnQ(Object obj)`
    Converts an object to a quoted string followed by a newline symbol.
- `writeAllQ(Iterable<Object> objects,[String separator])`
     Converts a list of objects to a quoted string. Separators are optional.
- `writelnAllQ(Iterable<Object> objects,[String separator])`
     Converts each object in the list of objects to a quoted string followed by
      a newline symbol. Separators are optional.

The intended use of `QuoteBuffer` is with source code generating packages like [code_builder].
The file [example_code_gen.dart] contains a short program illustrating how to use `QuoteBuffer` with a code generator.


## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/quote_buffer/issues
[code_builder]: https://pub.dev/packages/code_builder
[folder example]: https://github.com/simphotonics/quote_buffer/tree/master/example
[example.dart]: https://github.com/simphotonics/quote_buffer/tree/master/example/example.dart
[example_code_gen.dart]: https://github.com/simphotonics/quote_buffer/tree/master/example/example_code_gen.dart
