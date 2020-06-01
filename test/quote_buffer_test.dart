import 'package:test/test.dart';
import 'package:quote_buffer/quote_buffer.dart';

void main() {
  group('writeQ():', () {
    test('QuotationMark.Double', () {
      final cb = QuoteBuffer(delimiter: QuotationMark.Double);
      cb.writeQ('TableName');
      expect(cb.toString(), '\"TableName\"');
    });
    test('QuotationMark.Single', () {
      final cb = QuoteBuffer(delimiter: QuotationMark.Single);
      cb.writeQ('TableName');
      expect(cb.toString(), '\'TableName\'');
    });
  });

  group('Testing writeAllQ():', () {
    test('QuotationMark.Double', () {
      final cb = QuoteBuffer(delimiter: QuotationMark.Double);
      cb.writeAllQ(['TableName']);
      expect(cb.toString(), '\"TableName\"');
    });
    test('QuotationMark.Single', () {
      final cb = QuoteBuffer(delimiter: QuotationMark.Single);
      cb.writeAllQ(['TableName']);
      expect(cb.toString(), '\'TableName\'');
    });

    test('Separator.', () {
      final cb = QuoteBuffer();
      cb.writeAllQ(['Column1', 'Column2'], ', ');
      expect(cb.toString(), '\'Column1, Column2\'');
    });

    test('Joining non-whitespace strings.', () {
      final cb = QuoteBuffer();
      cb.writeAllQ(['Column1', 'Column2']);
      expect(cb.toString(), '\'Column1Column2\'');
    });

    test('Joining whitespace strings.', () {
      final cb = QuoteBuffer();
      cb.writeAllQ([' ', '']);
      expect(cb.toString(), '\' \'');
    });
  });

  group('writelnQ():', () {
    test('QuotationMark.Double', () {
      final cb = QuoteBuffer(delimiter: QuotationMark.Double);
      cb.writelnQ('TableName');
      expect(cb.toString(), '\"TableName\"\n');
    });
  });

  group('writelnAllQ()', () {
    test('Single string literal.', () {
      final cb = QuoteBuffer();
      cb.writelnAllQ(['TableName']);
      expect(cb.toString(), '\'TableName\'\n');
    });
    test('Separators', () {
      final cb = QuoteBuffer();
      cb.writelnAllQ(
        ['TableName', 'ColumnName'],
        separator1: '#',
        separator2: ',',
      );
      expect(cb.toString(), '\'TableName#\',\n' '\'ColumnName\'\n');
    });
  });
}
