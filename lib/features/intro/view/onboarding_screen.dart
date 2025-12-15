import 'package:cure_team_2/core/extensions/padding.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/intro/view/widgets/on_boarding_item.dart';
import 'package:cure_team_2/features/intro/view/widgets/onboarding_page_indecator.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/app_button.dart';
import '../constants/onboarding_constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  late final ValueNotifier<int> _currentPageNotifier;
  late final List<OnBoardingItemModel> _items;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentPageNotifier = ValueNotifier<int>(0);
    _items = OnBoardingConstants.items;
  }

  void _goToNextPage() {
    final nextPage = _currentPageNotifier.value + 1;
    if (nextPage < _items.length) {
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      endOnboarding();
    }
  }

  void endOnboarding() {}

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentPageNotifier,
      builder: (context, currentPage, _) {
        final isLastPage = currentPage == _items.length - 1;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                _skipButton(),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _items.length,
                    onPageChanged: (index) =>
                        _currentPageNotifier.value = index,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          OnBoardingItem(
                            item: _items[index],
                          ),
                          OnBoardingPageIndicator(
                            pageNotifier: _currentPageNotifier,
                            pageCount: _items.length,
                          )
                        ],
                      );
                    },
                  ),
                ),
                AppButton(
                    text: isLastPage ? "Get Started" : "Next",
                    onPressed: _goToNextPage)
              ],
            ).appPaddingAll(24),
          ),
        );
      },
    );
  }

  Widget _skipButton() => Align(
      alignment: AlignmentDirectional.topEnd,
      child: TextButton(
        onPressed: endOnboarding,
        child: Text("Skip ", style: AppTextStyles.montserratButton),
      ));

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }
}
