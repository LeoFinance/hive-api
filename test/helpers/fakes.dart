import 'dart:convert';
import 'dart:io';

import 'package:hive_bridge_api/hive_bridge_api.dart';

Future<JsonMetadata> fakeJsonMetadata() async =>
    File('test/helpers/fake_post.json')
        .readAsString()
        .then(jsonDecode)
        .then((json) => JsonMetadata.fromJson(json["json_metadata"]));

Future<Post> fakePost() async => File('test/helpers/fake_post.json')
    .readAsString()
    .then(jsonDecode)
    .then((json) => Post.fromJson(json));

Future<Stats> fakeStats() async => File('test/helpers/fake_post.json')
    .readAsString()
    .then(jsonDecode)
    .then((json) => Stats.fromJson(json["stats"]));

Future<Discussion> fakeDiscussion() async =>
    File('test/helpers/fake_discussion.json')
        .readAsString()
        .then(jsonDecode)
        .then((json) => Discussion.fromJson(json));
