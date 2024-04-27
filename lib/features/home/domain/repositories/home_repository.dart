import 'package:dartz/dartz.dart';
import 'package:skladum/core/error/failure.dart';
import 'package:skladum/features/home/data/model/product_model.dart';
import 'package:skladum/features/home/data/model/sale_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, dynamic>> getProducts();
  Future<Either<Failure, List<ProductModel>>> getProductsFromLocale();
  Future<Either<Failure, String>> addNewProduct(ProductModel productModel);
  Future<Either<Failure, String>> addToBasket(ProductModel productModel);
  Future<Either<Failure, List<ProductModel>>> getBasketProducts();
  Future<Either<Failure, String >> createSale(SaleModel saleModel);
  Future<Either<Failure, String >> clearDb();
}
