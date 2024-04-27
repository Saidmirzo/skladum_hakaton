import 'package:skladum/common/table_names.dart';
import 'package:skladum/core/error/exeption.dart';
import 'package:skladum/features/home/data/model/product_model.dart';
import 'package:skladum/features/home/data/model/sale_item_model.dart';
import 'package:skladum/features/home/data/model/sale_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class HomeLocalDataSource {
  Future<List<ProductModel>> getProducts();
  Future addNewProducts(ProductModel productModel);
  Future addToBasket(ProductModel productModel);
  Future<List<ProductModel>> getBasketProducts();
  Future<int> createSmena();
  Future createSale(SaleModel saleModel);
  Future clearDB();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final Database database;

  HomeLocalDataSourceImpl({required this.database});

  @override
  Future<List<ProductModel>> getProducts() async {
    if (database.isOpen) {
      final response = await database.rawQuery('SELECT * FROM product');
      return response.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw CacheException();
    }
  }

  @override
  Future addNewProducts(ProductModel productModel) async {
    if (database.isOpen) {
      await database.insert(TableNames.product, productModel.toJson());
    } else {
      throw CacheException();
    }
  }

  @override
  Future addToBasket(ProductModel productModel) async {
    if (database.isOpen) {
      final List<int> productIds =
          (await database.rawQuery("SELECT * FROM basket"))
              .map((e) => (e["product_id"] as int))
              .toList();
      if (productIds.contains(productModel.id)) {
        await database.rawUpdate('''UPDATE  basket
                                    set count =count+1
                                    WHERE product_id==${productModel.id}''');
      } else {
        await database.insert(
            TableNames.basket, {"product_id": productModel.id, "count": 1});
      }
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<ProductModel>> getBasketProducts() async {
    if (database.isOpen) {
      final response = await database.rawQuery(
        '''SELECT basket.count,   product.id,  product.name, product.description, product.measure, 
                product.price, product.image, product.barcode, 
                product.barcode_type
                from basket
                LEFT JOIN product on product.id==basket.product_id''',
      );
      return response.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw CacheException();
    }
  }

  @override
  Future<int> createSmena() async {
    if (database.isOpen) {
      final response = await database.insert(TableNames.smena,
          {"begin_date": DateTime.now().millisecondsSinceEpoch});
      return response;
    } else {
      throw CacheException();
    }
  }

  @override
  Future createSale(SaleModel saleModel) async {
    if (database.isOpen) {
      List smena = await database.query(TableNames.smena);
      if (smena.isEmpty || smena.last['end_date']!=null) {
        await database.insert(
          TableNames.smena,
          {"begin_date": DateTime.now().millisecondsSinceEpoch},
        );
        smena = await database.query(TableNames.smena);
      }
      saleModel.smenaId = smena.last['id'] as int;
      saleModel.time = DateTime.now().millisecondsSinceEpoch;
      final int saleId =
          await database.insert(TableNames.sale, saleModel.toJson());
      final basket = await getBasketProducts();
      for (var element in basket) {
        database.insert(
          TableNames.saleItem,
          SaleItemModel(
            amount: element.count as int,
            saleId: saleId,
            productId: element.id as int,
            price: element.price,
            summa: (element.price ?? 0) * (element.count ?? 1),
          ).toJson(),
        );
      }
      database.delete(TableNames.basket);

      return "success";
    } else {
      throw CacheException();
    }
  }

  @override
  Future clearDB() async {
    if (database.isOpen) {
      await database.delete(TableNames.basket);
      await database.delete(TableNames.sale);
      await database.delete(TableNames.saleItem);
      await database.delete(TableNames.smena);
      await database.delete(TableNames.recovery);
      await database.delete(TableNames.recoveryItem);
    } else {
      throw CacheException();
    }
  }
}
