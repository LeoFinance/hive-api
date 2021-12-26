DateTime forceUtcDate(String json) =>
    DateTime.parse(json + (json.endsWith('Z') ? '' : 'Z'));

String stripUtcZ(DateTime dateTime) =>
    dateTime.toIso8601String().replaceFirst('Z', '');

// Used when the incoming data can be either a String or an int
int forceInt(dynamic json) => json is int ? json : int.parse(json);

double fromHive(String s) => _removeAndConvert(s, r' HIVE$');
double fromHbd(String s) => _removeAndConvert(s, r' HBD$');
double fromVests(String s) => _removeAndConvert(s, r' VESTS$');
String toHive(double d) => _convertAndAdd(d, ' HIVE');
String toHbd(double d) => _convertAndAdd(d, ' HBD');
String toVests(double d) => _convertAndAdd(d, ' VESTS');

double _removeAndConvert(String s, String p) =>
    double.parse(s.replaceFirst(RegExp(p), ''));

String _convertAndAdd(double d, String s) => d.toString() + s;
