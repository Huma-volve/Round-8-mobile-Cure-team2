import 'package:cure_team_2/core/di/service_Locator.dart';
import 'package:cure_team_2/features/Favourite/data/models/doctor_Model.dart';
import 'package:cure_team_2/features/Favourite/presentation/Widgets/DoctorFavItem.dart';
import 'package:cure_team_2/features/Favourite/presentation/cubit/favourite_State.dart';
import 'package:cure_team_2/features/Favourite/presentation/cubit/favourite_cubit.dart';
import 'package:cure_team_2/features/bookingAppointment/presentation/widget/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourFavourite extends StatelessWidget {
  const YourFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Your Favorite'),
      body: BlocProvider(
        create:
            (context) => servicelocator.get<FavouriteCubit>()..getfavourite(),
        child: BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return CircularProgressIndicator();
            } else if (state is ErrorState) {
              return Text("some thing error");
            } else if (state is SuccessgetFavouriteState) {
              return ListView.separated(
                padding: EdgeInsets.only(top: 32.h, bottom: 16.h),
                itemCount: favoriteDoctors.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 16.h);
                },
                itemBuilder: (BuildContext context, int index) {
                  return DoctorFavItem(model: favoriteDoctors[index]);
                },
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
