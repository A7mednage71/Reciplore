// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reviews_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReviewsState {
  ReviewsStatus get status => throw _privateConstructorUsedError;
  AddReviewStatus get addReviewStatus => throw _privateConstructorUsedError;
  List<ReviewModel> get reviews => throw _privateConstructorUsedError;
  String? get recipeId => throw _privateConstructorUsedError;
  String? get ingredientId => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String? get commentId => throw _privateConstructorUsedError;
  String? get reactionType => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Create a copy of ReviewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewsStateCopyWith<ReviewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewsStateCopyWith<$Res> {
  factory $ReviewsStateCopyWith(
          ReviewsState value, $Res Function(ReviewsState) then) =
      _$ReviewsStateCopyWithImpl<$Res, ReviewsState>;
  @useResult
  $Res call(
      {ReviewsStatus status,
      AddReviewStatus addReviewStatus,
      List<ReviewModel> reviews,
      String? recipeId,
      String? ingredientId,
      double rate,
      String? comment,
      String? commentId,
      String? reactionType,
      String? message});
}

/// @nodoc
class _$ReviewsStateCopyWithImpl<$Res, $Val extends ReviewsState>
    implements $ReviewsStateCopyWith<$Res> {
  _$ReviewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? addReviewStatus = null,
    Object? reviews = null,
    Object? recipeId = freezed,
    Object? ingredientId = freezed,
    Object? rate = null,
    Object? comment = freezed,
    Object? commentId = freezed,
    Object? reactionType = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReviewsStatus,
      addReviewStatus: null == addReviewStatus
          ? _value.addReviewStatus
          : addReviewStatus // ignore: cast_nullable_to_non_nullable
              as AddReviewStatus,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>,
      recipeId: freezed == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredientId: freezed == ingredientId
          ? _value.ingredientId
          : ingredientId // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String?,
      reactionType: freezed == reactionType
          ? _value.reactionType
          : reactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewsStateImplCopyWith<$Res>
    implements $ReviewsStateCopyWith<$Res> {
  factory _$$ReviewsStateImplCopyWith(
          _$ReviewsStateImpl value, $Res Function(_$ReviewsStateImpl) then) =
      __$$ReviewsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReviewsStatus status,
      AddReviewStatus addReviewStatus,
      List<ReviewModel> reviews,
      String? recipeId,
      String? ingredientId,
      double rate,
      String? comment,
      String? commentId,
      String? reactionType,
      String? message});
}

/// @nodoc
class __$$ReviewsStateImplCopyWithImpl<$Res>
    extends _$ReviewsStateCopyWithImpl<$Res, _$ReviewsStateImpl>
    implements _$$ReviewsStateImplCopyWith<$Res> {
  __$$ReviewsStateImplCopyWithImpl(
      _$ReviewsStateImpl _value, $Res Function(_$ReviewsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? addReviewStatus = null,
    Object? reviews = null,
    Object? recipeId = freezed,
    Object? ingredientId = freezed,
    Object? rate = null,
    Object? comment = freezed,
    Object? commentId = freezed,
    Object? reactionType = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ReviewsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReviewsStatus,
      addReviewStatus: null == addReviewStatus
          ? _value.addReviewStatus
          : addReviewStatus // ignore: cast_nullable_to_non_nullable
              as AddReviewStatus,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>,
      recipeId: freezed == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredientId: freezed == ingredientId
          ? _value.ingredientId
          : ingredientId // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String?,
      reactionType: freezed == reactionType
          ? _value.reactionType
          : reactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReviewsStateImpl implements _ReviewsState {
  const _$ReviewsStateImpl(
      {this.status = ReviewsStatus.initial,
      this.addReviewStatus = AddReviewStatus.initial,
      final List<ReviewModel> reviews = const [],
      this.recipeId,
      this.ingredientId,
      this.rate = 2.0,
      this.comment,
      this.commentId,
      this.reactionType,
      this.message})
      : _reviews = reviews;

  @override
  @JsonKey()
  final ReviewsStatus status;
  @override
  @JsonKey()
  final AddReviewStatus addReviewStatus;
  final List<ReviewModel> _reviews;
  @override
  @JsonKey()
  List<ReviewModel> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  final String? recipeId;
  @override
  final String? ingredientId;
  @override
  @JsonKey()
  final double rate;
  @override
  final String? comment;
  @override
  final String? commentId;
  @override
  final String? reactionType;
  @override
  final String? message;

  @override
  String toString() {
    return 'ReviewsState(status: $status, addReviewStatus: $addReviewStatus, reviews: $reviews, recipeId: $recipeId, ingredientId: $ingredientId, rate: $rate, comment: $comment, commentId: $commentId, reactionType: $reactionType, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.addReviewStatus, addReviewStatus) ||
                other.addReviewStatus == addReviewStatus) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId) &&
            (identical(other.ingredientId, ingredientId) ||
                other.ingredientId == ingredientId) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.reactionType, reactionType) ||
                other.reactionType == reactionType) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      addReviewStatus,
      const DeepCollectionEquality().hash(_reviews),
      recipeId,
      ingredientId,
      rate,
      comment,
      commentId,
      reactionType,
      message);

  /// Create a copy of ReviewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewsStateImplCopyWith<_$ReviewsStateImpl> get copyWith =>
      __$$ReviewsStateImplCopyWithImpl<_$ReviewsStateImpl>(this, _$identity);
}

abstract class _ReviewsState implements ReviewsState {
  const factory _ReviewsState(
      {final ReviewsStatus status,
      final AddReviewStatus addReviewStatus,
      final List<ReviewModel> reviews,
      final String? recipeId,
      final String? ingredientId,
      final double rate,
      final String? comment,
      final String? commentId,
      final String? reactionType,
      final String? message}) = _$ReviewsStateImpl;

  @override
  ReviewsStatus get status;
  @override
  AddReviewStatus get addReviewStatus;
  @override
  List<ReviewModel> get reviews;
  @override
  String? get recipeId;
  @override
  String? get ingredientId;
  @override
  double get rate;
  @override
  String? get comment;
  @override
  String? get commentId;
  @override
  String? get reactionType;
  @override
  String? get message;

  /// Create a copy of ReviewsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewsStateImplCopyWith<_$ReviewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
