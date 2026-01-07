import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/di/service_Locator.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/Favourite/presentation/cubit/favourite_State.dart';
import 'package:cure_team_2/features/Favourite/presentation/cubit/favourite_cubit.dart';
import 'package:cure_team_2/features/bookingAppointment/presentation/widget/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFavourite extends StatefulWidget {
  const AddFavourite({super.key});

  @override
  State<AddFavourite> createState() => _AddFavouriteState();
}

class _AddFavouriteState extends State<AddFavourite> {
  @override
  Widget build(BuildContext context) {
    // final String doctorId =
    //     ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: const CustomAppBar(title: "Your Favorite"),
      body: Container(
        margin: const EdgeInsets.all(24),
        padding: EdgeInsets.only(left: 60.w, right: 15.w),
        child: BlocProvider(
          create:
              (context) =>
                  servicelocator.get<FavouriteCubit>()..postfavourite(),
          child: BlocBuilder<FavouriteCubit, FavouriteState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return CircularProgressIndicator();
              } else if (state is ErrorState) {
                return Text("some thing error");
              } else if (state is SuccesspostFavouriteState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.favouritImage,
                      width: 177.5.w,
                      height: 181.h,
                    ),
                    SizedBox(height: 24.h),
                    Text('Your favorite!', style: AppTextStyles.georgiaH3),
                    SizedBox(height: 10.h),
                    Text(
                      'Add your favorite to find it easily',
                      style: AppTextStyles.montserratRegularButton,
                    ),
                  ],
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
