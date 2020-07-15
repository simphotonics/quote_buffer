import 'package:ansicolor/ansicolor.dart';
import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:quote_buffer/quote_buffer.dart';

// Create a new benchmark by extending BenchmarkBase
class QuoteBenchmark extends BenchmarkBase {
  QuoteBenchmark(String name) : super(name);

  final buffer = StringBuffer();
  final magenta = AnsiPen()..magenta(bold: true);
  final green = AnsiPen()..green(bold: true);
  final blue = AnsiPen()..blue(bold: true);

  int counter = 0;

  /// The benchmark code.
  @override
  void run() {
    buffer.writelnQ('Line of strings');
    buffer.writeQ('Adding some more strings');
    buffer.write('\n');
    buffer.writelnAllQ(['one', 'two', 'three', 'four'], separator1: ',');
    buffer.writeAllQ(['one', 'two', 'three', 'four'], separator: ',');
    ++counter;
  }

  /// Not measures teardown code executed after the benchmark runs.
  @override
  void teardown() {
    print(blue('\nRunning ${this.runtimeType}.'));
    buffer.clear();
    run();
    --counter;
    print('Added string: \n${green(buffer.toString())} \n '
        '${magenta(counter.toString())} times.');
    buffer.clear();
    counter = 0;
  }
}

// Create a new benchmark by extending BenchmarkBase
class StringBufferBenchmark extends QuoteBenchmark {
  StringBufferBenchmark(String name) : super(name);

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
    ++counter;
  }
}

void main() {
  final q = QuoteBenchmark('QuoteBenchmark');
  final s = StringBufferBenchmark('StringBufferBenchmark');
  q.report();
  s.report();
  print('\n');
}
