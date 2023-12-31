// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jeena/models/product_model.dart';
import 'package:jeena/widgets/home_title.dart';
import 'package:jeena/widgets/plant_cards.dart';
import 'package:jeena/widgets/plant_category.dart';
import 'package:jeena/widgets/popular_plants.dart';
import 'package:jeena/widgets/search_plant.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  static List<Map<String, dynamic>> categories = [
    {"id": 1, "name": "All"},
    {"id": 2, "name": "Indoor"},
    {"id": 3, "name": "Outdoor"},
    {"id": 4, "name": "Aromatic"},
    {"id": 5, "name": "succulent"},
  ];

  List<ProductModel> products = [
    ProductModel(
        productName: "Hibiscus",
        productImage:
            "https://img.freepik.com/premium-photo/photo-green-plants-pot-with-dark-green-background_455711-607.jpg",
        category: "Indoor",
        isFav: true,
        price: 44.99),
    ProductModel(
        productName: "Red Amaryllis",
        productImage:
            "https://static.vecteezy.com/system/resources/previews/027/534/786/large_2x/3d-realistic-green-plant-in-pot-on-a-dark-background-generative-ai-ai-generated-free-photo.jpeg",
        category: "Outdoor",
        isFav: true,
        price: 60),
    ProductModel(
        productName: "Pink Anthurium",
        productImage:
            "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1653590696-the-sill-pink-anthurium-1653590676.png?crop=1.00xw:0.771xh;0,0.0451xh&resize=980:*",
        category: "Indoor",
        isFav: false,
        price: 38),
    ProductModel(
        productName: "Orchid",
        productImage:
            "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1673638507-158057l3x-1673638490.jpg?crop=1xw:0.9128978224455612xh;center,top&resize=980:*",
        category: "Outdoor",
        isFav: false,
        price: 110),
    ProductModel(
        productName: "Bromeliad",
        productImage:
            "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1673639148-e76df4c1d74d3e8593cb5a48e8bed7abe84ecf18-1200x1553.jpg?crop=1.00xw:0.774xh;0,0.0628xh&resize=980:*",
        category: "Indoor",
        isFav: true,
        price: 38),
    ProductModel(
        productName: "Hibiscus",
        productImage:
            "https://img.freepik.com/premium-photo/photo-green-plants-pot-with-dark-green-background_455711-607.jpg",
        category: "Aromatic",
        isFav: true,
        price: 44.99),
    ProductModel(
        productName: "Red Amaryllis",
        productImage:
            "https://static.vecteezy.com/system/resources/previews/027/534/786/large_2x/3d-realistic-green-plant-in-pot-on-a-dark-background-generative-ai-ai-generated-free-photo.jpeg",
        category: "Aromatic",
        isFav: true,
        price: 60),
    ProductModel(
        productName: "Pink Anthurium",
        productImage:
            "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1653590696-the-sill-pink-anthurium-1653590676.png?crop=1.00xw:0.771xh;0,0.0451xh&resize=980:*",
        category: "succulent",
        isFav: false,
        price: 38),
    ProductModel(
        productName: "Orchid",
        productImage:
            "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1673638507-158057l3x-1673638490.jpg?crop=1xw:0.9128978224455612xh;center,top&resize=980:*",
        category: "Outdoor",
        isFav: false,
        price: 110),
    ProductModel(
        productName: "Bromeliad",
        productImage:
            "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1673639148-e76df4c1d74d3e8593cb5a48e8bed7abe84ecf18-1200x1553.jpg?crop=1.00xw:0.774xh;0,0.0628xh&resize=980:*",
        category: "succulent",
        isFav: true,
        price: 38),
  ];

  Map<String, dynamic> selectedCategory = categories.first;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
          homeTitle(context),
          SizedBox(
            height: deviceHeight * 0.03,
          ),
          searchPlant(context, deviceWidth),
          SizedBox(
            height: deviceHeight * 0.025,
          ),
          plantCategory(
              context: context,
              deviceHeight: deviceHeight,
              categories: categories,
              selectedCategory: selectedCategory,
              onClick: (Map<String, dynamic> category) {
                setState(() {
                  selectedCategory = category;
                });
              }),
          SizedBox(
            height: deviceHeight * 0.025,
          ),
          plantCards(deviceHeight, deviceWidth, products, (int index) {
            setState(() {
              products[index].isFav = !products[index].isFav;
            });
          }, selectedCategory['name']),
          SizedBox(
            height: deviceHeight * 0.025,
          ),
          Text(
            'Popular',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          popularPlants(deviceHeight, deviceWidth, products),
          SizedBox(
            height: deviceHeight * 0.025,
          ),
          Text(
            'Best Deals',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          popularPlants(deviceHeight, deviceWidth, products),
        ],
      ),
    ));
  }
}
