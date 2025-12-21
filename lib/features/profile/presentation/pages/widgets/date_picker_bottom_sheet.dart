import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';

enum DatePickerType { day, month, year }

class DatePickerBottomSheet extends StatefulWidget {
  final DatePickerType type;
  final int initialValue;
  final int? daysInMonth;
  final Function(int) onSelected;

  const DatePickerBottomSheet({
    super.key,
    required this.type,
    required this.initialValue,
    required this.onSelected,
    this.daysInMonth,
  });

  static void show({
    required BuildContext context,
    required DatePickerType type,
    required int initialValue,
    required Function(int) onSelected,
    int? daysInMonth,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder:
          (context) => DatePickerBottomSheet(
            type: type,
            initialValue: initialValue,
            onSelected: onSelected,
            daysInMonth: daysInMonth,
          ),
    );
  }

  @override
  State<DatePickerBottomSheet> createState() => _DatePickerBottomSheetState();
}

class _DatePickerBottomSheetState extends State<DatePickerBottomSheet> {
  late int _selectedValue;

  static const List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  String get _title {
    switch (widget.type) {
      case DatePickerType.day:
        return 'Select Day';
      case DatePickerType.month:
        return 'Select Month';
      case DatePickerType.year:
        return 'Select Year';
    }
  }

  List<Widget> get _pickerChildren {
    switch (widget.type) {
      case DatePickerType.day:
        final days = widget.daysInMonth ?? 31;
        return List.generate(
          days,
          (index) => Center(
            child: Text('${index + 1}', style: AppTextStyles.montserratButton),
          ),
        );
      case DatePickerType.month:
        return _months
            .map(
              (month) => Center(
                child: Text(month, style: AppTextStyles.montserratButton),
              ),
            )
            .toList();
      case DatePickerType.year:
        final currentYear = DateTime.now().year;
        return List.generate(
          currentYear - 1900 + 1,
          (index) => Center(
            child: Text(
              '${currentYear - index}',
              style: AppTextStyles.montserratButton,
            ),
          ),
        );
    }
  }

  int get _initialItem {
    switch (widget.type) {
      case DatePickerType.day:
        return _selectedValue - 1;
      case DatePickerType.month:
        return _selectedValue - 1;
      case DatePickerType.year:
        final currentYear = DateTime.now().year;
        return currentYear - _selectedValue;
    }
  }

  void _onSelectedItemChanged(int index) {
    switch (widget.type) {
      case DatePickerType.day:
        _selectedValue = index + 1;
        break;
      case DatePickerType.month:
        _selectedValue = index + 1;
        break;
      case DatePickerType.year:
        final currentYear = DateTime.now().year;
        _selectedValue = currentYear - index;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Color(0xFF99A2AB)),
                  ),
                ),
                Text(
                  _title,
                  style: AppTextStyles.montserratButton.copyWith(
                    color: const Color(0xFF05162C),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.onSelected(_selectedValue);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(color: Color(0xFF145DB8)),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                initialItem: _initialItem,
              ),
              itemExtent: 40.h,
              onSelectedItemChanged: _onSelectedItemChanged,
              children: _pickerChildren,
            ),
          ),
        ],
      ),
    );
  }
}
