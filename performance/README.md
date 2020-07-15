# Quote Buffer


## Benchmark

To run the benchmark program, navigate to the folder *performance* in your downloaded
copy of this library and use
the following command:
```shell
# dart bin/benchmark.dart
```

The program compares the average runtime of the methods below:
```Dart
/// The benchmark code.
@override
void run() {
  buffer.writelnQ('Line of strings');
  buffer.writeQ('Adding some more strings');
  buffer.write('\n');
  buffer.writelnAllQ(['one', 'two', 'three', 'four'], separator1: ',');
  buffer.writeAllQ(['one', 'two', 'three', 'four'], separator: ',');
}
...

/// The string buffer benchmark code.
@override
void run() {
  buffer.writeln('\'Line of strings\'');
  buffer.write('\'Adding some more strings inline\'');
  buffer.write('\n');
  for (var item in ['one', 'two', 'three', 'four']) {
    buffer.writeln('\'$item,\'');
  }
  buffer.write('\'');
  buffer.writeAll(['one', 'two', 'three', 'four'], ',');
  buffer.write('\'');
}
```
A typical console output for a benchmark run on a machine with a Intel Core Dual i5-6260U CPU @ 1.80GHz is shown below:
![Console Output](https://raw.githubusercontent.com/simphotonics/quote_buffer/master/images/console_output_benchmark.svg?sanitize=true)


## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/quote_buffer/issues
[code_builder]: https://pub.dev/packages/code_builder