import 'package:flutter/material.dart';

// Reusable function to create an attraction card
Widget buildOptionCard(BuildContext context, String title, String imagePath,
    Widget route, String heroTag) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => route),
      );
    },
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(2, 2), // Soft shadow
          ),
        ],
      ),
      width: double.infinity,
      // Makes the container responsive
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      // Adds side spacing
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Clickable Round Image
          Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: ClipOval(
                child: Hero(
                  tag: heroTag,
                  child: Image.asset(
                    imagePath, // Use dynamic image path
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              )),

          const SizedBox(width: 15), // Space between image and text

          // Attraction Name
          Expanded(
            child: Text(
              title, // Use dynamic title
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
