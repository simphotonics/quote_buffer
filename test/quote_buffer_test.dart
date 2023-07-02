import 'package:test/test.dart';

import 'package:quote_buffer/quote_buffer.dart';

void main() {
  group('writeQ():', () {
    test('QuotationMark.double', () {
      final b = StringBuffer();
      b.writeQ(
        'TableName',
        delimiter: QuotationMark.double,
      );
      expect(b.toString(), '"TableName"');
    });
    test('QuotationMark.single', () {
      final b = StringBuffer();
      b.writeQ('TableName');
      expect(b.toString(), '\'TableName\'');
    });
  });

  group('writeAllQ():', () {
    test('QuotationMark.double', () {
      final b = StringBuffer();
      b.writeAllQ(['TableName'], delimiter: QuotationMark.double);
      expect(b.toString(), '"TableName"');
    });
    test('QuotationMark.single', () {
      final b = StringBuffer();
      b.writeAllQ(['TableName']);
      expect(b.toString(), '\'TableName\'');
    });

    test('Separator:<, >', () {
      final b = StringBuffer();
      b.writeAllQ(['Column1', 'Column2'], separator: ', ');
      expect(b.toString(), '\'Column1\', \'Column2\'');
    });

    test('Joining non-whitespace strings.', () {
      final b = StringBuffer();
      b.writeAllQ(['Column1', 'Column2'], separator: '');
      expect(b.toString(), '\'Column1\'\'Column2\'');
    });

    test('Joining whitespace strings.', () {
      final b = StringBuffer();
      b.writeAllQ([' ', ''], separator: '');
      expect(b.toString(), '\' \'\'\'');
    });
  });

  group('writelnQ():', () {
    test('QuotationMark.double', () {
      final b = StringBuffer();
      b.writelnQ('TableName', delimiter: QuotationMark.double);
      expect(b.toString(), '"TableName"\n');
    });
  });

  group('writelnAllQ()', () {
    test('single string literal.', () {
      final b = StringBuffer();
      b.writelnAllQ(['TableName']);
      expect(b.toString(), '\'TableName\'\n');
    });
    test('Separators', () {
      final b = StringBuffer();
      b.writelnAllQ(
        ['TableName', 'ColumnName'],
        separator1: '#',
        separator2: ',',
      );
      expect(b.toString(), '\'TableName#\',\n' '\'ColumnName\'\n');
    });
  });
}
