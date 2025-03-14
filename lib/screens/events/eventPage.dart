import 'package:chicago_site_seeing_app/helpers.dart';
import 'package:chicago_site_seeing_app/screens/events/air_waterPage.dart';
import 'package:chicago_site_seeing_app/screens/events/ribfestPage.dart';
import 'package:flutter/material.dart';

import 'stPatrickPage.dart';

class EventsRoute extends StatelessWidget {
  const EventsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // First Attraction
            buildOptionCard(context, "Chicago St. Patrick's Day",
                'assets/events/st_p.png', StPatrickRoute(), "StPatrickRoute"),

            const SizedBox(height: 25), // Spacing between items

            // Second Attraction
            buildOptionCard(
                context,
                "Chicago Air & Water Show",
                'assets/events/air_water_2.jpg',
                air_waterRoute(),
                "air_waterRoute"),

            const SizedBox(height: 25),

            // Third Attraction
            buildOptionCard(context, "Ribfest Chicago",
                'assets/events/ribfest.jpeg', ribfestRoute(), "ribfestRoute")
          ],
        ),
      ),
    );
  }
}
