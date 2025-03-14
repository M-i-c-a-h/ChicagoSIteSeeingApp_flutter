import 'package:flutter/material.dart';

class WestLoopRoute extends StatefulWidget {
  const WestLoopRoute({super.key});

  @override
  State<WestLoopRoute> createState() => _WestLoopRoute();
}

class _WestLoopRoute extends State<WestLoopRoute> {
  int _counter = 0;
  bool showLocation = true;
  String path = "assets/homes/wloop_1.jpeg";
  IconData floatingIcon = Icons.swap_horiz;

  String info =
      "The West Loop is a foodie mecca. An explosion of excellent eateries has taken over "
      "this former industrial area, turning the historic warehouses into some of the "
      "city’s hottest restaurants.";

  List<String> paths = [
    "assets/homes/wloop_1.jpeg",
    "assets/homes/wloop_2.jpg"
  ];

  List<String> data = [
    "The West Loop is a foodie mecca. An explosion of excellent eateries has taken over "
        "this former industrial area, turning the historic warehouses into some of the "
        "city’s hottest restaurants.",
    "Also known as \"The Bean\", Millennium Park’s Cloud Gate sculpture is Chicago's most "
        "recognizable, and often photographed, pieces of public art since its installation"
        " in 2006."
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
        title: const Text('Chicago West Loop'),
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
              tag: "westLoopRoute",
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
                      "Chicago West Loop",
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
                                      " West Loop Chicago",
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
