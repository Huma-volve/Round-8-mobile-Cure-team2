import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/features/tabs/models/doctor_Model.dart';
import 'package:cure_team_2/features/tabs/widgets/customButtonItem.dart';
import 'package:flutter/material.dart';

class BookingCard extends StatefulWidget {
  final BookingModel booking;

  const BookingCard({super.key, required this.booking});

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  Color get statusColor {
    switch (widget.booking.status) {
      case BookingStatus.upcoming:
        return AppColors.primary;
      case BookingStatus.completed:
        return AppColors.success;
      case BookingStatus.canceled:
        return AppColors.error;
    }
  }

  final String text = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.booking.doctorName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            Text(widget.booking.specialty),
            Text(widget.booking.address),

            const SizedBox(height: 12),

            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    switch (widget.booking.status) {
      case BookingStatus.upcoming:
        return Row(
          children: [
            Container(
           
              child: custombuttonItem(text: 'cancel', onpressed: () {  },),
            ),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: () {}, child: const Text('Reschedule')),
          ],
        );

      case BookingStatus.completed:
        return Row(
          children: [
            OutlinedButton(onPressed: () {}, child: const Text('Book again')),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: () {}, child: const Text('Feedback')),
          ],
        );

      case BookingStatus.canceled:
        return Row(
          children: [
            OutlinedButton(onPressed: () {}, child: const Text('Book again')),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: () {}, child: const Text('Support')),
          ],
        );
    }
  }
}
