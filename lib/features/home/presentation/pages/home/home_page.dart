import 'package:cached_network_image/cached_network_image.dart';
import 'package:cure_team_2/features/home/presentation/pages/favorite/presentation/pages/favorite_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  final List<Widget> listPage = [
    const FavoritePage(),
    const HomePageBody(),
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
            icon: Image.asset('assets/images/Home.png'), label: 'Home'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/images/calendar-02.png'),
            label: 'Booking'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/images/chat.png'), label: 'Chat'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/images/elements.png'), label: 'Profile'),
      ],
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(),
          SizedBox(
            height: 24,
          ),
          CustomTextFailed(),
          SizedBox(
            height: 24,
          ),
          CustomText(
            textLarge: 'Specialties',
            textSmall: 'View all',
          ),
          SizedBox(
            height: 24,
          ),
          CustomListViewHomeHorizontal(),
          SizedBox(
            height: 24,
          ),
          CustomImage(),
          SizedBox(
            height: 10,
          ),
          CustomText(
            textLarge: 'Doctors near you',
            textSmall: 'View all',
          ),
          SizedBox(
            height: 8,
          ),
          CustomListViewHomeVertical()
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String textLarge;
  final String textSmall;

  const CustomText({
    super.key,
    required this.textLarge,
    required this.textSmall,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            textLarge,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
          ),
          const Spacer(),
          Text(textSmall,
              style: const TextStyle(fontSize: 17, color: Color(0xFF145DB8))),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

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
                      Image.asset('assets/images/Icon.png'),
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
              child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.favorite_border_outlined,
                    size: 28,
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

class CustomTextFailed extends StatelessWidget {
  const CustomTextFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6F7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset('assets/images/Vector.png'),
            const SizedBox(width: 8),
            const Expanded(
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search for specialty, doctor',
                  isCollapsed: true,
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
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  decoration: BoxDecoration(
                      border: BoxBorder.all(width: 0.5),
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
    // required this.showObject
  });
// final   ShowObject showObject;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      // showObject.show.length,
      itemBuilder: (BuildContext context, int index) {
// final list=showObject.show[index];
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: CustomContainer(
            textTitle: 'Robert Johnson',
            textSubTitle: 'Orthopedic | El-Nasr Hospital', // list: list
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
    //required this.list,
  });
// final ModelListView list;
  final String textTitle;
  final String textSubTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/image1.png',
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textTitle,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
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
                      child: const Icon(
                        Icons.favorite_border,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18),
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
