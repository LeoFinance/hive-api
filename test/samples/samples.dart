import 'dart:convert';
import 'dart:io';

import 'package:hive_api/hive_api.dart';

Future<JsonMetadata> sampleJsonMetadata() async {
  final s = await File('test/samples/post.json').readAsString();
  final j = jsonDecode(s) as Map<String, dynamic>;
  return JsonMetadata.fromJson(j['json_metadata'] as Map<String, dynamic>);
}

Future<Post> samplePost() async {
  final s = await File('test/samples/post.json').readAsString();
  final j = jsonDecode(s) as Map<String, dynamic>;
  return Post.fromJson(j);
}
