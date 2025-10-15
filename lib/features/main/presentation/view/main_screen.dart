import 'package:dfa_shop/core/utils/app_theme.dart';
import 'package:dfa_shop/features/banners/domain/models/banner_model.dart';
import 'package:dfa_shop/features/main/presentation/bloc/main_screen_bloc.dart';
import 'package:dfa_shop/features/main/presentation/view/widgets/banners.dart';
import 'package:dfa_shop/features/main/presentation/view/widgets/products_row.dart';
import 'package:dfa_shop/features/main/presentation/view/widgets/stories_row.dart';
import 'package:dfa_shop/features/products/domain/models/product_model.dart';
import 'package:dfa_shop/features/stories/domain/models/story_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({required this.bloc, super.key});

  final MainScreenBloc bloc;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<BannerModel> banners = [];
  List<ProductModel> products = [];
  List<StoryModel> stories = [];

  String? errorMessage;

  void _blocListener(BuildContext context, MainScreenState state) {
    switch (state) {
      case LoadedMainScreenState():
        banners = state.banners;
        products = state.products;
        stories = state.stories;

      case ErrorMainScreenState():
        errorMessage = state.message;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              SvgPicture.asset('assets/svg/profile_person.svg', width: 22, height: 22),
            ],
          ),
        ),
        title: Text('Анна',),
        actions: [
          IconButton(icon: SvgPicture.asset('assets/svg/bookmark_icon.svg'), onPressed: () {}),
          Stack(
            children: [
              IconButton(icon: SvgPicture.asset('assets/svg/notif_bell_icon.svg'), onPressed: () {}),
              Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: AppTheme.primary,
                  child: Text(
                    '2',
                    style: TextStyle(color: Colors.white, fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 8),
        ],
      ),
      body: BlocConsumer<MainScreenBloc, MainScreenState>(
        bloc: widget.bloc,
        listener: _blocListener,
        builder: (context, state) {
          if (state is ErrorMainScreenState && errorMessage != null) {
            return Center(child: Text('Возникла ошибка: $errorMessage'));
          } else if (state is LoadingMainScreenState || state is InitialMainScreenState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StoriesRow(stories: stories),
                  SizedBox(height: 15),
                  Banners(banners: banners),
                  SizedBox(height: 25),
                  ProductsRow(products: products),
                  SizedBox(height: 20),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
