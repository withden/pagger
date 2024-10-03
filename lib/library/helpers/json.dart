import 'dart:convert';

class JsonList<T> {
  final List<T> list;

  const JsonList._internal(this.list);

  factory JsonList.from(dynamic json) {
    List<T>? list;
    if (json is List<T>) {
      list = json;
    } else if (json is String) {
      final dynamic object = jsonDecode(json);
      if (object is List<T>) {
        list = object;
      }
    }
    assert(list != null, "Json List can't decode");

    return JsonList._internal(list!);
  }
}

class JsonObject {
  final Map<String, dynamic> object;

  const JsonObject._internal(this.object);

  factory JsonObject.from(dynamic json) {
    Map<String, dynamic>? object;
    if (json is Map<String, dynamic>) {
      object = json;
    } else if (json is String) {
      final dynamic objectJson = jsonDecode(json);
      if (objectJson is Map<String, dynamic>) {
        object = objectJson;
      }
    }
    assert(object != null, "Json Object can't decode");

    return JsonObject._internal(object!);
  }

  int get getId => getInt('id');

  bool has(String key) {
    return object.containsKey(key);
  }

  int getInt(String key, [int defaultValue = 0]) {
    return getIntOrNull(key) ?? defaultValue;
  }

  int? getIntOrNull(String key) {
    if (has(key)) {
      return int.tryParse(object[key].toString());
    }
    return null;
  }

  double getDouble(String key, [double defaultValue = 0]) {
    return getDoubleOrNull(key) ?? defaultValue;
  }

  double? getDoubleOrNull(String key) {
    if (has(key)) {
      return double.tryParse(object[key].toString());
    }
    return null;
  }

  bool getBool(String key, [bool defaultValue = false]) {
    if (has(key)) {
      final String? value = getStringOrNull(key);
      if (value == null) return defaultValue;
      return value.toLowerCase().compareTo('true') == 0;
    }
    return defaultValue;
  }

  String? getStringOrNull(String key) {
    if (has(key)) {
      return object[key].toString();
    }
    return null;
  }

  String getString(String key, [String defaultValue = ""]) {
    return getStringOrNull(key) ?? defaultValue;
  }

  T getEnum<T extends Enum>(String key, List<T> options, T defaultValue) {
    return getEnumOrNull(key, options) ?? defaultValue;
  }

  T? getEnumOrNull<T extends Enum>(
    String key,
    List<T> options,
  ) {
    final String? value = getStringOrNull(key);
    if (value == null) return null;
    for (final T t in options) {
      if (t.name == value) {
        return t;
      }
    }
    return null;
  }

  DateTime getDateTime(String key, {DateTime? defaultValue, bool local = true}) {
    defaultValue ??= DateTime.now();
    return getDateTimeOrNull(key, local: local) ?? defaultValue;
  }

  DateTime? getDateTimeOrNull(String key, {bool local = true}) {
    if (has(key)) {
      final String? validatedDate = getStringOrNull(key);
      if (validatedDate != null) {
        return local ? DateTime.tryParse(validatedDate)?.toLocal() : DateTime.tryParse(validatedDate);
      }
    }
    return null;
  }
}
