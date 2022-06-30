import 'package:ecomerce/pages/cart.dart';
import 'package:ecomerce/pages/cart_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Shoping Cart"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartPage()));
                        },
                      ),
                      (Cart().getList().length > 0)
                          ? Positioned(
                              top: 5,
                              right: 5,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                        Cart().getList().length.toString()),
                                  )),
                            )
                          : Text("")
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Center(
                        child: Text(
                      "SignIn",
                      style: TextStyle(fontSize: 20),
                    )),
                  )
                ],
              ),
            )
          ],
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.green, width: 1)),
              height: 220,
              child: Image.network(
                "https://image.shutterstock.com/image-photo/oxford-university_the-queens-college-260nw-299633474.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Top courses",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      child: Card(
                        child: Stack(
                          children: [
                            //Image.network("https://www.tutorix.com/images/class_7_blood_and_blood_vessels.jpg"),
                            Image.network(
                                "https://www.tutorialspoint.com/videotutorials/assets/videos/courses/173/images/course_173_image.png"),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  //Text("Product Name",style: TextStyle(color: Colors.green,fontWeight:  FontWeight.bold,fontSize: 20),),
                                  FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        print(Cart().getList().length);
                                        Cart().addCart(index);
                                      });
                                    },
                                    child: Text(
                                      "Add To Cart",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Colors.green,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Video courses",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.black26, width: 2)),
              height: 220,
              child: Image.network(
                "https://www.tutorialspoint.com/videotutorials/assets/videos/courses/525/images/course_525_image.jpg",
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Popular courses",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          child: Stack(
                            children: [
                              //Image.network("https://www.tutorix.com/images/class_7_blood_and_blood_vessels.jpg"),
                              Image.network(
                                "https://www.tutorialspoint.com/videotutorials/assets/videos/courses/174/images/course_174_image.png",
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // Text("Product Name",style: TextStyle(color: Colors.green,fontWeight:  FontWeight.bold,fontSize: 20),),
                                    FlatButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Add To Cart",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Colors.green,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Popular courses",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          child: Stack(
                            children: [
                              //Image.network("https://www.tutorix.com/images/class_7_blood_and_blood_vessels.jpg"),
                              Image.network(
                                "https://www.tutorialspoint.com/videotutorials/assets/videos/courses/174/images/course_174_image.png",
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // Text("Product Name",style: TextStyle(color: Colors.green,fontWeight:  FontWeight.bold,fontSize: 20),),
                                    FlatButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Add To Cart",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Colors.green,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.

        );
  }
}
