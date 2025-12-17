import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/widgets/app_bar.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

class SpecialtiesPage extends StatelessWidget {
  const SpecialtiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Specialties'),
      body: SpecialtiesPageBody(),
    );
  }
}

class SpecialtiesPageBody extends StatelessWidget {
  const SpecialtiesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VSpace(40),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                CustomItemsSpecialties(
                  onTap: () {},
                  text: 'Dentist',
                  image: 'assets/images/tens.png',
                  horizontal: 23,
                ),
                const HSpace(16),
                CustomItemsSpecialties(
                  onTap: () {},
                  text: 'Cardiologist',
                  image: 'assets/images/tens.png',
                  horizontal: null,
                ),
                const HSpace(16),
                CustomItemsSpecialties(
                  onTap: () {},
                  text: 'Ophthalmologist',
                  image: 'assets/images/tens.png',
                  horizontal: null,
                ),
              ],
            ),
          ),
          const VSpace(16),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                CustomItemsSpecialties(
                  onTap: () {},
                  text: 'Neurologist',
                  image: 'assets/images/tens.png',
                  horizontal: null,
                ),
                const HSpace(16),
                CustomItemsSpecialties(
                  onTap: () {},
                  text: 'Endocrinologist',
                  image: 'assets/images/tens.png',
                  horizontal: null,
                ),
                const HSpace(16),
                CustomItemsSpecialties(
                  onTap: () {},
                  text: 'Oncologist',
                  image: 'assets/images/tens.png',
                  horizontal: null,
                ),
              ],
            ),
          ),
          const VSpace(16),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                CustomItemsSpecialties(
                  onTap: () {},
                  text: 'Pulmonologist',
                  image: 'assets/images/tens.png',
                  horizontal: null,
                ),
                const HSpace(16),
                CustomItemsSpecialties(
                  onTap: () {},
                  text: 'Psychiatrist',
                  image: 'assets/images/tens.png',
                  horizontal: null,
                ),
                const HSpace(16),
                CustomItemsSpecialties(
                  onTap: () {},
                  text: 'Orthopedic',
                  image: 'assets/images/tens.png',
                  horizontal: null,
                ),
              ],
            ),
          ),
          const VSpace(16),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                CustomItemsSpecialties(
                  onTap: () {},
                  text: 'Gastroenterologist',
                  image: 'assets/images/tens.png',
                  horizontal: null,
                ),
                const HSpace(16),
                CustomItemsSpecialties(
                  onTap: () {},
                  text: 'General Practitioner',
                  image: 'assets/images/tens.png',
                  horizontal: null,
                ),
              ],
            ),
          ),
          const VSpace(16),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                CustomItemsSpecialties(
                  onTap: () {},
                  text: 'ENT',
                  image: 'assets/images/tens.png',
                  horizontal: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomItemsSpecialties extends StatelessWidget {
  const CustomItemsSpecialties(
      {super.key,
      required this.text,
      required this.image,
      required this.horizontal,
      this.onTap});
  final String text;
  final String image;
  final double? horizontal;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: horizontal ?? 8),
        decoration: BoxDecoration(
          color: AppColors.primary50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2, color: AppColors.grey400),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: Column(
            children: [Image.asset(image), const VSpace(8), Text(text)],
          ),
        ),
      ),
    );
  }
}
