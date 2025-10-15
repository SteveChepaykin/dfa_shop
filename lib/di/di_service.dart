import 'package:dfa_shop/core/network/interceptors.dart';
import 'package:dfa_shop/core/utils/constants.dart';
import 'package:dfa_shop/features/banners/data/data_source/banners_local_data_source.dart';
import 'package:dfa_shop/features/banners/data/data_source/banners_remote_data_source.dart';
import 'package:dfa_shop/features/banners/data/repository/banners_repository_impl.dart';
import 'package:dfa_shop/features/banners/domain/repository/banners_repository.dart';
import 'package:dfa_shop/features/banners/domain/use_cases/get_all_banners_use_case.dart';
import 'package:dfa_shop/features/chat/data/data_source/chat_remote_data_source.dart';
import 'package:dfa_shop/features/chat/data/repository/chat_repository_impl.dart';
import 'package:dfa_shop/features/chat/domain/repository/chat_repository.dart';
import 'package:dfa_shop/features/chat/domain/use_cases/get_messages_stream_use_case.dart';
import 'package:dfa_shop/features/chat/domain/use_cases/send_message_use_case.dart';
import 'package:dfa_shop/features/chat/presentation/bloc/chat_screen_bloc.dart';
import 'package:dfa_shop/features/main/presentation/bloc/main_screen_bloc.dart';
import 'package:dfa_shop/features/products/data/data_source/products_local_data_source.dart';
import 'package:dfa_shop/features/products/data/data_source/products_remote_data_source.dart';
import 'package:dfa_shop/features/products/data/repository/products_repository_impl.dart';
import 'package:dfa_shop/features/products/domain/repository/products_repository.dart';
import 'package:dfa_shop/features/products/domain/use_cases/get_all_products_use_case.dart';
import 'package:dfa_shop/features/stories/data/data_source/stories_local_data_source.dart';
import 'package:dfa_shop/features/stories/data/data_source/stories_remote_data_source.dart';
import 'package:dfa_shop/features/stories/data/repository/stories_repository_impl.dart';
import 'package:dfa_shop/features/stories/domain/repository/stories_repository.dart';
import 'package:dfa_shop/features/stories/domain/use_cases/get_all_stories_use_case.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton(() => Dio()..interceptors.add(DioCacheInterceptor(options: options)));
  final channel = WebSocketChannel.connect(Uri.parse(Constants.webSocketUrl));
  await channel.ready;
  // Internal
  sl.registerLazySingleton<HiveInterface>(() => Hive);

  // Data sources
  // Remote
  sl.registerLazySingleton<BannersRemoteDataSource>(
    () => BannersRemoteDataSourceImpl(dio: sl<Dio>()),
  );
  sl.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(dio: sl<Dio>()),
  );
  sl.registerLazySingleton<StoriesRemoteDataSource>(
    () => StoriesRemoteDataSourceImpl(dio: sl<Dio>()),
  );
  sl.registerLazySingleton<ChatRemoteDataSource>(
    () {
      // final channel = null;
      return ChatRemoteDataSourceImpl(messagesChannel: channel);
    }
  );
  // Local
  sl.registerLazySingleton<BannersLocalDataSource>(
    () => BannersLocalDataSourceImpl(sl<HiveInterface>()),
  );
  sl.registerLazySingleton<ProductsLocalDataSource>(
    () => ProductsLocalDataSourceImpl(sl<HiveInterface>()),
  );
  sl.registerLazySingleton<StoriesLocalDataSource>(
    () => StoriesLocalDataSourceImpl(sl<HiveInterface>()),
  );

  // Repository
  sl.registerLazySingleton<BannersRepository>(
    () => BannersRepositoryImpl(
      remoteDataSource: sl<BannersRemoteDataSource>(),
      localDataSource: sl<BannersLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(
      remoteDataSource: sl<ProductsRemoteDataSource>(),
      localDataSource: sl<ProductsLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton<StoriesRepository>(
    () => StoriesRepositoryImpl(
      remoteDataSource: sl<StoriesRemoteDataSource>(),
      localDataSource: sl<StoriesLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(remoteDataSource: sl<ChatRemoteDataSource>()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllBannersUseCase(sl<BannersRepository>()));
  sl.registerLazySingleton(() => GetAllProductsUseCase(sl<ProductsRepository>()));
  sl.registerLazySingleton(() => GetAllStoriesUseCase(sl<StoriesRepository>()));

  sl.registerLazySingleton(() => GetMessagesStreamUseCase(sl<ChatRepository>()));
  sl.registerLazySingleton(() => SendMessageUseCase(sl<ChatRepository>()));

  // Provider
  sl.registerFactory(
    () => MainScreenBloc(
      getAllBannersUseCase: sl<GetAllBannersUseCase>(),
      getAllProductsUseCase: sl<GetAllProductsUseCase>(),
      getAllStoriesUseCase: sl<GetAllStoriesUseCase>(),
    ),
  );

  sl.registerFactory(
    () => ChatScreenBloc(
      getMessagesStreamUseCase: sl<GetMessagesStreamUseCase>(),
      sendMessageUseCase: sl<SendMessageUseCase>(),
    ),
  );
}
