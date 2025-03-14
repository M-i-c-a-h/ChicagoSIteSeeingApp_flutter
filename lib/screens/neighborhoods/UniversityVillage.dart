import 'package:flutter/material.dart';

class UniversityVillage extends StatefulWidget {
  const UniversityVillage({super.key});

  @override
  State<UniversityVillage> createState() => _UniversityVillage();
}

class _UniversityVillage extends State<UniversityVillage> {
  int _counter = 0;
  bool showLocation = true;
  String path = "assets/homes/uic.jpg";
  IconData floatingIcon = Icons.swap_horiz;

  String info =
      "University Village/Little Italy is a union of two separate communities "
      "(The University of Illinois Chicago campus and Little Italy)"
      " that have merged as one, bringing the best of both worlds to a single Chicago"
      " neighborhood.";

  List<String> paths = ["assets/homes/uic.jpg", "assets/homes/uic_2.jpg"];

  List<String> data = [
    "University Village/Little Italy is a union of two separate communities "
        "(The University of Illinois Chicago campus and Little Italy)"
        " that have merged as one, bringing the best of both worlds to a single Chicago"
        " neighborhood.",
    "Historic Little Italy, a hub for the city’s Italian-American community, is known "
        "for its Italian restaurants, bakeries, and delis on buzzing Taylor Street."
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
        title: const Text('University Village'),
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
              tag: "universityVillageRoute",
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
                      "University Village",
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
                                      " Little Italy Chicago",
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
