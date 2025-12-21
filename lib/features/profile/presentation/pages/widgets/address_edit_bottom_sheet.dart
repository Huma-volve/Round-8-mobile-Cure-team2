import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';

class AddressEditBottomSheet extends StatefulWidget {
  final String initialAddress;
  final Function(String) onSave;

  const AddressEditBottomSheet({
    super.key,
    required this.initialAddress,
    required this.onSave,
  });

  static void show({
    required BuildContext context,
    required String initialAddress,
    required Function(String) onSave,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder:
          (context) => AddressEditBottomSheet(
            initialAddress: initialAddress,
            onSave: onSave,
          ),
    );
  }

  @override
  State<AddressEditBottomSheet> createState() => _AddressEditBottomSheetState();
}

class _AddressEditBottomSheetState extends State<AddressEditBottomSheet> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialAddress);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16.w,
        right: 16.w,
        top: 16.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Edit Address', style: AppTextStyles.georgiaSubheading),
          16.verticalSpace,
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter your address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Color(0xFF145DB8)),
              ),
            ),
          ),
          16.verticalSpace,
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF145DB8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {
                widget.onSave(_controller.text);
                Navigator.pop(context);
              },
              child: const Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ),
          16.verticalSpace,
        ],
      ),
    );
  }
}
