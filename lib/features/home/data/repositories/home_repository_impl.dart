import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skladum/core/error/exeption.dart';
import 'package:skladum/core/error/failure.dart';
import 'package:skladum/core/platform/network_info.dart';
import 'package:skladum/features/home/data/data_sources/home_local_data_source.dart';
import 'package:skladum/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:skladum/features/home/data/model/product_model.dart';
import 'package:skladum/features/home/data/model/sale_model.dart';
import 'package:skladum/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, String>> getProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getProducts();
        return Right(result);
      } on DioException catch (e) {
        final failure = DioExceptions.fromDioError(e);
        return Left(failure);
      }
    } else {
      return const Left(ConnectionFailure("Connection error"));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProductsFromLocale() async {
    try {
      final result = await homeLocalDataSource.getProducts();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addNewProduct(
      ProductModel productModel) async {
    try {
      await homeLocalDataSource.addNewProducts(productModel);
      return const Right('Succes');
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addToBasket(ProductModel productModel) async {
    try {
      await homeLocalDataSource.addToBasket(productModel);
      return const Right('Succes');
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getBasketProducts() async {
    try {
      final result = await homeLocalDataSource.getBasketProducts();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createSale(SaleModel saleModel) async {
    try {
      final result = await homeLocalDataSource.createSale(saleModel);
      return const Right("Success");
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> clearDb() async {
    try {
      final result = await homeLocalDataSource.clearDB();
      return const Right("Success");
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
