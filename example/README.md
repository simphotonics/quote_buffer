# Quote Buffer


## Examples

The examples located in this folder show how to use the class `QuoteBuffer` to simplify the
generation of string literals whose content is enclosed by escaped quotation marks.

The file [example.dart] demonstrates how to use the methods:
- `string(Object obj)`
- `stringln(Object obj)`
- `stringAll(Iterable<Object> objects)`
- `stinglnAll(Iterable<Object> objects)`.

The intended use of `QuoteBuffer` is with source code generating packages like [code_builder].
The file [example_code_gen.dart] contains a short program illustrating how use `QuoteBuffer` with
a code builder.


## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/quote_buffer/issues
[code_builder]: https://pub.dev/packages/code_builder
[folder example]: https://github.com/simphotonics/quote_buffer/tree/master/example
[example.dart]: https://github.com/simphotonics/quote_buffer/tree/master/example/example.dart
[example_code_gen.dart]: https://github.com/simphotonics/quote_buffer/tree/master/example/example_code_gen.dart
