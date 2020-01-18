import 'package:quote_buffer/quote_buffer.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:benchmark_harness/benchmark_harness.dart';

// Create a new benchmark by extending BenchmarkBase
class QuoteBufferBenchmark extends BenchmarkBase {
  QuoteBufferBenchmark() : super('QuoteBuffer');

  static void main() {
    QuoteBufferBenchmark().report();
  }

  final cbuffer = QuoteBuffer();

  /// The benchmark code.
  @override
  void run() {
    cbuffer.writelnQ('Line of code');
    cbuffer.writeQ('Adding some more code');
    cbuffer.write('\n');
    cbuffer.writelnAllQ(['one', 'two', 'three', 'four'], ',');
    cbuffer.writeAllQ(['one', 'two', 'three', 'four'], ',');
  }

  static String test() {
    var bm = QuoteBufferBenchmark();
    bm.run();
    return bm.cbuffer.toString();
  }

  /// Not measured setup code executed prior to the benchmark runs.
  @override
  void setup() {}

  /// Not measures teardown code executed after the benchmark runs.
  @override
  void teardown() {
    int no = cbuffer.length ~/ test().length;
    AnsiPen magenta = new AnsiPen()..magenta(bold: true);
    String number = magenta('$no');
    print('Added string $number times.');
  }
}

// Create a new benchmark by extending BenchmarkBase
class StringBufferBenchmark extends BenchmarkBase {
  StringBufferBenchmark() : super('StringBuffer');

  final sbuffer = StringBuffer();

  static void main() {
    StringBufferBenchmark().report();
  }

  /// The string buffer benchmark code.
  @override
  void run() {
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

  static String test() {
    var bm = StringBufferBenchmark();
    bm.run();
    return bm.sbuffer.toString();
  }

  /// Not measured setup code executed prior to the benchmark runs.
  @override
  void setup() {}

  /// Not measures teardown code executed after the benchmark runs.
  @override
  void teardown() {
    int no = sbuffer.length ~/ test().length;
    AnsiPen magenta = new AnsiPen()..magenta(bold: true);
    String number = magenta('$no');
    print('Added string $number times.');
  }
}

void main() {
  AnsiPen green = AnsiPen()..green(bold: true);
  AnsiPen blue = AnsiPen()..blue(bold: true);

  print(blue('This is the test string:'));
  print(QuoteBufferBenchmark.test());
  print('\n');
  print(blue('Asserting both classes add the same string:'));
  assert(QuoteBufferBenchmark.test() == StringBufferBenchmark.test());
  print(green('Passed\n'));

  print(blue('Running StringBuffer Benchmark ...\n'));

  // Run benchmark tests:
  StringBufferBenchmark.main();

  print(blue('\nRunning QuoteBuffer Benchmark ...'));
  QuoteBufferBenchmark.main();

  print('\n');
}
