import 'package:dfa_shop/features/banners/domain/models/banner_model.dart';
import 'package:dfa_shop/features/main/presentation/bloc/main_screen_bloc.dart';
import 'package:dfa_shop/features/main/presentation/view/widgets/banners.dart';
import 'package:dfa_shop/features/main/presentation/view/widgets/products_row.dart';
import 'package:dfa_shop/features/main/presentation/view/widgets/stories_row.dart';
import 'package:dfa_shop/features/products/domain/models/product_model.dart';
import 'package:dfa_shop/features/stories/domain/models/story_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      case LoadingMainScreenState():
        print('');

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
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 80, // Adjust to fit "Анна" and avatar
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[200],
                child: Icon(Icons.person, color: Colors.grey[600]),
              ),
              SizedBox(width: 8),
              Text(
                'Анна',
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border, color: Colors.black),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_none, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(6)),
                  constraints: BoxConstraints(minWidth: 12, minHeight: 12),
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
          if (state is LoadingMainScreenState || state is InitialMainScreenState) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StoriesRow(stories: stories,),
                Banners(banners: banners),
                ProductsRow(products: products),
                SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}

