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

// Future<ProfileStats> sampleStats() async => File('test/samples/post.json')
//     .readAsString()
//     .then(jsonDecode)
//     .then((json) => ProfileStats.fromJson(json["stats"]));

// Future<Discussion> sampleDiscussion() async =>
//     File('test/samples/discussion.json')
//         .readAsString()
//         .then(jsonDecode)
//         .then((json) => Discussion.fromJson(json));
