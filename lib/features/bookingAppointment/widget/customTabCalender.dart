import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalendar extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final Function(DateTime selected, DateTime focused) onDaySelected;

  const CustomTableCalendar({
    super.key,
    required this.selectedDay,
    required this.focusedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: focusedDay,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      onDaySelected: onDaySelected,

      /// Header
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        leftChevronMargin: EdgeInsets.zero,
        rightChevronMargin: EdgeInsets.zero,
      ),

      /// Days of week
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: AppColors.primary),
        weekendStyle: TextStyle(color: AppColors.primary),
      ),

      /// Calendar style
      calendarStyle: CalendarStyle(
        cellMargin: const EdgeInsets.all(4),
        defaultDecoration: BoxDecoration(
          border: Border.all(color: AppColors.grey300),
          borderRadius: BorderRadius.circular(8),
        ),
        selectedDecoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        todayDecoration: BoxDecoration(
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        defaultTextStyle: const TextStyle(fontWeight: FontWeight.w500),
        selectedTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        todayTextStyle: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
