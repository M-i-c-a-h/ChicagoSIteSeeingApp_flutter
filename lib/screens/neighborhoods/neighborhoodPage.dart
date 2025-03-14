import 'package:chicago_site_seeing_app/helpers.dart';
import 'package:chicago_site_seeing_app/screens/neighborhoods/UniversityVillage.dart';
import 'package:chicago_site_seeing_app/screens/neighborhoods/WestLoop.dart';
import 'package:chicago_site_seeing_app/screens/neighborhoods/southLoop.dart';
import 'package:flutter/material.dart';

class NeighboursRoute extends StatelessWidget {
  const NeighboursRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // First Attraction
            buildOptionCard(context, "Chicago West Loop",
                'assets/homes/wloop_1.jpeg', WestLoopRoute(), "westLoopRoute"),

            const SizedBox(height: 25), // Spacing between items

            // Second Attraction
            buildOptionCard(context, "Chicago South Loop",
                'assets/homes/sloop.jpg', SouthLoopRoute(), "southLoopRoute"),

            const SizedBox(height: 25),

            // Third Attraction
            buildOptionCard(
                context,
                "University Village",
                'assets/homes/uic.jpg',
                UniversityVillage(),
                "universityVillageRoute")
          ],
        ),
      ),
    );
  }
}
