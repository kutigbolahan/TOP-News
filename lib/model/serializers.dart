import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:built_collection/built_collection.dart';

import 'package:nigeriannews/model/articles.dart';


part 'serializers.g.dart';

@SerializersFor(const[
  News
])
final Serializers serializers = _$serializers;

Serializers standardSerializers = 
    (serializers.toBuilder()..addPlugin( StandardJsonPlugin())).build();


    