import 'package:flutter/material.dart';

import '../../../data/models/product_response_model.dart';
import 'product_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  final List<ProductData?>? doctorsList;
  const DoctorsListView({super.key, this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length,
        itemBuilder: (context, index) {
          return DoctorsListViewItem(
            doctorsModel: doctorsList?[index],
          );
        },
      ),
    );
  }
}
