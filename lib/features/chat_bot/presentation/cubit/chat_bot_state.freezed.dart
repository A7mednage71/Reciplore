// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bot_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatBotState {
  ChatBotStatus get status => throw _privateConstructorUsedError;
  List<ChatMessage> get messages => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of ChatBotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatBotStateCopyWith<ChatBotState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatBotStateCopyWith<$Res> {
  factory $ChatBotStateCopyWith(
          ChatBotState value, $Res Function(ChatBotState) then) =
      _$ChatBotStateCopyWithImpl<$Res, ChatBotState>;
  @useResult
  $Res call(
      {ChatBotStatus status, List<ChatMessage> messages, String? errorMessage});
}

/// @nodoc
class _$ChatBotStateCopyWithImpl<$Res, $Val extends ChatBotState>
    implements $ChatBotStateCopyWith<$Res> {
  _$ChatBotStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatBotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? messages = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChatBotStatus,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatBotStateImplCopyWith<$Res>
    implements $ChatBotStateCopyWith<$Res> {
  factory _$$ChatBotStateImplCopyWith(
          _$ChatBotStateImpl value, $Res Function(_$ChatBotStateImpl) then) =
      __$$ChatBotStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ChatBotStatus status, List<ChatMessage> messages, String? errorMessage});
}

/// @nodoc
class __$$ChatBotStateImplCopyWithImpl<$Res>
    extends _$ChatBotStateCopyWithImpl<$Res, _$ChatBotStateImpl>
    implements _$$ChatBotStateImplCopyWith<$Res> {
  __$$ChatBotStateImplCopyWithImpl(
      _$ChatBotStateImpl _value, $Res Function(_$ChatBotStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatBotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? messages = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ChatBotStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChatBotStatus,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChatBotStateImpl implements _ChatBotState {
  const _$ChatBotStateImpl(
      {this.status = ChatBotStatus.initial,
      final List<ChatMessage> messages = const [],
      this.errorMessage})
      : _messages = messages;

  @override
  @JsonKey()
  final ChatBotStatus status;
  final List<ChatMessage> _messages;
  @override
  @JsonKey()
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ChatBotState(status: $status, messages: $messages, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatBotStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_messages), errorMessage);

  /// Create a copy of ChatBotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatBotStateImplCopyWith<_$ChatBotStateImpl> get copyWith =>
      __$$ChatBotStateImplCopyWithImpl<_$ChatBotStateImpl>(this, _$identity);
}

abstract class _ChatBotState implements ChatBotState {
  const factory _ChatBotState(
      {final ChatBotStatus status,
      final List<ChatMessage> messages,
      final String? errorMessage}) = _$ChatBotStateImpl;

  @override
  ChatBotStatus get status;
  @override
  List<ChatMessage> get messages;
  @override
  String? get errorMessage;

  /// Create a copy of ChatBotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatBotStateImplCopyWith<_$ChatBotStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
