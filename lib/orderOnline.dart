import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/model/items.dart';

class OrderOnline extends StatefulWidget {
  const OrderOnline({Key key, String title}) : super(key: key);

  @override
  _OrderOnlineState createState() => _OrderOnlineState();
}

class _OrderOnlineState extends State<OrderOnline> {
  List<Items> items = Items.items;
  final controller = CarouselController();
  int activeIndex = 0;
  final urlimages = [
    'https://media.istockphoto.com/photos/chickpea-hummus-bowl-closeup-with-pita-flatbread-dipping-isolated-on-picture-id1323443868?b=1&k=20&m=1323443868&s=170667a&w=0&h=eijZOSiIh50JRokQIzG_E-vxXd1Tf5BxA_PRHsHIdeY=',
    'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MzF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://media.istockphoto.com/photos/thanksgiving-party-table-setting-traditional-holiday-stuffed-turkey-picture-id1268544544?b=1&k=20&m=1268544544&s=170667a&w=0&h=J5F56fvQ8jeuUG4HRs3Ngj0g6JBooX0pCq8UVMMKMf4=',
    'https://media.istockphoto.com/photos/food-with-high-content-of-healthy-fats-overhead-view-picture-id1301749611?b=1&k=20&m=1301749611&s=170667a&w=0&h=eq5fEvI0VwPJh1Sq6kJXKNLLxi_yuFcK_tFiepk_iVM=',
    'https://media.istockphoto.com/photos/hot-dogs-for-game-day-picture-id1326146587?b=1&k=20&m=1326146587&s=170667a&w=0&h=PXRYyxj4ZN5HXPzQIRG8t5a-B4Np0z-vqVWlRYDQ7g4=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(
              // for scrolling bouncing effect
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 12),
                  Row(children: const [
                    SizedBox(width: 5),
                    Icon(Icons.thumb_up, color: Colors.black),
                    SizedBox(width: 5),
                    Text(
                      "Top picks for you ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600, // light
                          fontStyle: FontStyle.normal),
                    )
                  ]),
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Container(
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: CarouselSlider.builder(
                        carouselController: controller,
                        options: CarouselOptions(
                            height: 150,
                            autoPlay: true,
                            onPageChanged: (index, reason) =>
                                setState(() => activeIndex = index),
                            // enlargeStrategy: CenterPageEnlargeStrategy.height,
                            autoPlayInterval: Duration(seconds: 2)),
                        itemCount: urlimages.length,
                        itemBuilder: (context, index, realIndex) {
                          final urlImage = urlimages[index];
                          return buildImage(urlImage, index);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  buildIndicator(),
                  const Divider(
                    height: 15,
                    color: Colors.black12,
                    thickness: 5,
                  ),
                  const SizedBox(height: 2),
                  Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(children: const [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.tag, color: Colors.black),
                          Text(
                            "Top Categories ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600, // light
                                fontStyle: FontStyle.normal),
                          ),
                        ]),
                      ]),
                  Container(
                    height: 280,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildTopCategories(items[index]);
                      },
                    ),
                  ),
                  const Divider(
                    height: 15,
                    color: Colors.black12,
                    thickness: 5,
                  ),
                  const SizedBox(height: 5),
                  resturantName(),
                  const SizedBox(
                    height: 5,
                  ),
                  describe(),
                ])));
  }

  Widget buildImage(String urlImage, int index) =>
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            image: DecorationImage(
                image: NetworkImage(
                  urlImage,
                ))),
      );

  Widget buildIndicator() =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: urlimages.length,
          effect: const ScrollingDotsEffect(
              dotColor: Colors.black26, dotWidth: 6, dotHeight: 6),
        )
      ]);

  void next() => controller.nextPage();

  void previous() => controller.previousPage();

  resturantName() =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: const [
            SizedBox(
              width: 10,
            ),
            Icon(Icons.fastfood_rounded, color: Colors.black),
            SizedBox(width: 5),
            Text(
              "Restaurants",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w600, // light
                  fontStyle: FontStyle.normal),
            ),
          ]),
        ],
      );

  describe() =>
      SizedBox(
        height: 300,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 1, crossAxisCount: 1),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return buildTopResturants(items[index]);
          },
        ),
      );

  Widget buildTopCategories(Items item) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          height: 95,
          decoration: BoxDecoration(
              border: Border.all(width: 1.2, color: Colors.red),
              shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(item.itemImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          item.itemName,
          style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w800, // light
              fontStyle: FontStyle.normal),
        ),
      ],
    );
  }

  // Resturants
  Widget buildTopResturants(Items item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                      border: Border.all(width: 0.5, color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25)),
                          image: DecorationImage(
                            image: NetworkImage(item.itemImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children:  [
                        SizedBox(width: 12),
                        const Text(
                          "Fassos",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w800, // light
                              fontStyle: FontStyle.normal),
                        ),
                        SizedBox(width: 155),
                        Container(
                          padding: EdgeInsets.all(2) ,
                          child :
                            Row(
                              children:const [
                            Text(
                              "3.9",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800, // light
                                  fontStyle: FontStyle.normal),
                            ),
                              Icon(Icons.star_rate_sharp, color: Colors.yellowAccent),

                            ],),
                        ),
                      ],
                    ),
                    Container(
                      child:Row(
                        children:const [
                    SizedBox(width: 15),
                    Text(
                      "Fries, Burger, Biryani ..",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w400, // light
                          fontStyle: FontStyle.normal),
                    )
                          ])),
                  ],
                ),
            ]
            ),
          ),
        ),
    ));
  }
}
