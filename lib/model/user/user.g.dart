// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      uid: json['uid'] as String,
      image: json['image'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'uid': instance.uid,
      'image': instance.image,
      'description': instance.description,
    };
