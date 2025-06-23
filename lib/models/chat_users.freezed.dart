// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatUsers {
  String get name;
  String get messageText;
  String get imagePath;
  String get time;

  /// Create a copy of ChatUsers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatUsersCopyWith<ChatUsers> get copyWith =>
      _$ChatUsersCopyWithImpl<ChatUsers>(this as ChatUsers, _$identity);

  /// Serializes this ChatUsers to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatUsers &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.messageText, messageText) ||
                other.messageText == messageText) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, messageText, imagePath, time);

  @override
  String toString() {
    return 'ChatUsers(name: $name, messageText: $messageText, imagePath: $imagePath, time: $time)';
  }
}

/// @nodoc
abstract mixin class $ChatUsersCopyWith<$Res> {
  factory $ChatUsersCopyWith(ChatUsers value, $Res Function(ChatUsers) _then) =
      _$ChatUsersCopyWithImpl;
  @useResult
  $Res call({String name, String messageText, String imagePath, String time});
}

/// @nodoc
class _$ChatUsersCopyWithImpl<$Res> implements $ChatUsersCopyWith<$Res> {
  _$ChatUsersCopyWithImpl(this._self, this._then);

  final ChatUsers _self;
  final $Res Function(ChatUsers) _then;

  /// Create a copy of ChatUsers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? messageText = null,
    Object? imagePath = null,
    Object? time = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      messageText: null == messageText
          ? _self.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChatUsers implements ChatUsers {
  const _ChatUsers(
      {required this.name,
      required this.messageText,
      required this.imagePath,
      required this.time});
  factory _ChatUsers.fromJson(Map<String, dynamic> json) =>
      _$ChatUsersFromJson(json);

  @override
  final String name;
  @override
  final String messageText;
  @override
  final String imagePath;
  @override
  final String time;

  /// Create a copy of ChatUsers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatUsersCopyWith<_ChatUsers> get copyWith =>
      __$ChatUsersCopyWithImpl<_ChatUsers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatUsersToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatUsers &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.messageText, messageText) ||
                other.messageText == messageText) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, messageText, imagePath, time);

  @override
  String toString() {
    return 'ChatUsers(name: $name, messageText: $messageText, imagePath: $imagePath, time: $time)';
  }
}

/// @nodoc
abstract mixin class _$ChatUsersCopyWith<$Res>
    implements $ChatUsersCopyWith<$Res> {
  factory _$ChatUsersCopyWith(
          _ChatUsers value, $Res Function(_ChatUsers) _then) =
      __$ChatUsersCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String messageText, String imagePath, String time});
}

/// @nodoc
class __$ChatUsersCopyWithImpl<$Res> implements _$ChatUsersCopyWith<$Res> {
  __$ChatUsersCopyWithImpl(this._self, this._then);

  final _ChatUsers _self;
  final $Res Function(_ChatUsers) _then;

  /// Create a copy of ChatUsers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? messageText = null,
    Object? imagePath = null,
    Object? time = null,
  }) {
    return _then(_ChatUsers(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      messageText: null == messageText
          ? _self.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
