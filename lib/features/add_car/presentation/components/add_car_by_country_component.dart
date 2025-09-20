import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sear_soqe/core/common/widgets/custom_text_form_field.dart';
import 'package:sear_soqe/core/functions/show_toast.dart';
import 'package:sear_soqe/features/add_car/presentation/logic/cubit/add_car_cubit.dart';
import 'package:sear_soqe/features/add_car/presentation/view/add_car_view.dart';
import 'package:sear_soqe/features/add_car/presentation/widgets/custom_items_widget.dart';

class AddCarByCountryComponent extends StatefulWidget {
  const AddCarByCountryComponent({super.key});

  @override
  State<AddCarByCountryComponent> createState() =>
      _AddCarByCountryComponentState();
}

class _AddCarByCountryComponentState extends State<AddCarByCountryComponent> {
  @override
  void initState() {
    super.initState();
    context.read<AddCarCubit>().getAllCountries();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AddCarCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AddCarTitle(title: 'فى اى مدينة توجد سيارتك ؟'),

        AddCarBody(
          widget: Column(
            children: [
              SizedBox(height: 10.h),
              CustomTextFormField(
                hintText: 'ابحث عن مدينة توجد سيارتك',
                suffixIcon: Icon(CupertinoIcons.search),
                onchanged: (value) {
                  context.read<AddCarCubit>().search(
                    value,
                    context.read<AddCarCubit>().countries,
                  );
                },
              ),
              SizedBox(
                height: 400,
                child: BlocBuilder<AddCarCubit, AddCarState>(
                  builder: (context, state) {
                    if (state is GetAllCountriesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is GetAllCountriesError) {
                      return Center(child: Text(state.message));
                    }
                    if (state is SearchState) {
                      return CustomItemsWidget(
                        cities: state.cities,
                        selectedCity: cubit.selectedCountry,
                        // onTap: () {
                        //   cubit.selectCountry(cubit.selectedCountry!);
                        // },
                      );
                    }
                    return CustomItemsWidget(
                      cities: context.read<AddCarCubit>().countries,
                      selectedCity: cubit.selectedCountry,
                      // onTap: () {
                      //   print(cubit.selectedCountry);

                      //   // cubit.selectCountry(cubit.selectedCountry!);
                      // },
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        AddCarFooter(
          progress: .05,
          index: 1,
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
