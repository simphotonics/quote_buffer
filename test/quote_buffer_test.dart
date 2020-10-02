import 'package:minimal_test/minimal_test.dart';
import 'package:quote_buffer/quote_buffer.dart';

void main() {
  group('writeQ():', () {
    test('QuotationMark.Double', () {
      final b = StringBuffer();
      b.writeQ(
        'TableName',
        delimiter: QuotationMark.DOUBLE,
      );
      expect(b.toString(), '\"TableName\"');
    });
    test('QuotationMark.Single', () {
      final b = StringBuffer();
      b.writeQ('TableName');
      expect(b.toString(), '\'TableName\'');
    });
  });

  group('writeAllQ():', () {
    test('QuotationMark.Double', () {
      final b = StringBuffer();
      b.writeAllQ(['TableName'], delimiter: QuotationMark.DOUBLE);
      expect(b.toString(), '\"TableName\"');
    });
    test('QuotationMark.Single', () {
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
    test('QuotationMark.Double', () {
      final b = StringBuffer();
      b.writelnQ('TableName', delimiter: QuotationMark.DOUBLE);
      expect(b.toString(), '\"TableName\"\n');
    });
  });

  group('writelnAllQ()', () {
    test('Single string literal.', () {
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
