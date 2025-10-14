import 'dart:async';

import 'package:dfa_shop/core/use_case/base_use_case.dart';
import 'package:dfa_shop/features/banners/domain/models/banner_model.dart';
import 'package:dfa_shop/features/banners/domain/use_cases/get_all_banners_use_case.dart';
import 'package:dfa_shop/features/products/domain/models/product_model.dart';
import 'package:dfa_shop/features/products/domain/use_cases/get_all_products_use_case.dart';
import 'package:dfa_shop/features/stories/domain/models/story_model.dart';
import 'package:dfa_shop/features/stories/domain/use_cases/get_all_stories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc({
    required GetAllBannersUseCase getAllBannersUseCase,
    required GetAllProductsUseCase getAllProductsUseCase,
    required GetAllStoriesUseCase getAllStoriesUseCase,
  }) : _getAllBannersUseCase = getAllBannersUseCase,
       _getAllProductsUseCase = getAllProductsUseCase,
       _getAllStoriesUseCase = getAllStoriesUseCase,
       super(InitialMainScreenState()) {
    on<InitializeMainScreenEvent>(_onInitializeMainScreenEvent);
    on<LoadMainScreenEvent>(_onLoadMainScreenEvent);
    on<ErrorMainScreenEvent>(_onErrorMainScreenEvent);

    add(InitializeMainScreenEvent());
  }

  final GetAllBannersUseCase _getAllBannersUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;
  final GetAllStoriesUseCase _getAllStoriesUseCase;

  FutureOr<void> _onInitializeMainScreenEvent(InitializeMainScreenEvent event, Emitter<MainScreenState> emit) async {
    emit(LoadingMainScreenState());

    final bannersResult = await _getAllBannersUseCase.call(NoParams());
    final productsResult = await _getAllProductsUseCase.call(NoParams());
    final storiesResult = await _getAllStoriesUseCase.call(NoParams());

    final banners = bannersResult.fold((f) {
      emit(ErrorMainScreenState(message: f.toString()));
    }, (banners) => banners);
    final products = productsResult.fold((f) {
      emit(ErrorMainScreenState(message: f.toString()));
    }, (products) => products);
    final stories = storiesResult.fold((f) {
      emit(ErrorMainScreenState(message: f.toString()));
    }, (stories) => stories);

    emit(LoadedMainScreenState(banners: banners ?? [], products: products ?? [], stories: stories ?? []));
  }

  FutureOr<void> _onLoadMainScreenEvent(LoadMainScreenEvent event, Emitter<MainScreenState> emit) async {
    emit(LoadedMainScreenState(banners: [], products: [], stories: []));
  }

  FutureOr<void> _onErrorMainScreenEvent(ErrorMainScreenEvent event, Emitter<MainScreenState> emit) async {
    emit(ErrorMainScreenState(message: event.message));
  }
}
