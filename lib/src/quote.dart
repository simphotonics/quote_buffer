/// Enumeration allowing the user to choose between
/// quotation mark delimiters.
enum QuotationMark {
  /// Instance of an enumeration. Represent a single quotation mark.
  single('\''),

  /// Instance of an enumeration. Represents a double quotation mark.
  double('"');

  /// Returns the String symbol representing the quotation mark.
  final String symbol;

  const QuotationMark(this.symbol);
}

/// Extension on [StringBuffer] providing
/// methods for converting objects
/// to [String] literals enclosed by quotation marks.
extension Quote on StringBuffer {
  /// Writes [objects] in sequence to the buffer.
  ///
  /// Each object is enclosed with escaped quotation marks
  /// specified by [quotationMark] followed by the optional [separator].
  /// ```
  /// // Usage
  /// final b = StringBuffer();
  /// b.writeAllQ([1, 2, 3], separator: ', ');
  /// print(b) //  '1', '2', '3'
  /// ```
  void writeAllQ(
    Iterable objects, {
    String separator = ', ',
    QuotationMark quotationMark = QuotationMark.single,
    bool addTrailingSeparator = true,
  }) {
    var iterator = objects.iterator;
    if (!iterator.moveNext()) return;

    if (separator.isEmpty) {
      do {
        write(quotationMark.symbol);
        write(iterator.current);
        write(quotationMark.symbol);
      } while (iterator.moveNext());
    } else {
      write(quotationMark.symbol);
      write(iterator.current);
      write(quotationMark.symbol);
      while (iterator.moveNext()) {
        write(separator);
        write(quotationMark.symbol);
        write(iterator.current);
        write(quotationMark.symbol);
      }
    }
    if (addTrailingSeparator) {
      write(separator);
    }
  }

  /// Writes [objects] in sequence to the buffer.
  ///
  /// Each object is followed by an optional `separator`
  /// and a newline symbol.
  /// ```
  /// // Usage
  /// final b = StringBuffer();
  /// b.writeAllQ([1, 2, 3], ',');
  /// print(b); // '1',\n'2',\n'3'\n'
  /// ```
  void writelnAll(
    Iterable objects, {
    String separator = ' ',
    bool addTrailingSeparator = true,
  }) {
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
      if (addTrailingSeparator) {
        write(separator);
      }
      write('\n');
    }
  }

  /// Writes [objects] in sequence to the buffer.
  ///
  /// Each object is first converted to the string:
  /// [quotationMark] + `object.toString()` + [separator1] + [quotationMark].
  /// ```
  /// // Usage
  /// final b = StringBuffer();
  /// b.writelnAllQ([1, 2, 3], separator1: ' ', separator2: ';');
  /// print(b); \\ prints '\'1 \';\n\'2 \';\n\'3\'\n'
  /// ```
  void writelnAllQ(
    Iterable objects, {
    String separator1 = '',
    String separator2 = '',
    QuotationMark quotationMark = QuotationMark.single,
    bool addTrailingSeparator1 = true,
    bool addTrailingSeparator2 = true,
  }) {
    var iterator = objects.iterator;
    if (!iterator.moveNext()) return;

    if (separator1.isEmpty && separator2.isEmpty) {
      do {
        write(quotationMark.symbol);
        write(iterator.current);
        write(quotationMark.symbol);
        write('\n');
      } while (iterator.moveNext());
    } else {
      write(quotationMark.symbol);
      write(iterator.current);
      while (iterator.moveNext()) {
        write(separator1);
        write(quotationMark.symbol);
        write(separator2);
        write('\n');
        write(quotationMark.symbol);
        write(iterator.current);
      }
      if (addTrailingSeparator1) {
        write(separator1);
      }
      write(quotationMark.symbol);
      if (addTrailingSeparator2) {
        write(separator2);
      }
      write('\n');
    }
  }

  /// Encloses [obj] with [quotationMark], adds a newline
  /// symbol and adds the resulting [String] to the buffer.
  /// ```
  /// // Usage
  /// final b = StringBuffer();
  /// b.writeQ(1);
  /// print(b) // prints '\'1\'\n'
  /// ```
  void writelnQ(
    Object obj, {
    QuotationMark quotationMark = QuotationMark.single,
  }) {
    write(quotationMark.symbol);
    write(obj);
    write(quotationMark.symbol);
    write('\n');
  }

  /// Encloses [obj] with [quotationMark] and writes
  /// the resulting [String] to the buffer.
  void writeQ(
    Object obj, {
    QuotationMark quotationMark = QuotationMark.single,
  }) {
    var string = '$obj';
    if (string.isEmpty) return;
    write(quotationMark.symbol);
    write(string);
    write(quotationMark.symbol);
  }
}
