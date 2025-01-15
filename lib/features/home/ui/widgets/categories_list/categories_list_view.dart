import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/home/data/models/categories_response_model.dart';
import 'package:flutter_complete_project/features/home/logic/home_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/product_response_model.dart';
import 'categories_list_view_item.dart';

class CategoryListView extends StatefulWidget {
  final List<CategoryData?> specializationDataList;
  const CategoryListView(
      {super.key, required this.specializationDataList});

  @override
  State<CategoryListView> createState() =>
      _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  var selectedSpecializationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationDataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print(widget.specializationDataList[index]?.name);
              setState(() {
                selectedSpecializationIndex = index;
              });
              // context.read<HomeCubit>().getProductsList(
              //       specializationId: widget.specializationDataList[index]?.id,
              //     );
            },
            child: SpecialityListViewItem(
              specializationsData: widget.specializationDataList[index],
              itemIndex: index,
              selectedIndex: selectedSpecializationIndex,
            ),
          );
        },
      ),
    );
  }
}
