import 'package:carousel_slider/carousel_slider.dart';
import 'package:dfa_shop/core/utils/app_theme.dart';
import 'package:dfa_shop/features/banners/domain/models/banner_model.dart';
import 'package:dfa_shop/features/main/presentation/view/widgets/banner_item.dart';
import 'package:flutter/material.dart';

class Banners extends StatefulWidget {
  const Banners({required this.banners, super.key});

  final List<BannerModel> banners;

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  int _bannerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.banners.isNotEmpty
            ? CarouselSlider(
                items: [...widget.banners.map((ban) => BannerItem(banner: ban))],
                options: CarouselOptions(
                  height: 144,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: false,
                  autoPlay: false,
                  viewportFraction: 1,
                  onPageChanged: (index, _) {
                    setState(() {
                      _bannerIndex = index;
                    });
                  },
                ),
              )
            : const SizedBox.shrink(),
        if(widget.banners.isNotEmpty) SizedBox(height: 10),
        if(widget.banners.isNotEmpty) Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ...widget.banners.indexed.map(
            (i) => _buildPageIndicator(i.$1 == _bannerIndex),
          ),
        ]),
      ],
    );
  }

  Widget _buildPageIndicator(bool isActive) {
    Color inactiveCol = AppTheme.lightGrey.withAlpha(125);
    Color activeCol = AppTheme.lightGrey;
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 32.0 : 8.0,
      decoration: BoxDecoration(color: isActive ? activeCol : inactiveCol, borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
