import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:cure_team_2/features/home/presentation/pages/specialties/presentation/pages/widget/custom_items_specialties.dart';
import 'package:flutter/material.dart';

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
            height: 80,
            child: SingleChildScrollView(
              child: Row(
                children: [
                  CustomItemsSpecialties(
                    onTap: () {},
                    text: 'Dentist',
                    image: Assets.dentistIcon,
                    horizontal: 20,
                  ),
                  const HSpace(16),
                  CustomItemsSpecialties(
                    onTap: () {},
                    text: 'Cardiologist',
                    image: Assets.cardiologistIcon,
                    horizontal: null,
                  ),
                  const HSpace(16),
                  CustomItemsSpecialties(
                    onTap: () {},
                    text: 'Ophthalmologist',
                    image: Assets.ophthalmologistIcon,
                    horizontal: null,
                  ),
                ],
              ),
            ),
          ),
          const VSpace(8),
          SizedBox(
            height: 80,
            child: SingleChildScrollView(
              child: Row(
                children: [
                  CustomItemsSpecialties(
                    onTap: () {},
                    text: 'Neurologist',
                    image: Assets.neurologistIcon,
                    horizontal: null,
                  ),
                  const HSpace(16),
                  CustomItemsSpecialties(
                    onTap: () {},
                    text: 'Endocrinologist',
                    image: Assets.endocrinologistIcon,
                    horizontal: null,
                  ),
                  const HSpace(16),
                  CustomItemsSpecialties(
                    onTap: () {},
                    text: 'Oncologist',
                    image: Assets.oncologistIcon,
                    horizontal: null,
                  ),
                ],
              ),
            ),
          ),
          const VSpace(8),
          SizedBox(
            height: 80,
            child: SingleChildScrollView(
              child: Row(
                children: [
                  CustomItemsSpecialties(
                    onTap: () {},
                    text: 'Pulmonologist',
                    image: Assets.dentistIcon,
                    horizontal: null,
                  ),
                  const HSpace(16),
                  CustomItemsSpecialties(
                    onTap: () {},
                    text: 'Psychiatrist',
                    image: Assets.psychiatristIcon,
                    horizontal: null,
                  ),
                  const HSpace(16),
                  CustomItemsSpecialties(
                    onTap: () {},
                    text: 'Orthopedic',
                    image: Assets.orthopedicIcon,
                    horizontal: null,
                  ),
                ],
              ),
            ),
          ),
          const VSpace(8),
          SizedBox(
            height: 80,
            child: SingleChildScrollView(
              child: Row(
                children: [
                  CustomItemsSpecialties(
                    onTap: () {},
                    text: 'Gastroenterologist',
                    image: Assets.gastroenterologistIcon,
                    horizontal: null,
                  ),
                  const HSpace(16),
                  CustomItemsSpecialties(
                    onTap: () {},
                    text: 'General Practitioner',
                    image: Assets.generalPractitionerIcon,
                    horizontal: null,
                  ),
                ],
              ),
            ),
          ),
          const VSpace(8),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                CustomItemsSpecialties(
                  onTap: () {},
                  text: 'ENT',
                  image: Assets.entIcon,
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
