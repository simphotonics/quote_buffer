/// Extension on [StringBuffer] providing
/// methods for convering objects
/// to [String] literals enclosed by quotation marks.
extension Quote on StringBuffer {
  /// Writes `objects` in sequence to the buffer.
  /// * `delimiter`: Each object is enclosed with escaped quotation marks
  /// specified by `delimiter`.
  /// * `separator`: Optional separator [String].
  ///
  /// Usage:
  /// ```
  /// final b = StringBuffer();
  /// b.writeAllQ([1, 2, 3], separator: ', ');
  /// b.toString() == '\'1\', \'2\', \'3\'';
  /// ```
  void writeAllQ(
    Iterable objects, {
    Punctuation delimiter = Punctuation.singleQuotationMark,
    String separator = ', ',
  }) {
    var iterator = objects.iterator;
    if (!iterator.moveNext()) return;

    if (separator.isEmpty) {
      do {
        write(delimiter.value);
        write(iterator.current);
        write(delimiter.value);
      } while (iterator.moveNext());
    } else {
      write(delimiter.value);
      write(iterator.current);
      write(delimiter.value);
      while (iterator.moveNext()) {
        write(separator);
        write(delimiter.value);
        write(iterator.current);
        write(delimiter.value);
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
  /// * `separator1`: Optional separator [String].
  /// * `separator2`: Optional separator [String].
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
    Punctuation delimiter = Punctuation.singleQuotationMark,
  }) {
    var iterator = objects.iterator;
    if (!iterator.moveNext()) return;

    if (separator1.isEmpty && separator2.isEmpty) {
      do {
        write(delimiter.value);
        write(iterator.current);
        write(delimiter.value);
        write('\n');
      } while (iterator.moveNext());
    } else {
      write(delimiter.value);
      write(iterator.current);
      while (iterator.moveNext()) {
        write(separator1);
        write(delimiter.value);
        write(separator2);
        write('\n');
        write(delimiter.value);
        write(iterator.current);
      }
      write(delimiter.value);
      write('\n');
    }
  }

  /// Encloses `obj` with `delimiter` and writes
  /// the resulting `String` to the buffer.
  void writeQ(
    Object obj, {
    Punctuation delimiter = Punctuation.singleQuotationMark,
  }) {
    var string = '$obj';
    if (string.isEmpty) return;
    write(delimiter.value);
    write(string);
    write(delimiter.value);
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
    Punctuation delimiter = Punctuation.singleQuotationMark,
  }) {
    write(delimiter.value);
    write(object);
    write(delimiter.value);
    write('\n');
  }
}

/// Enumeration allowing the user to choose between
/// quotation mark delimiters.
enum Punctuation { singleQuotationMark, doubleQuotationMark }

/// Extension on [Punctuation] providing the delimiter string values.
extension PunctuationValueMap on Punctuation {
  String get value {
    return const {
      Punctuation.singleQuotationMark: '\'',
      Punctuation.doubleQuotationMark: '\"',
    }[this]!;
  }
}
