import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomListViewDoctorHorizontal extends StatelessWidget {
  const CustomListViewDoctorHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return InkWell(
                child: Container(
                  padding: EdgeInsets.zero,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.primary400,
                  ),
                  child: const Align(
                    alignment: AlignmentGeometry.center,
                    child: Text(
                      'All',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            } else {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.grey400),
                        borderRadius: BorderRadius.circular(12)),
                    height: 50,
                    child: Align(
                        alignment: AlignmentGeometry.center,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Image.asset(Assets.gastroenterologistIcon),
                            ),
                            const Text('Dentist'),
                            const SizedBox(
                              width: 18,
                            )
                          ],
                        )),
                  ));
            }
          },
        ),
      ),
    );
  }
}
