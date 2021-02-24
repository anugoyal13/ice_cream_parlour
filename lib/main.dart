import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> category = ["Candy", "Cone", "Popsicle", "Bar", "Lolly"];
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: ScreenHeight * 0.35,
                    width: ScreenWidth,
                    color: Colors.purpleAccent,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome To",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "IceCream Parlour",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 10),
                        child: Image.asset(
                          "assets/images/icream1.png",
                          height: 130,
                        ),
                      ),
                    ],
                  ),
                  Category(),
                ],
              ),
              Product(),
            ],
          ),
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  List<String> category = ["Candy", "Cone", "Popsicle", "Bar", "Lolly"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 180.0),
      child: Container(
        height: 70,
        child: ListView.builder(
          itemCount: category.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(15)),
                height: 20,
                width: 150,
                child: Center(
                    child: Text(
                  category[index],
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),

                // ),
              ),
            );
          },
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  List<String> product = [
    "Orange Candy",
    "Choco Bar",
    "Frozen yogurt",
    "Kulfi",
    "Falooda",
    "Sorbet",
    "Snow Cream",
    "Rolled Ice cream",
    "Ice Lollies",
    "Sundae"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: product.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => details()),
                  );
                },
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(20),bottomRight:Radius.circular(20),
                  ),
                  ),
                  //color: Colors.purpleAccent,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/pink.png",
                        height: 50,
                      ),
                      Text(
                        product[index],
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
