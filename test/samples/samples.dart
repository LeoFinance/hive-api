import 'dart:convert';
import 'dart:io';

import 'package:hive_bridge_api/hive_bridge_api.dart';

Future<JsonMetadata> sampleJsonMetadata() async =>
    File('test/samples/post.json')
        .readAsString()
        .then(jsonDecode)
        .then((json) => JsonMetadata.fromJson(json["json_metadata"]));

Future<Post> samplePost() async => File('test/samples/post.json')
    .readAsString()
    .then(jsonDecode)
    .then((json) => Post.fromJson(json));

Future<ProfileStats> sampleStats() async => File('test/samples/post.json')
    .readAsString()
    .then(jsonDecode)
    .then((json) => ProfileStats.fromJson(json["stats"]));

Future<Discussion> sampleDiscussion() async =>
    File('test/samples/discussion.json')
        .readAsString()
        .then(jsonDecode)
        .then((json) => Discussion.fromJson(json));
