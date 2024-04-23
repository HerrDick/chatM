import 'package:chat/app/models/socket_event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
class ChatMessage with _$ChatMessage {
  factory ChatMessage({
    @Default("") String clientId,
    required String username,
    @TimestampOrNullConverter() DateTime? date,
    @Default("") String message,
    @Default(SocketEvent.unknown) SocketEvent type,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}

class TimestampOrNullConverter implements JsonConverter<DateTime?, int?> {
  const TimestampOrNullConverter();

  @override
  DateTime? fromJson(int? timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp ?? 0);
  }

  @override
  int? toJson(DateTime? date) => date?.millisecondsSinceEpoch;
}
