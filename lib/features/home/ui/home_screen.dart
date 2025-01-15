import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/features/home/logic/home_cubit.dart';
import 'package:flutter_complete_project/features/home/logic/home_state.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/categories_list/categories_bloc_builder.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/products_list/product_bloc_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/doctors_blue_container.dart';
import 'widgets/doctors_speciality_see_all.dart';
import 'widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(
            20.0,
            16.0,
            20.0,
            28.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              // verticalSpace(24),
              // const DoctorsSpecialitySeeAll(),
              verticalSpace(18),
              const CategoriesBlocBuilder(),
              verticalSpace(8),
              const ProductsBlocBuilder(),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: context
                .read<HomeCubit>()
                .selectedIndex,

            onTap: (index) {
              context.read<HomeCubit>().onItemTapped(index);
            },
            backgroundColor: Colors.grey,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            fixedColor: ColorsManager.mainBlue,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/images/home.png',
                  color: ColorsManager.mainBlue,
                  width: 24,
                  height: 24,
                ),
                icon: Image.asset(
                  'assets/images/home.png',
                  width: 24,
                  height: 24,
                ),
                label: 'Calls',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/images/cart.png',
                  color: ColorsManager.mainBlue,
                  width: 24,
                  height: 24,
                ),
                icon: Image.asset(
                  'assets/images/cart.png',
                  width: 24,
                  height: 24,
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/images/box.png',
                  color: ColorsManager.mainBlue,
                  width: 24,
                  height: 24,
                ),
                icon: Image.asset(
                  'assets/images/box.png',
                  width: 24,
                  height: 24,
                ),
                label: 'Camera',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/images/profile.png',
                  color: ColorsManager.mainBlue,
                  width: 24,
                  height: 24,
                ),
                icon: Image.asset(
                  'assets/images/profile.png',
                  width: 24,
                  height: 24,
                ),
                label: 'Chats',
              ),
            ],
          );
        },
      ),
    );
  }
}
