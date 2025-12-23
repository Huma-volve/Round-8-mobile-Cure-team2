import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_details_view_body.dart';
import 'package:flutter/material.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false, // عشان نتحكم في اللودينج
      //   titleSpacing: 0, // نزّل العنوان للآخر من اليسار
      //   leadingWidth: 60, // حجم مساحة اللودينج
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 17),
      //       child: SvgPicture.asset(
      //         Assets.chat,
      //         width: 24,
      //         height: 24,
      //         fit: BoxFit.contain,
      //       ),
      //     ),
      //   ],
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 17, top: 10, bottom: 10),
      //     child: SvgPicture.asset(
      //       Assets.arrow,
      //       width: 24,
      //       height: 24,
      //       fit: BoxFit.contain,
      //     ),
      //   ),
      //   title: Text(
      //     'Doctor Details',
      //     style: AppTextStyles.georgiaH2.copyWith(fontSize: 26),
      //   ),
      //   centerTitle: false, // لو عايز العنوان على الشمال
      //   backgroundColor: Colors.white, // لو تحب لون أبيض
      //   elevation: 0, // لو تحب AppBar مسطح
      // ),
      body: const DoctorDetailsViewBody(),
    );
  }
}
