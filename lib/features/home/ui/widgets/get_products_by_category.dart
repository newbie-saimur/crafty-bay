import 'package:crafty_bay/features/common/data/models/category_model.dart';
import 'package:crafty_bay/features/common/data/models/product_model.dart';
import 'package:crafty_bay/features/common/ui/controllers/product_list_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_card.dart';
import 'package:crafty_bay/features/home/ui/widgets/build_section_header.dart';
import 'package:crafty_bay/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetProductsByCategory extends StatefulWidget {
  const GetProductsByCategory({
    super.key,
    required this.model,
    required this.controller,
  });

  final CategoryModel model;
  final ProductListController controller;

  @override
  State<GetProductsByCategory> createState() => _GetProductsByCategoryState();
}

class _GetProductsByCategoryState extends State<GetProductsByCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildSectionHeader(
          title: widget.model.title,
          onTapSeeAll: () {
            Get.toNamed(RouteNames.productListScreen, arguments: widget.model);
          },
        ),
        const SizedBox(height: 4),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: GetBuilder(
            init: widget.controller,
            builder: (_) {
              List<ProductModel> productList = widget.controller.productList;
              return Visibility(
                visible: widget.controller.initialLoadingInProgress == false,
                replacement: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 200,
                  child: CenteredCircularProgressIndicator(),
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    ...productList.map(
                      (product) => ProductCard(model: product),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
