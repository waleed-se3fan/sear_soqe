import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/functions/show_toast.dart';
import 'package:sear_soqe/core/theme/app_colors.dart';
import 'package:sear_soqe/features/add_car/presentation/logic/cubit/add_car_cubit.dart';
import 'package:sear_soqe/features/add_car/presentation/view/add_car_view.dart';
import 'package:sear_soqe/features/add_car/presentation/widgets/custom_items_widget.dart';

class AddCarByCityComponent extends StatefulWidget {
  const AddCarByCityComponent({super.key});

  @override
  State<AddCarByCityComponent> createState() => _AddCarByCityComponentState();
}

class _AddCarByCityComponentState extends State<AddCarByCityComponent> {
  @override
  void initState() {
    super.initState();
    context.read<AddCarCubit>().getAllCities(
      context.read<AddCarCubit>().selectedCity!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AddCarTitle(title: 'فى اى منطقة توجد سيارتك ؟'),

        AddCarBody(
          widget: Column(
            children: [
              CustomTextFormField(
                hintText: context.read<AddCarCubit>().selectedCity,
                suffixIcon: Image.asset(
                  'assets/images/edit.png',
                  height: 20,
                  width: 20,
                ),
                fillColor: AppColors.fillGrey,
              ),
              SizedBox(height: 14.h),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
                onchanged: (value) {
                  context.read<AddCarCubit>().search(
                    value,
                    context.read<AddCarCubit>().cities,
                  );
                },
              ),
              SizedBox(
                height: 400,
                child: BlocBuilder<AddCarCubit, AddCarState>(
                  builder: (context, state) {
                    if (state is GetAllCitiesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is GetAllCitiesError) {
                      return Center(child: Text(state.message));
                    }
                    if (state is SearchState) {
                      return CustomItemsWidget(cities: state.cities);
                    }
                    return CustomItemsWidget(
                      cities: context.read<AddCarCubit>().cities,
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        AddCarFooter(
          progress: .1,
          index: 2,
          onTitlePressed: () {
            if (context.read<AddCarCubit>().selectedCity == null) {
              showToast(message: 'اختر مدينة', state: ToastStates.WARNING);
            } else {
              context.read<AddCarCubit>().addCountry(
                context.read<AddCarCubit>().selectedCity!,
              );
            }
          },
        ),
      ],
    );
  }
}
