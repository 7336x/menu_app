import 'package:flutter/material.dart';
import 'models/food.dart'; // Import my Food model

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu App',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Menu',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 236, 60, 60),
        ),
        body: MenuList(), // Call the MenuList widget to display the food items
      ),
    );
  }
}

// Widget to display the list of food items
class MenuList extends StatelessWidget {
  // List of food items created using the Food model
  final List<Food> foodItems = [
    Food(name: 'Pasta', imgPath: 'assets/images/pasta.jpg'),
    Food(name: 'Burger', imgPath: 'assets/images/burger.jpg'),
    Food(name: 'Sushi', imgPath: 'assets/images/suchi.jpg'),
    Food(name: 'Pizza', imgPath: 'assets/images/pizza.jpg'),
    Food(name: 'Biryani', imgPath: 'assets/images/biryani.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of items in each row
        childAspectRatio: 0.75, // Adjust the aspect ratio as needed
      ),
      itemCount: foodItems.length, // Number of items in the list
      itemBuilder: (context, index) {
        final food = foodItems[index]; // Get the food item at the current index
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Rounded corners
          ),
          elevation: 5,
          margin: EdgeInsets.all(10), // Margin around the card
          child: Padding(
            padding: const EdgeInsets.all(10.0), // Padding inside the card
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    food.name, // Display the food name
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10), // Space between text and image
                Image.asset(
                  food.imgPath, // Display the food image
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover, // Maintain aspect ratio
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


