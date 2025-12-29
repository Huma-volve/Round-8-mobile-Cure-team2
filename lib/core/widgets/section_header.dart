import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/widgets/app_click.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title ;
  final String? action ;
  final bool showAction ;
  final TextStyle? headerStyle ; 
  final TextStyle? actionStyle ;
  final GestureTapCallback? onActionTap ;
  const SectionHeader({super.key,
  required this.title ,
    this.onActionTap,
    this.action ,this.actionStyle, this.headerStyle , this.showAction = true
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppTextStyles.georgiaSubheading,), 
        const Spacer(),
        if(showAction)
        AppClick(
          onTap: onActionTap,
          child: Text(action??"View all", style: AppTextStyles.montserratCaption.copyWith(
            color: AppColors.primary
          ),),
        )
      ],
    );
  }
}
