import 'package:dfa_shop/features/product_details/presentation/view/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shop')),
      body: BlocConsumer<MainScreenEvent, MainScreenState>(
        listener: (context, state) {
          switch (state) {
            case LoadingMainScreenState():
              
            case LoadedMainScreenState():
          }
        },
        builder: (context, state) {
          if (state is LoadingMainScreenState) {
            return const Center(child: CircularProgressIndicator());
          } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Stories
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.stories.length,
                    itemBuilder: (context, index) {
                      final story = provider.stories[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(backgroundImage: NetworkImage(story.image), radius: 40),
                            const SizedBox(height: 8),
                            Text(story.name),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: provider.banners.length,
                    itemBuilder: (context, index) {
                      final banner = provider.banners[index];
                      return Image.network(banner.image, fit: BoxFit.cover);
                    },
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75),
                  itemCount: provider.products.length,
                  itemBuilder: (context, index) {
                    final product = provider.products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product)));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Expanded(child: Image.network(product.image, fit: BoxFit.cover)),
                            Text(product.name),
                            Text('\$${product.price.toStringAsFixed(2)}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },}
      ),
    );
  }
}
