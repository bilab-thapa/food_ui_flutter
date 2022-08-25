import 'package:flutter/material.dart';
import 'package:food_ui/model/food.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Food> food = [
    Food(
      name: ' Chicken Burger',
      price: 120,
      category: 'Burger',
      imageUrl:
          'https://img.freepik.com/free-vector/hamburger-ingredients_98292-3567.jpg?size=338&ext=jpg&ga=GA1.2.1549057794.1653450881',
      description: 'Crunchy Chicken Burger with American cheese and tomato',
    ),
    Food(
      name: 'Chicken Pizza',
      price: 120,
      category: 'Pizza',
      imageUrl:
          'https://img.freepik.com/free-vector/sticker-template-with-pizza-isolated_1308-62307.jpg?size=626&ext=jpg&ga=GA1.2.1549057794.1653450881',
      description: 'Hot Bread with tomato sause and cheese',
    ),
    Food(
      name: 'Strawberry Cake',
      description: 'Sweet and Tasty',
      imageUrl:
          'https://img.freepik.com/free-vector/birthday-cake-sweet-cream-pie-with-candles-illustration_1284-52975.jpg?size=338&ext=jpg&ga=GA1.2.1549057794.1653450881',
      price: 600,
      category: 'Cake',
    ),
    Food(
      name: 'Mixed Noodles',
      description: 'Hot and Spicy Noodles',
      imageUrl:
          'https://img.freepik.com/free-vector/ramen-noodle-egg-meat-with-chopstick-cartoon_138676-2543.jpg?size=338&ext=jpg&ga=GA1.2.1549057794.1653450881',
      price: 600,
      category: 'Noodles',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.list_sharp,
                        size: 30,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.location_on_rounded,
                            color: Colors.red,
                            size: 30,
                          ),
                          Text(
                            'Chicago IIL',
                            style: TextStyle(color: Colors.black, fontSize: 24),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: height * 0.06,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      const Icon(Icons.search),
                      Text('Search our Delicious Burgers',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[600])),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.05),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: food.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: category(food[index]));
                    },
                  ),
                ),
                SizedBox(height: height * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Popular',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.05),
                SizedBox(
                  height: 900,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: food.length,
                    itemBuilder: (context, index) {
                      return foodShow(food[index]);
                    },
                  ),
                ),
                SizedBox(height: height * 0.05),
              ],
            ),
          ),
        ));
  }

  Widget category(Food food) {
    return Container(
        width: 150,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.network(food.imageUrl),
            ),
            const SizedBox(height: 10),
            Text(food.name),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/info',
                  arguments: Food(
                      name: food.name,
                      description: food.description,
                      imageUrl: food.imageUrl,
                      price: food.price,
                      category: food.category),
                );
              },
              icon: Icon(
                Icons.arrow_circle_right_rounded,
                size: 40,
                color: Colors.grey[600],
              ),
            ),
          ],
        ));
  }

  Widget foodShow(Food food) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 110,
              width: 350,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Image.network(
                food.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    food.name,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rs${food.price}',
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  food.category,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
