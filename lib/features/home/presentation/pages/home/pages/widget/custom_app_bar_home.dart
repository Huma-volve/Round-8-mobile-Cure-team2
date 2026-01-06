import 'package:cached_network_image/cached_network_image.dart';
import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/extensions/navigation.dart';
import 'package:cure_team_2/core/routing/routes.dart';
import 'package:flutter/material.dart';

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
                placeholder:
                    (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome back, ahmed',
                    style: TextStyle(fontSize: 14, color: Color(0xFF05162C)),
                  ),
                  Row(
                    children: [
                      Image.asset(Assets.locationIcon),
                      const SizedBox(width: 5),
                      const Text(
                        'El Nasr City',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6D7379),
                        ),
                      ),
                    ],
                  ),
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
                  child: const Icon(Icons.favorite_border_outlined, size: 24),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 40,
                height: 40,
                child: InkWell(
                  onTap: () => context.pushNamed(Routes.notifications),
                  child: const Icon(Icons.notifications_none, size: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
