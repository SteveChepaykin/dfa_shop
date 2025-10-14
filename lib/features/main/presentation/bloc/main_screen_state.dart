part of 'main_screen_bloc.dart';

abstract class MainScreenState {}

class InitialMainScreenState extends MainScreenState {}

class LoadingMainScreenState extends MainScreenState {}

class LoadedMainScreenState extends MainScreenState {
  LoadedMainScreenState({
    required this.banners,
    required this.products,
    required this.stories,
  });

  final List<BannerModel> banners;
  final List<ProductModel> products;
  final List<StoryModel> stories;
}

class ErrorMainScreenState extends MainScreenState {
  ErrorMainScreenState({required this.message});
  
  final String message;
}
