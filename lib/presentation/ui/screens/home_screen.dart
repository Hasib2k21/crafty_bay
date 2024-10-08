import 'package:crafty_bay/presentation/state_holders/bottom_navbar_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/category_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../widget/home/appbar_icon.dart';
import '../widget/home_banner_slider.dart';
import '../widget/home/horizontal_category_product_list.dart';
import '../widget/home/horizontal_product_list_view.dart';
import '../widget/home/search_text_field.dart';
import '../widget/home/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 18),
              SearchTextField(
                textEditingController: TextEditingController(),
              ),
              const SizedBox(height: 15),
              const HomeBannerSlider(),
              const SizedBox(height: 15),
              _buildCategoryListView(),
              const SizedBox(height: 15),
              _buildPopularProductsSection(),
              const SizedBox(height: 15),
              _buildNewProductsSection(),
              const SizedBox(height: 15),
              _buildSpecialProductsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularProductsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Popular',
          onTap: () {},
        ),
        const SizedBox(height: 180, child: HorizontalProductListView()),
      ],
    );
  }

  Widget _buildSpecialProductsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Special',
          onTap: () {},
        ),
        const SizedBox(height: 180, child: HorizontalProductListView()),
      ],
    );
  }

  Widget _buildNewProductsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'New',
          onTap: () {},
        ),
        const SizedBox(height: 180, child: HorizontalProductListView()),
      ],
    );
  }

  Widget _buildCategoryListView() {
    return Column(
      children: [
        SectionHeader(
          title: 'Category',
          onTap: () {
            Get.find<BottomNavbarController>().selectCategory();
          },
        ),
        const SizedBox(
          height: 120,
          child: HorizontalCategoryProductList(),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appLogoNav),
      actions: [
        AppbarIcon(onTap: () {}, iconData: Icons.person),
        const SizedBox(width: 8),
        AppbarIcon(onTap: () {}, iconData: Icons.call),
        const SizedBox(width: 8),
        AppbarIcon(onTap: () {}, iconData: Icons.notifications_active_outlined),
      ],
    );
  }
}
