import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/profile/data/faqs_data_model.dart';
import 'package:flutter/material.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  int expandedIndex = 0;

  final List<FaqsDataModel> faqs = [
    FaqsDataModel(
      question: 'What is this app used for?',
      answer:
          'This app allows you to search for doctors, book appointments, and consult in person easily from your phone.',
    ),
    FaqsDataModel(
      question: 'Is the app free to use?',
      answer: '',
    ),
    FaqsDataModel(
      question: 'How can I find a doctor?',
      answer: '',
    ),
    FaqsDataModel(
      question: 'Can I cancel my appointment?',
      answer: '',
    ),
    FaqsDataModel(
      question: 'What payment are supported?',
      answer: '',
    ),
    FaqsDataModel(
      question: 'How do I edit my profile?',
      answer: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final TextStyle appBarTitleStyle = TextStyle(
      fontFamily: AppTextStyles.georgiaH3.fontFamily,
      fontSize: AppTextStyles.georgiaH3.fontSize,
      fontWeight: AppTextStyles.georgiaH3.fontWeight,
      color: const Color(0xff000000),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff05162c),
          ),
        ),
        title: Text(
          'FAQs',
          style: appBarTitleStyle,
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(
          top: 48,
          left: 16,
          right: 16,
        ),
        itemCount: faqs.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: 16,
        ),
        itemBuilder: (context, index) {
          final bool isExpanded = expandedIndex == index;

          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      expandedIndex = isExpanded ? -1 : index;
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          faqs[index].question,
                          style: appBarTitleStyle,
                        ),
                      ),
                      Icon(
                        isExpanded ? Icons.remove : Icons.add,
                        size: 24,
                        color: const Color(0xff05162c),
                      ),
                    ],
                  ),
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Column(
                    children: [
                      const SizedBox(height: 12),
                      Container(
                        height: 1,
                        color: const Color(0xFFCBD5E1),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        faqs[index].answer,
                        style: TextStyle(
                          fontFamily: AppTextStyles.montserratButton.fontFamily,
                          fontSize: AppTextStyles.montserratButton.fontSize,
                          fontWeight: AppTextStyles.montserratButton.fontWeight,
                          color: const Color(0xff99a2ab),
                        ),
                      ),
                    ],
                  ),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 250),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
