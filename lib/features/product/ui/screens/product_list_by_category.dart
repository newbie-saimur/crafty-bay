import 'package:crafty_bay/features/common/data/models/category_model.dart';
import 'package:crafty_bay/features/common/ui/controllers/product_list_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListByCategory extends StatefulWidget {
  const ProductListByCategory({super.key, required this.category});

  final CategoryModel category;

  @override
  State<ProductListByCategory> createState() => _ProductListByCategoryState();
}

class _ProductListByCategoryState extends State<ProductListByCategory> {
  late final ProductListController _productListController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _productListController = Get.put(
      ProductListController(),
      tag: widget.category.id,
      permanent: true,
    );
    _productListController.getProductListByCategory(widget.category.id);
    _scrollController.addListener(_loadMoreProducts);
  }

  void _loadMoreProducts() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.85) {
      _productListController.getProductListByCategory(widget.category.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.title),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Colors.black.withValues(alpha: 0.05)),
        ),
      ),
      body: GetBuilder<ProductListController>(
        tag: widget.category.id,
        builder: (_) {
          return Visibility(
            visible: _productListController.initialLoadingInProgress == false,
            replacement: CenteredCircularProgressIndicator(),
            child: _productListController.productList.isEmpty
                ? Center(child: Text("No product found!"))
                : Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: GridView.builder(
                            controller: _scrollController,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      MediaQuery.sizeOf(context).width < 600
                                      ? 2
                                      : 3,
                                  mainAxisSpacing: 4,
                                  crossAxisSpacing: 12,
                                  childAspectRatio: 0.7,
                                ),
                            itemCount:
                                _productListController.productList.length,
                            itemBuilder: (context, index) {
                              return FittedBox(
                                child: ProductCard(
                                  model:
                                      _productListController.productList[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _productListController.inProgress,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: CenteredCircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<ProductListController>(tag: widget.category.id);
    _scrollController.dispose();
    super.dispose();
  }
}
