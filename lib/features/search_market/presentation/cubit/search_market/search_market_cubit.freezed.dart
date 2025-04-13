// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_market_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchMarketState {
  SearchMarketStatus get status => throw _privateConstructorUsedError;
  List<IngredientDataModel> get ingredients =>
      throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String get minPrice => throw _privateConstructorUsedError;
  String get maxPrice => throw _privateConstructorUsedError;
  String? get sort => throw _privateConstructorUsedError;
  String get rate => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  int get totalILength => throw _privateConstructorUsedError;

  /// Create a copy of SearchMarketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchMarketStateCopyWith<SearchMarketState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchMarketStateCopyWith<$Res> {
  factory $SearchMarketStateCopyWith(
          SearchMarketState value, $Res Function(SearchMarketState) then) =
      _$SearchMarketStateCopyWithImpl<$Res, SearchMarketState>;
  @useResult
  $Res call(
      {SearchMarketStatus status,
      List<IngredientDataModel> ingredients,
      String? message,
      String minPrice,
      String maxPrice,
      String? sort,
      String rate,
      int currentPage,
      bool hasNextPage,
      bool isFetching,
      int totalILength});
}

/// @nodoc
class _$SearchMarketStateCopyWithImpl<$Res, $Val extends SearchMarketState>
    implements $SearchMarketStateCopyWith<$Res> {
  _$SearchMarketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchMarketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? ingredients = null,
    Object? message = freezed,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? sort = freezed,
    Object? rate = null,
    Object? currentPage = null,
    Object? hasNextPage = null,
    Object? isFetching = null,
    Object? totalILength = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchMarketStatus,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientDataModel>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as String,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as String,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      totalILength: null == totalILength
          ? _value.totalILength
          : totalILength // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchMarketStateImplCopyWith<$Res>
    implements $SearchMarketStateCopyWith<$Res> {
  factory _$$SearchMarketStateImplCopyWith(_$SearchMarketStateImpl value,
          $Res Function(_$SearchMarketStateImpl) then) =
      __$$SearchMarketStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SearchMarketStatus status,
      List<IngredientDataModel> ingredients,
      String? message,
      String minPrice,
      String maxPrice,
      String? sort,
      String rate,
      int currentPage,
      bool hasNextPage,
      bool isFetching,
      int totalILength});
}

/// @nodoc
class __$$SearchMarketStateImplCopyWithImpl<$Res>
    extends _$SearchMarketStateCopyWithImpl<$Res, _$SearchMarketStateImpl>
    implements _$$SearchMarketStateImplCopyWith<$Res> {
  __$$SearchMarketStateImplCopyWithImpl(_$SearchMarketStateImpl _value,
      $Res Function(_$SearchMarketStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchMarketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? ingredients = null,
    Object? message = freezed,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? sort = freezed,
    Object? rate = null,
    Object? currentPage = null,
    Object? hasNextPage = null,
    Object? isFetching = null,
    Object? totalILength = null,
  }) {
    return _then(_$SearchMarketStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchMarketStatus,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientDataModel>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as String,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as String,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      totalILength: null == totalILength
          ? _value.totalILength
          : totalILength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchMarketStateImpl implements _SearchMarketState {
  const _$SearchMarketStateImpl(
      {this.status = SearchMarketStatus.initial,
      final List<IngredientDataModel> ingredients = const [],
      this.message,
      this.minPrice = '0',
      this.maxPrice = '100',
      this.sort,
      this.rate = '0',
      this.currentPage = 1,
      this.hasNextPage = true,
      this.isFetching = false,
      this.totalILength = 0})
      : _ingredients = ingredients;

  @override
  @JsonKey()
  final SearchMarketStatus status;
  final List<IngredientDataModel> _ingredients;
  @override
  @JsonKey()
  List<IngredientDataModel> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final String? message;
  @override
  @JsonKey()
  final String minPrice;
  @override
  @JsonKey()
  final String maxPrice;
  @override
  final String? sort;
  @override
  @JsonKey()
  final String rate;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool hasNextPage;
  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final int totalILength;

  @override
  String toString() {
    return 'SearchMarketState(status: $status, ingredients: $ingredients, message: $message, minPrice: $minPrice, maxPrice: $maxPrice, sort: $sort, rate: $rate, currentPage: $currentPage, hasNextPage: $hasNextPage, isFetching: $isFetching, totalILength: $totalILength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchMarketStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.totalILength, totalILength) ||
                other.totalILength == totalILength));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_ingredients),
      message,
      minPrice,
      maxPrice,
      sort,
      rate,
      currentPage,
      hasNextPage,
      isFetching,
      totalILength);

  /// Create a copy of SearchMarketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchMarketStateImplCopyWith<_$SearchMarketStateImpl> get copyWith =>
      __$$SearchMarketStateImplCopyWithImpl<_$SearchMarketStateImpl>(
          this, _$identity);
}

abstract class _SearchMarketState implements SearchMarketState {
  const factory _SearchMarketState(
      {final SearchMarketStatus status,
      final List<IngredientDataModel> ingredients,
      final String? message,
      final String minPrice,
      final String maxPrice,
      final String? sort,
      final String rate,
      final int currentPage,
      final bool hasNextPage,
      final bool isFetching,
      final int totalILength}) = _$SearchMarketStateImpl;

  @override
  SearchMarketStatus get status;
  @override
  List<IngredientDataModel> get ingredients;
  @override
  String? get message;
  @override
  String get minPrice;
  @override
  String get maxPrice;
  @override
  String? get sort;
  @override
  String get rate;
  @override
  int get currentPage;
  @override
  bool get hasNextPage;
  @override
  bool get isFetching;
  @override
  int get totalILength;

  /// Create a copy of SearchMarketState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchMarketStateImplCopyWith<_$SearchMarketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
