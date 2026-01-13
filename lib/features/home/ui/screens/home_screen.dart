import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/features/home/ui/widgets/hero_banner_carousel.dart';
import 'package:crafty_bay/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static final String name = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _currentSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 12),
              ProductSearchBar(),
              const SizedBox(height: 12),
              HeroBannerCarousel(currentSlider: _currentSlider),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPaths.navAppLogoSvg),
      actions: [
        _buildActionButton(iconData: Icons.person_3_outlined, onTap: () {}),
        const SizedBox(width: 8),
        _buildActionButton(iconData: Icons.call_outlined, onTap: () {}),
        const SizedBox(width: 8),
        _buildActionButton(
          iconData: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData iconData,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.black.withValues(alpha: 0.05),
        child: Icon(iconData, color: Colors.black54, size: 18),
      ),
    );
  }
}