part of 'home_bloc.dart';

@freezed
// class HomeState with _$HomeState {
//   const factory HomeState.initial() = _Initial;
// }
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(BlocStatus.notInitialized) final BlocStatus getProductsLocaleStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getBasketProductsStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus createSaleStatus,
    final List<ProductModel>? listProducts,
    final List<ProductModel>? listBasketProducts,
    final String? message,
  }) = _HomeState;

  const HomeState._();
}
