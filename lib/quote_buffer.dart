import 'package:built_collection/built_collection.dart';
import 'package:generic_enum/generic_enum.dart';

/// StringBuffer with additional methods:
///
/// stringln, stringlnAll, string, stringAll
///
/// These methods convert objects
/// to string literals enclosed by quotation marks
/// and add them to the buffer.
class QuoteBuffer extends StringBuffer {
  /// Creates an object of type [CodeBuffer].
  ///
  /// Use the methods: string, stringAll, stringln, stringlnAll
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
    Iterator iterator = objects.iterator;
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
    Iterator iterator = objects.iterator;
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
    String string = '$obj';
    if (string.isEmpty) return;
    // write(_delim);
    // write(string);
    // write(_delim);
    write("$_delim$string$_delim");
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

/// Defines string delimiters: SingleQuote and DoubleQuote.
/// Used in [CodeBuffer] to specify string delimiters.
class QuotationMark extends GenericEnum<String> {
  const QuotationMark._(String value) : super(value);

  /// The value of this instance is the single quotation mark character: <'>.
  static const Single = QuotationMark._('\'');

  /// The value of this instance is the double quotation mark character: <">.
  static const Double = QuotationMark._('\"');

  static final valueMap = BuiltMap<String, QuotationMark>({
    '\'': Single,
    '\"': Double,
  });
}
