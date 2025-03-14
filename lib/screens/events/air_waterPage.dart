import 'package:flutter/material.dart';

class air_waterRoute extends StatefulWidget {
  const air_waterRoute({super.key});

  @override
  State<air_waterRoute> createState() => _air_waterRouteState();
}

class _air_waterRouteState extends State<air_waterRoute> {
  int _counter = 0;
  bool showLocation = true;
  String path = "assets/events/air_water_2.jpg";
  IconData floatingIcon = Icons.swap_horiz;

  String info =
      "The Chicago Air & Water Show is a free, annual air and water exhibition held "
      "along Lake Michigan, showcasing aerial and water demonstrations, including pilots,"
      " parachute teams, and formation jet flyers, with the U.S. Navy Blue Angels and U.S. "
      "Army Parachute Team Golden Knights as headliners.";

  List<String> paths = [
    "assets/events/air_water_2.jpg",
    "assets/events/air_water.jpg"
  ];

  List<String> data = [
    "The Chicago Air & Water Show is a free, annual air and water exhibition held "
        "along Lake Michigan, showcasing aerial and water demonstrations, including pilots,"
        " parachute teams, and formation jet flyers, with the U.S. Navy Blue Angels and U.S. "
        "Army Parachute Team Golden Knights as headliners.",
    "Starting in the summer of 1959, the Chicago Air and Water Show has grown to be the "
        "largest and oldest free admission air and water exhibition in the United States."
  ];
  List<IconData> icons = [Icons.swap_horiz, Icons.fact_check_sharp];

  onButtonPressed() {
    setState(() {
      if (_counter % 2 == 0) {
        path = paths[0];
        floatingIcon = icons[0];
        info = data[0];
      } else {
        path = paths[1];
        floatingIcon = icons[1];
        info = data[1];
      }
      showLocation = !showLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chicago Air & Water Show'),
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
      ),
      body: Column(
        children: [
          const SizedBox(height: 10), // Spacing between items

          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Hero(
              tag: "air_waterRoute",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                // Optional rounded corners
                child: Container(
                  width: double.infinity,
                  // Ensures it stretches to parent width
                  constraints: const BoxConstraints(
                    maxHeight: 200, // Adjust max height to prevent overflow
                    maxWidth: 400,
                  ),
                  child: Image.asset(
                    path,
                    fit: BoxFit.cover, // Scales the image without overflow
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 560,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.black12,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                  top: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // Aligns all children to the left
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Chicago Air & Water Show",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),

                  const SizedBox(height: 10), // Spacing between items

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Align text to the left
                      children: [
                        !showLocation
                            ? Text(
                                "Did you know?",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  wordSpacing: 5,
                                  height:
                                      1.5, // Line height for better readability
                                ),
                              )
                            : const SizedBox(),
                        Text(
                          info,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            wordSpacing: 5,
                            height: 1.5, // Line height for better readability
                          ),
                        ),
                        showLocation
                            ? Column(children: [
                                const SizedBox(height: 115),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.location_on_sharp),
                                    const SizedBox(height: 10),
                                    Text(
                                      " North Avenue Beach",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        wordSpacing: 5,
                                      ),
                                    ),
                                  ],
                                ),
                              ])
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter++;
          onButtonPressed();
        },
        tooltip: 'fact',
        child: Icon(floatingIcon),
      ),
    );
  }
}
