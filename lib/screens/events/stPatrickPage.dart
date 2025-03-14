import 'package:flutter/material.dart';

class StPatrickRoute extends StatefulWidget {
  const StPatrickRoute({super.key});

  @override
  State<StPatrickRoute> createState() => _StPatrickRouteState();
}

class _StPatrickRouteState extends State<StPatrickRoute> {
  int _counter = 0;
  bool showLocation = true;
  String path = "assets/events/st_p.png";
  IconData floatingIcon = Icons.swap_horiz;

  String info =
      "St. Patrick’s Day is a festival in Chicago that draws thousands of attendees annually "
      "to celebrate Irish heritage with festive music, dance, and vibrant displays.";

  List<String> paths = ["assets/events/st_p.png", "assets/events/st_p_2.jpg"];

  List<String> data = [
    "St. Patrick’s Day is a festival in Chicago that draws thousands of attendees annually "
        "to celebrate Irish heritage with festive music, dance, and vibrant displays.",
    "Chicago’s St. Patrick’s Day history stretches back more than 175 years."
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
        title: const Text('Chicago St. Patrick\'s Day'),
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
              tag: "StPatrickRoute",
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
                      "Chicago St. Patrick's Day",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
                            color: Colors.green,
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
                                      " Upper Wacker Drive",
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
