import 'package:quote_buffer/quote_buffer.dart';

void main(List<String> args) {
  final strings = <String>['one', 'two', 'three'];
  strings.addAll(args);

  final buffer = StringBuffer();

  print('-------------------------------');
  print('QuoteBuffer Extension - Example');
  print('-------------------------------');

  print('\n// Adding quotation marks.');
  print('buffer.writeQ(29);');
  buffer.writeQ(29);
  print(buffer.toString());
  buffer.clear();

  print('\n// Adding double quotation marks and newline.');
  print('buffer.writelnQ(\'name\', quotationMark: QuotationMark.double);');
  buffer.writelnQ('name', quotationMark: QuotationMark.double);
  print(buffer.toString());
  buffer.clear();

  print('\n// Adding separator and quotation marks.');
  buffer.writeAllQ(strings);
  print(
    'buffer.writeAllQ'
    '([\'one\',\'two\',\'three\'], separator: \', \');',
  );
  print(buffer.toString());
  buffer.clear();

  print('\n// Adding separator1, quotation marks, separator2, newline.');
  print(
    'buffer.writelnAllQ([\'one\',\'two\',\'three\'], '
    'separator1: \'#\', separator2: \',\');',
  );
  buffer.writelnAllQ(
    strings,
    separator1: '#',
    separator2: ',',
    quotationMark: QuotationMark.double,
  );
  print(buffer.toString());
}
