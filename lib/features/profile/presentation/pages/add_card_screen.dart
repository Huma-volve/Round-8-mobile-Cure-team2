import 'package:cure_team_2/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/profile_tile.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/edit_profile_button.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  bool isSelected = false;
  bool isEditing = false;

  final TextEditingController cardController = TextEditingController();
  final FocusNode cardFocusNode = FocusNode();

  Widget _buildCircleSelector(bool selected) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xff6d7379),
          width: 1.5,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff145db8),
                ),
              ),
            )
          : null,
    );
  }

  @override
  void dispose() {
    cardController.dispose();
    cardFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff05162c),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add Card",
          style: TextStyle(
            fontFamily: AppTextStyles.georgiaH3.fontFamily,
            fontSize: AppTextStyles.georgiaH3.fontSize,
            fontWeight: AppTextStyles.georgiaH3.fontWeight,
            color: const Color(0xff000000),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Column(
          children: [
            48.verticalSpace,
            ProfileTile(
              leading: SvgPicture.asset(
                'assets/icons/visa.svg',
                width: 32.w,
                height: 20.h,
              ),
              showArrow: false,
              textStyle: TextStyle(
                fontFamily: AppTextStyles.montserratButton.fontFamily,
                fontSize: AppTextStyles.montserratButton.fontSize,
                fontWeight: AppTextStyles.montserratButton.fontWeight,
                color: const Color(0xff05162c),
              ),
              titleWidget: isEditing
                  ? TextField(
                      controller: cardController,
                      focusNode: cardFocusNode,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        isCollapsed: true,
                      ),
                      style: TextStyle(
                        fontFamily: AppTextStyles.montserratButton.fontFamily,
                        fontSize: AppTextStyles.montserratButton.fontSize,
                        fontWeight: AppTextStyles.montserratButton.fontWeight,
                        color: const Color(0xff05162c),
                      ),
                    )
                  : const Text('Axis Bank 450***49'),
              trailing: _buildCircleSelector(isSelected),
              onTap: isEditing
                  ? null
                  : () {
                      setState(() {
                        isEditing = true;
                        isSelected = true;
                      });

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        cardFocusNode.requestFocus();
                      });
                    },
            ),
            617.verticalSpace,
            EditProfileButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.addNewCard);
              },
              text: 'Add New Card',
              showPlus: true,
            ),
          ],
        ),
      ),
    );
  }
}
