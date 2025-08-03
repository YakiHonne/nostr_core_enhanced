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
