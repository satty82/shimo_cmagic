import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/Subscribe.dart';
import 'package:untitled/orderOnline.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
              "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8&w=1000&q=80",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover),
          Column(
            children: <Widget>[
              Center(
                heightFactor: 2,
                child: Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                        boxShadow:[ BoxShadow(
                          color: Colors.black
                          ,blurRadius: 20.0,)],
                        image: DecorationImage(
                            image: AssetImage("images/logo.png"))
          )),
              ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          boxShadow:[ BoxShadow(
                            color: Colors.black
                            ,blurRadius: 20.0,
                          )]
                      ),
                      child: Card(elevation: 45,
                          margin:const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),),

                    child: ElevatedButton( style: ElevatedButton.styleFrom(
                      minimumSize: const Size( 100, 100)
                    ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const OrderOnline(title: 'Order Online',)));
                      },
                      child: Row(
                        children: const [
                          Text(
                            "Online Order",
                            textScaleFactor: 2,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.redAccent,
                          ),
                        ],),
                    )
                      )),

                    Container(
                     decoration: const BoxDecoration(
                       boxShadow:[ BoxShadow(
                         color: Colors.black
                             ,blurRadius: 20.0,
                       )]
                     ),
                     child: Card(elevation: 15,
                       margin:const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(0.0),),
                         child: ElevatedButton( style: ElevatedButton.styleFrom( minimumSize :
                         const Size(180,200) ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const Subscribe(title: 'Subscribe',)));
                        },
                        child: Row(
                          children: const [
                            Text(
                              "Subscribe",
                              textScaleFactor: 2,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.redAccent,
                            ),
                          ],
                        ))
                    ),
                   )]
          ),
        ],
      ),
    ]));
  }
}

/*body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Stack(
                  children: [
                    Image.network(
                      "https://blogs.biomedcentral.com/on-medicine/wp-content/uploads/sites/6/2019/09/iStock-1131794876.t5d482e40.m800.xtDADj9SvTVFjzuNeGuNUUGY4tm5d6UGU5tkKM0s3iPk-620x342.jpg",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        Padding(padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Container(),
                              const Text(
                                "Login",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ),
                              const Text("Sign Up",
                                  style: TextStyle(color: Colors.white,fontSize: 30))
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 140,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: const [
                                        Text("Online Order"),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.redAccent,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )),
            Expanded(
                child: Stack(
                  children: [
                    Image.network(
                      "https://thumbs.dreamstime.com/b/healthy-food-background-fruits-vegetables-cereal-nuts-superfood-dietary-balanced-vegetarian-eating-products-kitchen-143677456.jpg",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Column(
                        children:[
                          Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: (){},
                                  child: Row(
                                    children: const [
                                      Text("Subscribe"),
                                      Icon(Icons.arrow_forward_ios,
                                        color:Colors.red,)
                                    ],
                                  ),
                                ),
                              )
                          )
                        ]
                    )
                  ],
                )),
          ],
        ),
      ),
    );*/
