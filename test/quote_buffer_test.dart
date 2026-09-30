import 'package:test/test.dart';

import 'package:quote_buffer/quote_buffer.dart';

const x = 'x';
const y = 'y';
const x1 = 'x1';
const y1 = 'y1';
const x2 = 'x2';
const y2 = 'y2';

void main() {
  group('writeQ():', () {
    test('QuotationMark.double', () {
      final b = StringBuffer();
      b.writeQ(x, quotationMark: QuotationMark.double);
      expect(b.toString(), '"x"');
    });
    test('QuotationMark.single', () {
      final b = StringBuffer();
      b.writeQ(x);
      expect(b.toString(), '\'x\'');
    });
  });

  group('writeAllQ():', () {
    test('QuotationMark.double', () {
      final b = StringBuffer();
      b.writeAllQ([x1, x2], quotationMark: QuotationMark.double);
      expect(b.toString(), '"x1", "x2", ');
    });
    test('QuotationMark.single', () {
      final b = StringBuffer();
      b.writeAllQ([x1, x2], addTrailingSeparator: false);
      expect(b.toString(), '\'x1\', \'x2\'');
    });

    test('Separator:";"', () {
      final b = StringBuffer();
      b.writeAllQ([x1, x2], separator: ';');
      expect(b.toString(), '\'x1\';\'x2\';');
    });

    test('Joining non-whitespace strings.', () {
      final b = StringBuffer();
      b.writeAllQ([x1, x2], separator: '');
      expect(b.toString(), '\'x1\'\'x2\'');
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
      b.writelnQ(x, quotationMark: QuotationMark.double);
      expect(b.toString(), '"x"\n');
    });
  });

  group('writelnAllQ()', () {
    test('single string literal.', () {
      final b = StringBuffer();
      b.writelnAllQ([x1, x2]);
      expect(b.toString(), '\'x1\'\n\'x2\'\n');
    });
    test('separators', () {
      final b = StringBuffer();
      b.writelnAllQ([x1, x2], separator1: '#', separator2: ',');
      expect(
        b.toString(),
        '\'x1#\',\n'
        '\'x2#\',\n',
      );
    });
    test('trailing separators', () {
      final b = StringBuffer();
      b.writelnAllQ(
        [x1, x2],
        separator1: '#',
        separator2: ',',
        addTrailingSeparator1: false,
        addTrailingSeparator2: false,
      );
      expect(
        b.toString(),
        '\'x1#\',\n'
        '\'x2\'\n',
      );
    });
  });
}
