// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Investment {
  String get id;
  String get investorId;
  String get farmerId;
  String get postId;
  double get amount;
  String get status; // 'pending', 'accepted', 'rejected'
  @TimestampConverter()
  DateTime get createdAt;
  String? get notes;

  /// Create a copy of Investment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvestmentCopyWith<Investment> get copyWith =>
      _$InvestmentCopyWithImpl<Investment>(this as Investment, _$identity);

  /// Serializes this Investment to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Investment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.investorId, investorId) ||
                other.investorId == investorId) &&
            (identical(other.farmerId, farmerId) ||
                other.farmerId == farmerId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, investorId, farmerId, postId,
      amount, status, createdAt, notes);

  @override
  String toString() {
    return 'Investment(id: $id, investorId: $investorId, farmerId: $farmerId, postId: $postId, amount: $amount, status: $status, createdAt: $createdAt, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $InvestmentCopyWith<$Res> {
  factory $InvestmentCopyWith(
          Investment value, $Res Function(Investment) _then) =
      _$InvestmentCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String investorId,
      String farmerId,
      String postId,
      double amount,
      String status,
      @TimestampConverter() DateTime createdAt,
      String? notes});
}

/// @nodoc
class _$InvestmentCopyWithImpl<$Res> implements $InvestmentCopyWith<$Res> {
  _$InvestmentCopyWithImpl(this._self, this._then);

  final Investment _self;
  final $Res Function(Investment) _then;

  /// Create a copy of Investment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? investorId = null,
    Object? farmerId = null,
    Object? postId = null,
    Object? amount = null,
    Object? status = null,
    Object? createdAt = null,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      investorId: null == investorId
          ? _self.investorId
          : investorId // ignore: cast_nullable_to_non_nullable
              as String,
      farmerId: null == farmerId
          ? _self.farmerId
          : farmerId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Investment implements Investment {
  const _Investment(
      {required this.id,
      required this.investorId,
      required this.farmerId,
      required this.postId,
      required this.amount,
      required this.status,
      @TimestampConverter() required this.createdAt,
      this.notes});
  factory _Investment.fromJson(Map<String, dynamic> json) =>
      _$InvestmentFromJson(json);

  @override
  final String id;
  @override
  final String investorId;
  @override
  final String farmerId;
  @override
  final String postId;
  @override
  final double amount;
  @override
  final String status;
// 'pending', 'accepted', 'rejected'
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  final String? notes;

  /// Create a copy of Investment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvestmentCopyWith<_Investment> get copyWith =>
      __$InvestmentCopyWithImpl<_Investment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InvestmentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Investment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.investorId, investorId) ||
                other.investorId == investorId) &&
            (identical(other.farmerId, farmerId) ||
                other.farmerId == farmerId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, investorId, farmerId, postId,
      amount, status, createdAt, notes);

  @override
  String toString() {
    return 'Investment(id: $id, investorId: $investorId, farmerId: $farmerId, postId: $postId, amount: $amount, status: $status, createdAt: $createdAt, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$InvestmentCopyWith<$Res>
    implements $InvestmentCopyWith<$Res> {
  factory _$InvestmentCopyWith(
          _Investment value, $Res Function(_Investment) _then) =
      __$InvestmentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String investorId,
      String farmerId,
      String postId,
      double amount,
      String status,
      @TimestampConverter() DateTime createdAt,
      String? notes});
}

/// @nodoc
class __$InvestmentCopyWithImpl<$Res> implements _$InvestmentCopyWith<$Res> {
  __$InvestmentCopyWithImpl(this._self, this._then);

  final _Investment _self;
  final $Res Function(_Investment) _then;

  /// Create a copy of Investment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? investorId = null,
    Object? farmerId = null,
    Object? postId = null,
    Object? amount = null,
    Object? status = null,
    Object? createdAt = null,
    Object? notes = freezed,
  }) {
    return _then(_Investment(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      investorId: null == investorId
          ? _self.investorId
          : investorId // ignore: cast_nullable_to_non_nullable
              as String,
      farmerId: null == farmerId
          ? _self.farmerId
          : farmerId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
