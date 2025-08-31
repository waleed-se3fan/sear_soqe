import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sear_soqe/core/app_cubit/app_cubit.dart';
import 'package:sear_soqe/features/favourite/presentation/view/favourite_view.dart';
import 'package:sear_soqe/features/home/presentation/component/bottom_nav_bar_component.dart';
import 'package:sear_soqe/features/home/presentation/view/home_view.dart';
import 'package:sear_soqe/features/notification/presentation/view/favourite_view.dart';
import 'package:sear_soqe/features/profile/presentation/view/profile_view.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              print(state.bottomNavBarSelectedIndex);

              switch (state.bottomNavBarSelectedIndex) {
                case 0:
                  return HomeView();
                case 1:
                  return FavouriteView();
                case 2:
                  return MyWidget();
                case 3:
                  return NotificationView();
                case 4:
                  return ProfileView();
                default:
                  return HomeView();
              }
            },
          ),
          BottomNavBarComponent(),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('My Widget')));
  }
}
