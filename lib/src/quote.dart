/// Extension on `StringBuffer` providing the methods:
///
/// [writeQ], [writelnQ], [writeAllQ], [writelnAllQ].
///
/// These methods convert objects
/// to string literals enclosed by quotation marks
/// before adding them to the string buffer.
extension Quote on StringBuffer {
  /// Writes [objects] in sequence adding an optional
  /// [separator]. The resulting string is enclosed by
  /// [delimiter]s.
  void writeAllQ(
    Iterable objects, {
    QuotationMark delimiter = QuotationMark.SINGLE,
    String separator = '',
  }) {
    var iterator = objects.iterator;
    if (!iterator.moveNext()) return;
    write(delimiter.baseValue);
    if (separator.isEmpty) {
      do {
        write(iterator.current);
      } while (iterator.moveNext());
    } else {
      write(iterator.current);
      while (iterator.moveNext()) {
        write(separator);
        write(iterator.current);
      }
    }
    write(delimiter.baseValue);
  }

  /// Writes [objects] in sequence.
  ///
  /// Each object is followed by an optional separator
  /// and a newline symbol.
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

  /// Writes [objectes] in the sequence:
  /// [delimiter], [object], [separator1], [delimiter], [separator2], newline.
  ///
  /// Before each object a delimiter is inserted. The object is followed by
  /// an optional [separator1] a [delimiter] an optional [separator2] and
  /// a newline symbol.
  void writelnAllQ(
    Iterable objects, {
    String separator1 = '',
    String separator2 = '',
    QuotationMark delimiter = QuotationMark.SINGLE,
  }) {
    var iterator = objects.iterator;
    if (!iterator.moveNext()) return;

    if (separator1.isEmpty && separator2.isEmpty) {
      do {
        writelnQ(iterator.current);
      } while (iterator.moveNext());
    } else {
      write(delimiter.baseValue);
      write(iterator.current);
      while (iterator.moveNext()) {
        write(separator1);
        write(delimiter.baseValue);
        write(separator2);
        write('\n');
        write(delimiter.baseValue);
        write(iterator.current);
      }
      write(delimiter.baseValue);
      write('\n');
    }
  }

  /// Encloses [obj] with [delimiter]s and writes
  /// it to the buffer.
  void writeQ(
    Object obj, {
    QuotationMark delimiter = QuotationMark.SINGLE,
  }) {
    var string = '$obj';
    if (string.isEmpty) return;
    write(delimiter.baseValue);
    write(string);
    write(delimiter.baseValue);
  }

  /// Encloses [obj] with [delimiter]s, adds a newline
  /// symbol and adds it to the buffer.
  void writelnQ(
    Object object, {
    QuotationMark delimiter = QuotationMark.SINGLE,
  }) {
    write(delimiter.baseValue);
    write(object);
    write(delimiter.baseValue);
    write('\n');
  }
}

/// Enumeration allowing the user to choose between
/// quotation mark delimiters.
enum QuotationMark { SINGLE, DOUBLE }

/// Extension providing the delimiter values.
extension QuotationMarkBase on QuotationMark {
  String get baseValue {
    return const {
      QuotationMark.SINGLE: '\'',
      QuotationMark.DOUBLE: '"',
    }[this];
  }
}
