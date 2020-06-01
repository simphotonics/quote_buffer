/// StringBuffer with additional methods:
///
/// [writeQ], [writelnQ], [writeAllQ], [writelnAllQ].
///
/// These methods convert objects
/// to string literals enclosed by quotation marks
/// before adding them to the string buffer.
class QuoteBuffer extends StringBuffer {
  /// Creates an object of type [CodeBuffer].
  ///
  /// Use the methods: writeQ, writeAllQ, writelnQ, writelnAllQ
  /// to create quotation mark enclosed string literals
  /// (used e.g. in source code generators).
  ///
  /// Note: The initial [content] will not be enclosed by string delimiters.
  QuoteBuffer({
    Object content = '',
    this.delimiter = QuotationMark.Single,
  })  : _delim = delimiter.value,
        super(content);

  /// Delimiter used to enclose a source code string.
  final QuotationMark delimiter;

  /// Delimiter string
  final String _delim;

  /// Writes [objects] in sequence adding an optional
  /// [separator]. The resulting string is enclosed by
  /// [delimiter]s.
  void writeAllQ(Iterable objects, [String separator = '']) {
    var iterator = objects.iterator;
    if (!iterator.moveNext()) return;
    write(_delim);
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
    write(_delim);
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
  }) {
    var iterator = objects.iterator;
    if (!iterator.moveNext()) return;

    if (separator1.isEmpty && separator2.isEmpty) {
      do {
        writelnQ(iterator.current);
      } while (iterator.moveNext());
    } else {
      write(_delim);
      write(iterator.current);
      while (iterator.moveNext()) {
        write(separator1);
        write(_delim);
        write(separator2);
        write('\n');
        write(_delim);
        write(iterator.current);
      }
      write(_delim);
      write('\n');
    }
  }

  /// Encloses [obj] with [delimiter]s and writes
  /// it to the buffer.
  void writeQ(Object obj) {
    var string = '$obj';
    if (string.isEmpty) return;
    write(_delim);
    write(string);
    write(_delim);
  }

  /// Encloses [obj] with [delimiter]s, adds a newline
  /// symbol and adds it to the buffer.
  void writelnQ([Object object = '']) {
    write(_delim);
    write(object);
    write(_delim);
    write('\n');
  }
}

class _Enum {
  const _Enum(this.value);
  final String value;
}

/// Enumeration class allowing the user to choose between
/// quotation mark delimiters.
class QuotationMark extends _Enum {
  const QuotationMark._(String value) : super(value);
  static const Single = QuotationMark._('\'');
  static const Double = QuotationMark._('\"');
}
