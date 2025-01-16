import 'package:flutter/material.dart';

import '../../../data/models/product_response_model.dart';
import 'product_list_view_item.dart';

class ProductsListView extends StatelessWidget {
  final List<ProductData?>? ProductsList;
  const ProductsListView({super.key, this.ProductsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: ProductsList?.length,
        itemBuilder: (context, index) {
          return ProductsViewItem(
            doctorsModel: ProductsList?[index],
          );
        },
      ),
    );
  }
}
