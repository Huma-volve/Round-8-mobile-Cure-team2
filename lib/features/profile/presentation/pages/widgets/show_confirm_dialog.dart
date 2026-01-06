import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ShowConfirmDialog extends StatefulWidget {
  final String title;
  final String message;
  final String confirmText;
  final VoidCallback onConfirm;

  const ShowConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmText,
    required this.onConfirm,
  });

  @override
  State<ShowConfirmDialog> createState() => _ShowConfirmDialogState();
}

class _ShowConfirmDialogState extends State<ShowConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dialogWidth = screenWidth > 428 ? 428.0 : screenWidth - 32;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: dialogWidth,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34),
            topRight: Radius.circular(34),
            bottomLeft: Radius.circular(54),
            bottomRight: Radius.circular(54),
          ),
          boxShadow: [
            BoxShadow(color: Color(0x40000000), blurRadius: 4),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontFamily: AppTextStyles.georgiaH3.fontFamily,
                fontSize: AppTextStyles.georgiaH3.fontSize,
                fontWeight: AppTextStyles.georgiaH3.fontWeight,
                color: const Color(0xFF05162C),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(
              height: 1,
              color: Color(0xFFe5e7eb),
            ),
            const SizedBox(height: 16),
            Text(
              widget.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTextStyles.montserratButton.fontFamily,
                fontSize: AppTextStyles.montserratButton.fontSize,
                fontWeight: AppTextStyles.montserratButton.fontWeight,
                color: const Color(0xFF6D7379),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 37,
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFBBC1C7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontFamily:
                              AppTextStyles.montserratCaption.fontFamily,
                          fontSize: AppTextStyles.montserratCaption.fontSize,
                          fontWeight:
                              AppTextStyles.montserratCaption.fontWeight,
                          color: const Color(0xFF05162C),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.pop(context);
                      widget.onConfirm();
                    },
                    child: Container(
                      height: 37,
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF145DB8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        widget.confirmText,
                        style: TextStyle(
                          fontFamily:
                              AppTextStyles.montserratCaption.fontFamily,
                          fontSize: AppTextStyles.montserratCaption.fontSize,
                          fontWeight:
                              AppTextStyles.montserratCaption.fontWeight,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
