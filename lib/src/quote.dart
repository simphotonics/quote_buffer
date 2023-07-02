/// Extension on [StringBuffer] providing
/// methods for converting objects
/// to [String] literals enclosed by quotation marks.
extension Quote on StringBuffer {
  /// Writes `objects` in sequence to the buffer.
  /// * `delimiter`: Each object is enclosed with escaped quotation marks
  /// specified by `delimiter`.
  /// * `separator`: Optional separator `String`.
  ///
  /// Usage:
  /// ```
  /// final b = StringBuffer();
  /// b.writeAllQ([1, 2, 3], separator: ', ');
  /// b.toString() == '\'1\', \'2\', \'3\'';
  /// ```
  void writeAllQ(
    Iterable objects, {
    QuotationMark delimiter = QuotationMark.single,
    String separator = ', ',
  }) {
    var iterator = objects.iterator;
    if (!iterator.moveNext()) return;

    if (separator.isEmpty) {
      do {
        write(delimiter.symbol);
        write(iterator.current);
        write(delimiter.symbol);
      } while (iterator.moveNext());
    } else {
      write(delimiter.symbol);
      write(iterator.current);
      write(delimiter.symbol);
      while (iterator.moveNext()) {
        write(separator);
        write(delimiter.symbol);
        write(iterator.current);
        write(delimiter.symbol);
      }
    }
  }

  /// Writes `objects` in sequence to the buffer.
  ///
  /// Each object is followed by an optional `separator`
  /// and a newline symbol.
  ///
  /// Usage
  /// ```
  /// final b = StringBuffer();
  /// b.writeAllQ([1, 2, 3], ',');
  /// b.toString() == '1,\n'
  ///                 '2,\n'
  ///                 '3\n\'
  /// ```
  void writelnAll(Iterable objects, [String separator = '']) {
    var iterator = objects.iterator;
    if (!iterator.moveNext()) return;
    if (separator.isEmpty) {
      do {
        writeln(iterator.current);
      } while (iterator.moveNext());
    } else {
      write(iterator.current);
      while (iterator.moveNext()) {
        write(separator);
        write('\n');
        write(iterator.current);
      }
      write('\n');
    }
  }

  /// Writes `objects` in sequence to the buffer.
  /// * `delimiter`: Each object is followed by `separator1`
  /// and enclosed with escaped quotation marks
  /// specified by `delimiter`.
  /// * `separator1`: Optional separator `String`.
  /// * `separator2`: Optional separator `String`.
  ///
  /// Usage:
  /// final b = StringBuffer();
  /// b.writelnAllQ([1, 2, 3], separator1: ',', separator2: ';');
  /// b.toString() == '\'1,\';\n'
  ///                 '\'2,\';\n'
  ///                 '\'3\'\n'
  void writelnAllQ(
    Iterable objects, {
    String separator1 = '',
    String separator2 = '',
    QuotationMark delimiter = QuotationMark.single,
  }) {
    var iterator = objects.iterator;
    if (!iterator.moveNext()) return;

    if (separator1.isEmpty && separator2.isEmpty) {
      do {
        write(delimiter.symbol);
        write(iterator.current);
        write(delimiter.symbol);
        write('\n');
      } while (iterator.moveNext());
    } else {
      write(delimiter.symbol);
      write(iterator.current);
      while (iterator.moveNext()) {
        write(separator1);
        write(delimiter.symbol);
        write(separator2);
        write('\n');
        write(delimiter.symbol);
        write(iterator.current);
      }
      write(delimiter.symbol);
      write('\n');
    }
  }

  /// Encloses `obj` with `delimiter` and writes
  /// the resulting `String` to the buffer.
  void writeQ(
    Object obj, {
    QuotationMark delimiter = QuotationMark.single,
  }) {
    var string = '$obj';
    if (string.isEmpty) return;
    write(delimiter.symbol);
    write(string);
    write(delimiter.symbol);
  }

  /// Encloses `obj` with `delimiter`, adds a newline
  /// symbol and adds the resulting `String` to the buffer.
  ///
  /// Usage:
  /// ```
  /// final b = StringBuffer();
  /// b.writeQ(1);
  /// b.toString() == '\'1\'\n'
  /// ```
  void writelnQ(
    Object object, {
    QuotationMark delimiter = QuotationMark.single,
  }) {
    write(delimiter.symbol);
    write(object);
    write(delimiter.symbol);
    write('\n');
  }
}

/// Enumeration allowing the user to choose between
/// quotation mark delimiters.
enum QuotationMark {
  /// Instance of an enumeration. Represent a single quotation mark.
  single('\''),

  /// Instance of an enumeration. Represents a double quotation mark.
  double('"');

  const QuotationMark(this.symbol);

  /// Returns the String symbol representing the quotation mark.
  final String symbol;
}
