// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  BlocStatus get getProductsLocaleStatus => throw _privateConstructorUsedError;
  BlocStatus get getBasketProductsStatus => throw _privateConstructorUsedError;
  BlocStatus get createSaleStatus => throw _privateConstructorUsedError;
  List<ProductModel>? get listProducts => throw _privateConstructorUsedError;
  List<ProductModel>? get listBasketProducts =>
      throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {BlocStatus getProductsLocaleStatus,
      BlocStatus getBasketProductsStatus,
      BlocStatus createSaleStatus,
      List<ProductModel>? listProducts,
      List<ProductModel>? listBasketProducts,
      String? message});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getProductsLocaleStatus = null,
    Object? getBasketProductsStatus = null,
    Object? createSaleStatus = null,
    Object? listProducts = freezed,
    Object? listBasketProducts = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      getProductsLocaleStatus: null == getProductsLocaleStatus
          ? _value.getProductsLocaleStatus
          : getProductsLocaleStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      getBasketProductsStatus: null == getBasketProductsStatus
          ? _value.getBasketProductsStatus
          : getBasketProductsStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      createSaleStatus: null == createSaleStatus
          ? _value.createSaleStatus
          : createSaleStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      listProducts: freezed == listProducts
          ? _value.listProducts
          : listProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      listBasketProducts: freezed == listBasketProducts
          ? _value.listBasketProducts
          : listBasketProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus getProductsLocaleStatus,
      BlocStatus getBasketProductsStatus,
      BlocStatus createSaleStatus,
      List<ProductModel>? listProducts,
      List<ProductModel>? listBasketProducts,
      String? message});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getProductsLocaleStatus = null,
    Object? getBasketProductsStatus = null,
    Object? createSaleStatus = null,
    Object? listProducts = freezed,
    Object? listBasketProducts = freezed,
    Object? message = freezed,
  }) {
    return _then(_$HomeStateImpl(
      getProductsLocaleStatus: null == getProductsLocaleStatus
          ? _value.getProductsLocaleStatus
          : getProductsLocaleStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      getBasketProductsStatus: null == getBasketProductsStatus
          ? _value.getBasketProductsStatus
          : getBasketProductsStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      createSaleStatus: null == createSaleStatus
          ? _value.createSaleStatus
          : createSaleStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      listProducts: freezed == listProducts
          ? _value._listProducts
          : listProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      listBasketProducts: freezed == listBasketProducts
          ? _value._listBasketProducts
          : listBasketProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl extends _HomeState {
  const _$HomeStateImpl(
      {this.getProductsLocaleStatus = BlocStatus.notInitialized,
      this.getBasketProductsStatus = BlocStatus.notInitialized,
      this.createSaleStatus = BlocStatus.notInitialized,
      final List<ProductModel>? listProducts,
      final List<ProductModel>? listBasketProducts,
      this.message})
      : _listProducts = listProducts,
        _listBasketProducts = listBasketProducts,
        super._();

  @override
  @JsonKey()
  final BlocStatus getProductsLocaleStatus;
  @override
  @JsonKey()
  final BlocStatus getBasketProductsStatus;
  @override
  @JsonKey()
  final BlocStatus createSaleStatus;
  final List<ProductModel>? _listProducts;
  @override
  List<ProductModel>? get listProducts {
    final value = _listProducts;
    if (value == null) return null;
    if (_listProducts is EqualUnmodifiableListView) return _listProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductModel>? _listBasketProducts;
  @override
  List<ProductModel>? get listBasketProducts {
    final value = _listBasketProducts;
    if (value == null) return null;
    if (_listBasketProducts is EqualUnmodifiableListView)
      return _listBasketProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'HomeState(getProductsLocaleStatus: $getProductsLocaleStatus, getBasketProductsStatus: $getBasketProductsStatus, createSaleStatus: $createSaleStatus, listProducts: $listProducts, listBasketProducts: $listBasketProducts, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(
                    other.getProductsLocaleStatus, getProductsLocaleStatus) ||
                other.getProductsLocaleStatus == getProductsLocaleStatus) &&
            (identical(
                    other.getBasketProductsStatus, getBasketProductsStatus) ||
                other.getBasketProductsStatus == getBasketProductsStatus) &&
            (identical(other.createSaleStatus, createSaleStatus) ||
                other.createSaleStatus == createSaleStatus) &&
            const DeepCollectionEquality()
                .equals(other._listProducts, _listProducts) &&
            const DeepCollectionEquality()
                .equals(other._listBasketProducts, _listBasketProducts) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      getProductsLocaleStatus,
      getBasketProductsStatus,
      createSaleStatus,
      const DeepCollectionEquality().hash(_listProducts),
      const DeepCollectionEquality().hash(_listBasketProducts),
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState(
      {final BlocStatus getProductsLocaleStatus,
      final BlocStatus getBasketProductsStatus,
      final BlocStatus createSaleStatus,
      final List<ProductModel>? listProducts,
      final List<ProductModel>? listBasketProducts,
      final String? message}) = _$HomeStateImpl;
  const _HomeState._() : super._();

  @override
  BlocStatus get getProductsLocaleStatus;
  @override
  BlocStatus get getBasketProductsStatus;
  @override
  BlocStatus get createSaleStatus;
  @override
  List<ProductModel>? get listProducts;
  @override
  List<ProductModel>? get listBasketProducts;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
