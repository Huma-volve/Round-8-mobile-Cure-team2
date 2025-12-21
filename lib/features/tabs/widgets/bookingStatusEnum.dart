import 'dart:ui';

import 'package:cure_team_2/core/theme/app_colors.dart';

enum BookingStatus { Upcoming, Complete, Canceled }

String statusText(BookingStatus status) {
  switch (status) {
    case BookingStatus.Upcoming:
      return "Upcoming";

    case BookingStatus.Complete:
      return "Complete";
    case BookingStatus.Canceled:
      return "Canceled";
  }
}

Color statusColor(BookingStatus status) {
  switch (status) {
    case BookingStatus.Upcoming:
      return AppColors.primary;

    case BookingStatus.Complete:
      return AppColors.success;
    case BookingStatus.Canceled:
      return AppColors.error;
  }
}

extension BookingStatusUI on BookingStatus {
 List<String> get TextButton {
    switch (this) {
      case BookingStatus.Upcoming:
        return ["Cancel","Reschedule"];
      case BookingStatus.Complete:
        return ["View details","Feedback"];
      case BookingStatus.Canceled:
        return ["Book again", "Support"];
    }
  }


}
