import 'package:chicago_site_seeing_app/helpers.dart';
import 'package:chicago_site_seeing_app/screens/sports/Bears.dart';
import 'package:chicago_site_seeing_app/screens/sports/Bulls.dart';
import 'package:chicago_site_seeing_app/screens/sports/Hawks.dart';
import 'package:flutter/material.dart';

class SportsRoute extends StatelessWidget {
  const SportsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // First Attraction
            buildOptionCard(context, "Chicago Blackhawks",
                'assets/sports/hawks.png', HawksRoute(), "blackHawksRoute"),

            const SizedBox(height: 25), // Spacing between items

            // Second Attraction
            buildOptionCard(context, "Chicago Bulls", 'assets/sports/bulls.png',
                BullsRoute(), "bullsRoute"),

            const SizedBox(height: 25),

            // Third Attraction
            buildOptionCard(context, "Chicago Bears", 'assets/sports/bears.jpg',
                BearsRoute(), "bearsRoute")
          ],
        ),
      ),
    );
  }
}
