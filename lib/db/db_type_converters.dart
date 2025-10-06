import 'dart:convert';

import 'package:drift/drift.dart';

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    if (fromDb.isEmpty || fromDb == '[]') return [];
    return (jsonDecode(fromDb) as List).cast<String>();
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}

class StringSetConverter extends TypeConverter<Set<String>, String> {
  const StringSetConverter();

  @override
  Set<String> fromSql(String fromDb) {
    if (fromDb.isEmpty || fromDb == '{}') return <String>{};
    return (jsonDecode(fromDb) as Set).cast<String>();
  }

  @override
  String toSql(Set<String> value) {
    return jsonEncode(value);
  }
}

class StringMapConverter extends TypeConverter<Map<String, String>, String> {
  const StringMapConverter();

  @override
  Map<String, String> fromSql(String fromDb) {
    if (fromDb.isEmpty || fromDb == '{}') return {};
    return (jsonDecode(fromDb) as Map<String, dynamic>).cast<String, String>();
  }

  @override
  String toSql(Map<String, String> value) {
    return jsonEncode(value);
  }
}

class DoubleMapConverter extends TypeConverter<Map<String, double>, String> {
  const DoubleMapConverter();

  @override
  Map<String, double> fromSql(String fromDb) {
    if (fromDb.isEmpty || fromDb == '{}') return {};
    return (jsonDecode(fromDb) as Map<String, dynamic>).cast<String, double>();
  }

  @override
  String toSql(Map<String, double> value) {
    return jsonEncode(value);
  }
}

class StringListOfListConverter
    extends TypeConverter<List<List<String>>, String> {
  const StringListOfListConverter();

  @override
  List<List<String>> fromSql(String fromDb) {
    if (fromDb.isEmpty || fromDb == '[]') return [];
    return (jsonDecode(fromDb) as List)
        .map((e) => (e as List).cast<String>())
        .toList();
  }

  @override
  String toSql(List<List<String>> value) {
    return jsonEncode(value);
  }
}

class NestedMapIntConverter
    extends TypeConverter<Map<String, Map<String, int>>, String> {
  const NestedMapIntConverter();

  @override
  Map<String, Map<String, int>> fromSql(String fromDb) {
    if (fromDb.isEmpty) return {};
    final decoded = jsonDecode(fromDb) as Map<String, dynamic>;
    return decoded.map((key, value) {
      final innerMap = Map<String, int>.from((value as Map).map(
        (k, v) => MapEntry(k as String, v as int),
      ));
      return MapEntry(key, innerMap);
    });
  }

  @override
  String toSql(Map<String, Map<String, int>> value) {
    return jsonEncode(value);
  }
}
