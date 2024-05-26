
import 'dart:developer';

import 'package:flutter/material.dart';

import '../Hompage/lists/home_page_alll_list.dart';

class Detail_page extends StatefulWidget {
  const Detail_page({super.key});

  @override
  State<Detail_page> createState() => _Detail_pageState();
}

class _Detail_pageState extends State<Detail_page> {
  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> pro = ModalRoute.of(context)!.settings.arguments as  Map<String,dynamic>;
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.height;

    return SafeArea(
      child: Scaffold(
        
          body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
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
                              ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                            ),
                          ),
                        ),
                      ),
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
                            ]
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.favorite_border,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.03),
                  Image.network(pro['images2']),
                  SizedBox(height: h * 0.03),
                  Column(children: [
                    Text("DESCRIPTION",style: TextStyle(fontSize: textScaler.scale(16),
                    fontWeight: FontWeight.bold),),
                  ],),
                  Divider(),
                  //SizedBox(height: h * 0.02),
                  Column(
                    children: [
                      Text(pro['description'],style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: textScaler.scale(13),
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.03,),
                  Text("Price        :   ${pro['price']}".toString(),style: TextStyle(
                      fontSize: textScaler.scale(16),
                      fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: h * 0.03,),
                  Text("Ratigs      :   ⭐ ${pro['rating']}".toString(),style: TextStyle(
                      fontSize: textScaler.scale(16),
                      fontWeight: FontWeight.bold
                  )
                  ),
                  SizedBox(height: h * 0.03,),
                  Text("Brand       :   ${pro['brand']}",style: TextStyle(
                      fontSize: textScaler.scale(16),
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: h * 0.03,),
                  GestureDetector(
                    onTap: (){
                      if (!cart.contains(pro)) {
                        cart.add(pro);
                        log("cart added");
                      }
                    },
                    child: Container(
                      height: h * 0.08,
                      width: w ,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff222222),
                            Color(0xff595959),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_shopping_cart,
                              color: Colors.white,
                            ),
                            SizedBox(width: w * 0.03),
                            Text("Add to cart",style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: textScaler.scale(16),
                            ),
                            ),
                           SizedBox(width: w * 0.04),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text("|",style: TextStyle(color: Colors.grey,
                                  fontSize: textScaler.scale(50),
                                  fontWeight: FontWeight.w100),),
                            ),
                            SizedBox(width: w * 0.06),
                            Text('\$ ${pro['price']}'.toString(),style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: textScaler.scale(16)),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
              ),
          ),
    );
    }
}
