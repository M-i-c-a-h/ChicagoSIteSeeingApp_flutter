import 'package:flutter/material.dart';

import '/screens/events/eventPage.dart';
import '/screens/neighborhoods/neighborhoodPage.dart';
import '/screens/sports/sportsPage.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 50),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
              top: Radius.circular(15),
            ),
            child: AppBar(
              centerTitle: true,
              title: Text(
                'Welcome to Chicago',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              bottom: const TabBar(
                indicatorColor: Colors.amber,
                dividerColor: Colors.grey,
                labelStyle: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                tabs: <Widget>[
                  Tab(
                      text: "NEIGHBORHOODS",
                      icon: Icon(Icons.house_siding_sharp)),
                  Tab(text: "EVENTS", icon: Icon(Icons.event_available_sharp)),
                  Tab(text: "SPORTS", icon: Icon(Icons.sports_football_sharp)),
                ],
              ),
              flexibleSpace: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                  top: Radius.circular(15),
                ),
                child: Image(
                  image: AssetImage('assets/chicago/chi1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        body: Column(
          children: [
            // TabBarView inside an Expanded widget to take up remaining space
            Expanded(
              child: TabBarView(
                children: const <Widget>[
                  NeighboursRoute(), // For NEIGHBORHOODS
                  EventsRoute(), // For EVENTS
                  SportsRoute(), // For SPORTS
                ],
              ),
            ),

            // Any other widgets you want to add
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Explore The Windy City!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
