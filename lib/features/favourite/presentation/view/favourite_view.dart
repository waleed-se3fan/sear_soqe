import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sear_soqe/core/routes/router_names.dart';
import 'package:sear_soqe/features/favourite/presentation/widgets/favourite_card_widget.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('المفضلة'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          SvgPicture.asset('assets/images/notification.svg'),
          SizedBox(width: 16.w),
        ],
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context.push(RouterNames.carDetail);
              },
              child: CarDetailCard(
                imageUrl: 'assets/images/popular-car.png',
                title: 'تويوتا',
                price: '100000',
                city: 'القاهرة',
                km: '10000',
                fuel: 'بنزين',
                year: '2020',
              ),
            );
          },
        ),
      ),
    );
  }
}
