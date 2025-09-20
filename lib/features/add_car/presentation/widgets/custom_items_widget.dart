import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/add_car/presentation/logic/cubit/add_car_cubit.dart';

class CustomItemsWidget extends StatelessWidget {
  const CustomItemsWidget({super.key, required this.cities});

  final List<String> cities;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AddCarCubit>();

    return ListView.builder(
      itemCount: cities.length,
      itemExtent: 70,
      itemBuilder: (c, i) {
        final city = cities[i];

        return Card(
          color: cubit.selectedCity == city
              ? AppColors.primary
              : AppColors.white,
          child: InkWell(
            onTap: () {
              cubit.selectCity(city);
            },
            child: Row(
              children: [
                SizedBox(width: 10),
                Text(
                  city,
                  style: TextStyle(
                    color: cubit.selectedCity == city
                        ? Colors.white
                        : Colors.black,
                    fontWeight: cubit.selectedCity == city
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
