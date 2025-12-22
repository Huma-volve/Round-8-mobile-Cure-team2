import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SendReviewPart extends StatelessWidget {
  const SendReviewPart({super.key});

  void _showThanksDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Thanks for your review',
                  style: AppTextStyles.georgiaSubheading.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Done',
                      style: AppTextStyles.montserratSubheading.copyWith(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Back to Home',
                  style: AppTextStyles.montserratRegularCaption.copyWith(
                    fontSize: 12,
                    color: AppColors.grey700,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: AppColors.primary,
        ),
        onPressed: () => _showThanksDialog(context),
        child: Text(
          'Send your review',
          textAlign: TextAlign.center,
          style: AppTextStyles.montserratSubheading
              .copyWith(color: AppColors.grey100),
        ),
      ),
    );
  }
}
