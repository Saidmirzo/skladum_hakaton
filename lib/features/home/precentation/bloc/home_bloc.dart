import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skladum/common/enums/bloc_status.dart';
import 'package:skladum/features/home/data/model/product_model.dart';
import 'package:skladum/features/home/data/model/sale_model.dart';
import 'package:skladum/features/home/domain/repositories/home_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository repository;
  List<ProductModel> listProducts = [];
  HomeBloc({required this.repository}) : super(const HomeState()) {
    on<HomeEvent>((event, emit) {});
    on<GetProductsLocaleEvent>((event, emit) async {
      emit(state.copyWith(getProductsLocaleStatus: BlocStatus.inProgress));
      final result = await repository.getProductsFromLocale();
      result.fold(
        (l) => emit(
          state.copyWith(getProductsLocaleStatus: BlocStatus.failed),
        ),
        (r) {
          listProducts = r;
          emit(
            state.copyWith(
              getProductsLocaleStatus: BlocStatus.completed,
              listProducts: r,
            ),
          );
        },
      );
    });
    on<AddNewProducEvent>((event, emit) async {
      await repository.addNewProduct(event.productModel);
      add(GetProductsLocaleEvent());
    });
    on<AddToBasket>((event, emit) async {
      await repository.addToBasket(event.productModel);
      add(GetBasketProducts());
    });
    on<GetBasketProducts>((event, emit) async {
      emit(state.copyWith(getBasketProductsStatus: BlocStatus.inProgress));
      final result = await repository.getBasketProducts();
      result.fold(
        (l) => emit(state.copyWith(getBasketProductsStatus: BlocStatus.failed)),
        (r) {
          emit(
            state.copyWith(
              getBasketProductsStatus: BlocStatus.completed,
              listBasketProducts: r,
            ),
          );
        },
      );
    });
    on<CreateSaleEvent>((event, emit) async {
      emit(state.copyWith(createSaleStatus: BlocStatus.inProgress));
      final result = await repository.createSale(event.saleModel);
      result.fold(
        (l) => emit(state.copyWith(createSaleStatus: BlocStatus.failed)),
        (r) {
          add(GetBasketProducts());
          emit(
            state.copyWith(createSaleStatus: BlocStatus.completed),
          );
        },
      );
    });
    on<ClearDbEvent>(
      (event, emit) async {
        await repository.clearDb();
      },
    );
    on<SearchProductsEvent>(
      (event, emit) {
        emit(state.copyWith(getProductsLocaleStatus: BlocStatus.inProgress));
        List<ProductModel> list = [];
        for (var element in listProducts) {
          if (element.name!.toLowerCase().contains(event.text.toLowerCase())) {
            list.add(element);
          }
          emit(
            state.copyWith(
              getProductsLocaleStatus: BlocStatus.completed,
              listProducts: list,
            ),
          );
        }
      },
    );
  }
}
