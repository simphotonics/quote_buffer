# Quote Buffer


## Benchmark

To run the benchmark program, navigate to the performance folder in your downloaded
copy of this library and use
the following command:
```shell
# dart benchmark.dart
```

The program compares the average runtime of the methods below:
```Dart
/// The code string buffer benchmark code.
  @override
  void runQSB() {
    cbuffer.writelnQ('Line of code');
    cbuffer.writeQ('Adding some more code');
    cbuffer.write('\n');
    cbuffer.writelnAllQ(['one', 'two', 'three', 'four'], ',');
    cbuffer.writeAllQ(['one', 'two', 'three', 'four'], ',');
  }

  /// The string buffer benchmark code.
  @override
  void runSB() {
    sbuffer.writeln('\'Line of strings\'');
    sbuffer.write('\'Adding some more strings inline\'');
    sbuffer.write('\n');
    for (var item in ['one', 'two', 'three', 'four']) {
      sbuffer.writeln('\'$item,\'');
    }
    sbuffer.write('\'');
    sbuffer.writeAll(['one', 'two', 'three', 'four'], ',');
    sbuffer.write('\'');
  }
```
A typical output for a benchmark run on a machine with a Intel Core Dual i5-6260U CPU @ 1.80GHz is listed below:
```
This is the test string:
'Line of code'
'Adding some more code'
'one,'
'two,'
'three,'
'four'
'one,two,three,four'

Asserting both classes add the same string:
Passed

Running StringBuffer Benchmark ...
Added string 2255589 times.
StringBuffer(RunTime): 9.09316832313386 us.

Running QuoteBuffer Benchmark ...
Added string 1856154 times.
QuoteBuffer(RunTime): 11.203545920510882 us.
```



## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/quote_buffer/issues
[code_builder]: https://pub.dev/packages/code_builder