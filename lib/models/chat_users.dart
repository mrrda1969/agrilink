import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_users.freezed.dart';

part 'chat_users.g.dart';

@freezed
sealed class ChatUsers with _$ChatUsers {
  const factory ChatUsers({
    required String name,
    required String messageText,
    required String imagePath,
    required String time,
  }) = _ChatUsers;

  factory ChatUsers.fromJson(Map<String, dynamic> json) =>
      _$ChatUsersFromJson(json);
}
