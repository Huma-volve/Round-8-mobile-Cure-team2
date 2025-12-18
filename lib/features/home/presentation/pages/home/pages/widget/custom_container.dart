import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.textTitle,
    required this.textSubTitle,
  });
  final String textTitle;
  final String textSubTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.grey400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/image1.png',
            width: 80,
            height: 90,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VSpace(5),
                Text(
                  textTitle,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        textSubTitle,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Color(0xFF6D7379)),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.favorite_border,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Icon(Icons.star, color: AppColors.warning, size: 18),
                    SizedBox(width: 4),
                    Text(
                      '4.8',
                      style: TextStyle(color: Color(0xFF05162C)),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.watch_later_outlined, size: 16),
                    SizedBox(width: 6),
                    Text(
                      '9:30 am - 8:00 pm',
                      style: TextStyle(color: Color(0xFF05162C)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
