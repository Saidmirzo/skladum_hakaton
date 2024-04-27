part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetProductsLocaleEvent extends HomeEvent {}

class AddNewProducEvent extends HomeEvent {
  final ProductModel productModel;
  const AddNewProducEvent({required this.productModel});
  @override
  List<Object> get props => [productModel];
}

class AddToBasket extends HomeEvent {
  final ProductModel productModel;
  const AddToBasket({required this.productModel});
  @override
  List<Object> get props => [productModel];
}

class GetBasketProducts extends HomeEvent {}

class CreateSaleEvent extends HomeEvent {
  final SaleModel saleModel;
  const CreateSaleEvent({required this.saleModel});
}

class ClearDbEvent extends HomeEvent {}

class SearchProductsEvent extends HomeEvent {
  final String text;
  const SearchProductsEvent({required this.text});
}
