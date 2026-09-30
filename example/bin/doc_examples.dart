import 'package:quote_buffer/quote_buffer.dart';

void main(List<String> args) {
  final list = [1, 2, 3];

  final b = StringBuffer();
  b.writeAllQ(list);
  print('writeAllQ([1, 2, 3])');
  print(b);
  print('');

  b.clear();
  print('writelnAllQ([1, 2, 3], separator1:\', \', separator2:\'; \')');
  b.writelnAllQ(list, separator1: ', ', separator2: '; ');
  print(b);

  b.clear();
  print('writelnAll([1, 2, 3], \', \')');
  b.writelnAll(list, separator: ', ');
  print(b);
}
