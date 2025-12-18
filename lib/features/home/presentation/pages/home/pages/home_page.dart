import 'package:cached_network_image/cached_network_image.dart';
import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/extensions/navigation.dart';
import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/widgets/search_barr.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  final List<Widget> listPage = [
    const HomePageBody(),
    const Center(child: Text('Chat booking')),
    const Center(child: Text('Chat Page')),
    const Center(child: Text('Profile Page')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
          valueListenable: currentIndex,
          builder: (context, value, _) {
            return listPage[value];
          }),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex.value,
        onTap: (index) {
          setState(() {
            currentIndex.value = index;
          });
        },
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: const Color(0xFF145DB8),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(Assets.homeIcon), label: 'Home'),
        BottomNavigationBarItem(
            icon: Image.asset(Assets.calendarIcon), label: 'Booking'),
        BottomNavigationBarItem(
            icon: Image.asset(Assets.chatIcon), label: 'Chat'),
        BottomNavigationBarItem(
            icon: Image.asset(Assets.profileIcon), label: 'Profile'),
      ],
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppBarHome(),
          const SizedBox(
            height: 24,
          ),
          const CustomSearchPageBottom(),
          const SizedBox(
            height: 24,
          ),
          CustomText(
            onTap: () => context.pushNamed(Routes.specialtiesPage),
            textLarge: 'Specialties',
            textSmall: 'View all',
          ),
          const SizedBox(
            height: 24,
          ),
          const CustomListViewHomeHorizontal(),
          const SizedBox(
            height: 24,
          ),
          const CustomImage(),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            onTap: () => context.pushNamed(Routes.doctorsPage),
            textLarge: 'Doctors near you',
            textSmall: 'View all',
          ),
          const SizedBox(
            height: 8,
          ),
          const CustomListViewHomeVertical()
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String textLarge;
  final String textSmall;
  final void Function()? onTap;
  const CustomText({
    super.key,
    required this.textLarge,
    required this.textSmall,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(
              textLarge,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
            ),
            const Spacer(),
            Text(textSmall,
                style:
                    const TextStyle(fontSize: 17, color: AppColors.primary600)),
          ],
        ),
      ),
    );
  }
}

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw7KN97spbilvMv3J9dPaRK8_G1PTFNueatg&s',
                width: 50,
                height: 50,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome back,ahmed'),
                  Row(
                    children: [
                      Image.asset(Assets.locationIcon),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('El Nasr City'),
                    ],
                  )
                ],
              ),
            ),
            // const Spacer(),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                  width: 40,
                  height: 40,
                  child: InkWell(
                    onTap: () => context.pushNamed(Routes.favoritePage),
                    child: const Icon(
                      Icons.favorite_border_outlined,
                      size: 28,
                    ),
                  )),
            ),
            const SizedBox(width: 16),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: const SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.notifications_none,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListViewHomeHorizontal extends StatelessWidget {
  const CustomListViewHomeHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.grey400),
                      borderRadius: BorderRadius.circular(12)),
                  height: 50,
                  child: Align(
                      alignment: AlignmentGeometry.center,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Image.asset('assets/images/tens.png'),
                          ),
                          const Text('Dentist'),
                          const SizedBox(
                            width: 18,
                          )
                        ],
                      )),
                ));
          },
        ),
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
        width: width * 0.95,
        height: height * 0.23,
        child: Image.asset(
          'assets/images/Banner.png',
          fit: BoxFit.cover,
        ));
  }
}

class CustomListViewHomeVertical extends StatelessWidget {
  const CustomListViewHomeVertical({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: CustomContainer(
            textTitle: 'Robert Johnson',
            textSubTitle: 'Orthopedic | El-Nasr Hospital',
          ),
        );
      },
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.textTitle,
    required this.textSubTitle,
  });
  final String textTitle;
  final String textSubTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.grey400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/image1.png',
            width: 80,
            height: 90,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VSpace(5),
                Text(
                  textTitle,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        textSubTitle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // List<String> listFavorite = [];
                        // listFavorite.add()
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.favorite_border,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Icon(Icons.star, color: AppColors.warning, size: 18),
                    SizedBox(width: 4),
                    Text('4.8'),
                    SizedBox(width: 16),
                    Icon(Icons.watch_later_outlined, size: 16),
                    SizedBox(width: 6),
                    Text('9:30 am - 8:00 pm'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
