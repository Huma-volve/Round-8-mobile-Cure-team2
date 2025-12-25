import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class WalletTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const WalletTile({
    super.key,
    required this.leading,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xffF5F6F7),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            leading,
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: AppTextStyles.montserratButton.fontFamily,
                  fontSize: AppTextStyles.montserratButton.fontSize,
                  fontWeight: AppTextStyles.montserratButton.fontWeight,
                  color: const Color(0xff05162c),
                ),
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xff145db8)
                      : const Color(0xffC4C4C4),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff05162c),
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
