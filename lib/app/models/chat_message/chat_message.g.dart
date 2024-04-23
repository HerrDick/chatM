// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      client: json['client'] as String,
      username: json['username'] as String,
      message: json['message'] as String?,
      type: $enumDecodeNullable(_$SocketEventEnumMap, json['type']) ??
          SocketEvent.unknown,
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'client': instance.client,
      'username': instance.username,
      'message': instance.message,
      'type': _$SocketEventEnumMap[instance.type]!,
    };

const _$SocketEventEnumMap = {
  SocketEvent.unknown: 'unknown',
  SocketEvent.loggin: 'loggin',
  SocketEvent.logout: 'logout',
  SocketEvent.newMessage: 'newMessage',
};
