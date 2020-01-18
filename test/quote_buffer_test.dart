import 'package:test/test.dart';
import 'package:quote_buffer/quote_buffer.dart';

void main() {
  group('Testing writeQ():', () {
    test('Quote string literal with double quote delimiters.', () {
      final cb = QuoteBuffer(delimiter: QuotationMark.Double);
      cb.writeQ('TableName');
      expect(cb.toString(), '\"TableName\"');
    });
    test('Quoted string literal with single quote delimiters.', () {
      final cb = QuoteBuffer(delimiter: QuotationMark.Single);
      cb.writeQ('TableName');
      expect(cb.toString(), '\'TableName\'');
    });
  });

  group('Testing writeAllQ():', () {
    test('Quoted string literal with double quote delimiters.', () {
      final cb = QuoteBuffer(delimiter: QuotationMark.Double);
      cb.writeAllQ(['TableName']);
      expect(cb.toString(), '\"TableName\"');
    });
    test('Quoted string literal with single quote delimiters.', () {
      final cb = QuoteBuffer(delimiter: QuotationMark.Single);
      cb.writeAllQ(['TableName']);
      expect(cb.toString(), '\'TableName\'');
    });

    test('Strings separated by commas.', () {
      final cb = QuoteBuffer();
      cb.writeAllQ(['Column1', 'Column2'], ', ');
      expect(cb.toString(), '\'Column1, Column2\'');
    });

    test('Joining two non-whitespace strings.', () {
      final cb = QuoteBuffer();
      cb.writeAllQ(['Column1', 'Column2']);
      expect(cb.toString(), '\'Column1Column2\'');
    });

    test('Joining two whitespace strings.', () {
      final cb = QuoteBuffer();
      cb.writeAllQ([' ', '']);
      expect(cb.toString(), '\' \'');
    });
  });

  group('Testing writelnQ():', () {
    test('String literal terminated with a newline.', () {
      final cb = QuoteBuffer(delimiter: QuotationMark.Double);
      cb.writelnQ('TableName');
      expect(cb.toString(), '\"TableName\"\n');
    });
  });

  group('Testing writelnAllQ()', () {
    test('Single string literal terminated with a newline.', () {
      final cb = QuoteBuffer();
      cb.writelnAllQ(['TableName']);
      expect(cb.toString(), '\'TableName\'\n');
    });
    test(
        'Two separate string literals, \n'
        '\t\t\t each terminated with a newline character.', () {
      final cb = QuoteBuffer();
      cb.writelnAllQ(['TableName', 'ColumnName']);
      expect(cb.toString(), '\'TableName\'\n' '\'ColumnName\'\n');
    });
  });
}
