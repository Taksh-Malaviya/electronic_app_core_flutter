import 'dart:developer';

import 'package:electronic_app/screens/Hompage/lists/home_page_alll_list.dart';
import 'package:flutter/material.dart';

import '../../Routs/routs.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String cat = "ALL";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category.insert(0, "ALL");
  }

  @override
  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.height;

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Home Page"),
        //   centerTitle: true,
        // ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 41,
                    width: 41,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 3,
                            color: Colors.grey,
                          )
                        ]),
                    child: const Center(
                      child: Icon(
                        Icons.menu,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 41,
                    width: 41,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 3,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.cart_page);
                      },
                      child: const Center(
                        child: Icon(
                          Icons.add_shopping_cart,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 31,
              ),
              Row(
                children: [
                  Text(
                    "Hello Chamudith,",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: textScaler.scale(18),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Let's get something?",
                    style: TextStyle(
                      fontSize: textScaler.scale(11),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: h * 0.18,
                          width: w * 0.38,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xff5A5A5A),
                                Colors.black,
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Apple Watch Series 7\nSmart Watches",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: textScaler.scale(15),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "GET A ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: textScaler.scale(9),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "30%",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: textScaler.scale(9),
                                                 fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  " DISCOUNT ON YOUR\nFIRST ORDER!",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: textScaler.scale(9),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 11, left: 70),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: h * 0.032,
                                            width: w * 0.09,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Get Now",
                                                style: TextStyle(
                                                  fontSize: textScaler.scale(9),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Container(
                          height: h * 0.18,
                          width: w * 0.4,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xff5A5A5A),
                                Colors.black,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: textScaler.scale(15),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 12,
              // ),
              SizedBox(
                height: h * 0.020,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...category.map((e) => Mywidget(context: context, name: e)),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
             Row(
                mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text("Trending Now",style: TextStyle(
                   fontSize: textScaler.scale(15),
                   fontWeight: FontWeight.bold,
                 ),
                 ),
                 SizedBox(width: w * 0.22,),
                 Text("View All",style: TextStyle(
                   fontSize: textScaler.scale(12),
                 ),
                 ),
                 Icon(Icons.arrow_forward_ios_outlined,size: 13),
               ],
             ),
              SizedBox(
                height: h * 0.01,
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...productData.map((e) => Container(
                      height: h * 0.35 ,
                      width: w * 0.2,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0,5),
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child:  Column(
                          children: [
                            Image.network("${e['images2']}"),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: GestureDetector(
                                onTap: (){
                               Navigator.pushNamed(context, Routes.detail_page,arguments: e);
                                  log("Pressed");
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: h * 0.01,
                                    ),
                                    Text(e['description'],style: TextStyle(
                                      fontSize:  textScaler.scale(13),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    SizedBox(height: h * 0.01,),
                                    Row(
                                      children: [
                                        Text(e['brand'],style: TextStyle(
                                      fontSize:  textScaler.scale(14),
                                      fontWeight: FontWeight.w400,
                                    ),
                                        ),
                                      SizedBox(width: w * 0.06,),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: Text("⭐${e['rating']}"),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: h * 0.001,),
                                    Row(
                                      children: [
                                        Text(e['price'].toString(),style: TextStyle(
                                          fontSize:  textScaler.scale(14),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Mywidget({required BuildContext context, required String name}) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        cat = name;
        log("Pressed");
        setState(() {});
      },
      child: Container(
        height: h * 0.042,
        width: w * 0.3,
        margin: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          color: (cat == name) ? Color(0xff3D3D3D) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all()
        ),
        // padding: EdgeInsets.only(left: 18),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: (cat == name)?Colors.white:Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
         ),
      ),
    );
  }
}
