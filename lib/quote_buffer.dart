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

  /// Converts [objects] to a single quoted string
  /// and adds it to the buffer.
  ///
  /// A [separator] string is optional.
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

  /// Converts the contents of each object in [objects]
  /// to a quoted string terminated with a
  /// newline. Separators are optional.
  void writelnAllQ(Iterable objects, [String separator = '']) {
    var iterator = objects.iterator;
    if (!iterator.moveNext()) return;

    if (separator.isEmpty) {
      do {
        writelnQ(iterator.current);
      } while (iterator.moveNext());
    } else {
      write(_delim);
      write(iterator.current);
      while (iterator.moveNext()) {
        write(separator);
        write(_delim);
        write('\n');
        write(_delim);
        write(iterator.current);
      }
      write(_delim);
      write('\n');
    }
  }

  /// Converts the contents of [obj] to a quoted string
  /// and adds the string to the buffer.
  void writeQ(Object obj) {
    var string = '$obj';
    if (string.isEmpty) return;
    write(_delim);
    write(string);
    write(_delim);
  }

  /// Converts the content of [obj] to a quoted string
  /// terminated with a newline character
  /// and adds the string to the buffer.

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
