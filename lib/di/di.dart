import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skladum/common/db_helper.dart';
import 'package:skladum/core/platform/network_info.dart';
import 'package:skladum/core/platform/pretty_dio_logger.dart';
import 'package:skladum/features/home/data/data_sources/home_local_data_source.dart';
import 'package:skladum/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:skladum/features/home/data/repositories/home_repository_impl.dart';
import 'package:skladum/features/home/domain/repositories/home_repository.dart';
import 'package:skladum/features/home/precentation/bloc/home_bloc.dart';
import 'package:sqflite/sqflite.dart';

final di = GetIt.instance;
final dbBase = DBHelper();
// Alice alice = Alice();

Future<void> init() async {
  di.registerFactory(() => HomeBloc(repository: di()));

//UseCases
  // di.registerLazySingleton(() => LoginUseCase(repository: di()));

  ///Repository
  
  di.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      networkInfo: di(),
      remoteDataSource: di(),
      homeLocalDataSource: di(),
    ),
  );

  di.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(dio: di()));

  di.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(database: di()));

  
  /// Network
  final options = BaseOptions(
      baseUrl: 'https://bizombor.onrender.com/api/v1/',
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        // 'Content-Type': 'application/x-www-form-urlencoded',
        'accept': 'application/json'
      });

  Dio dio = Dio(options);

  // dio.interceptors.add(alice.getDioInterceptor());

  di.registerSingleton<Dio>(dio);
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));

  /// Network Info
  di.registerLazySingleton(() => InternetConnectionChecker());

  di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));

  /// Local cache

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPreferences);
  //localization

  await EasyLocalization.ensureInitialized();

  // /// Local datasource

  final Database database = await dbBase.init();
  di.registerLazySingleton<Database>(() => database);

  //notification

  // await LocalNotifications.init();

  // final document = await getApplicationDocumentsDirectory();
  // await Hive.initFlutter(document.path);
  // //GetChats ui
  // if (!Hive.isAdapterRegistered(2)) {
  //   Hive.registerAdapter<GetChats>(GetChatsAdapter());

  // }

  // await Hive.openBox<GroupModel>(HiveKey.groupModel);
}
