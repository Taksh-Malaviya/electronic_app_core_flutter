import 'package:electronic_app/Routs/routs.dart';
import 'package:electronic_app/screens/Hompage/lists/home_page_alll_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _Cart_pageState();
}

class _Cart_pageState extends State<Cartpage> {
  double total = 0;
  double totalDiscount = 0;

  void sumAllProduct() {
    total = 0;
    cart.forEach((e) {
      double discount = e['price'] * e['discountPercentage'] / 100;
      totalDiscount += discount;
      total += (e['price'] - discount) * e['qty'];
    });
  }

  void subAllProduct() {
    total = 0;
    cart.forEach((e) {
      double discount = e['price'] * e['discountPercentage'] / 100;
      totalDiscount -= discount;
      total += (e['price'] - discount) * e['qty'];
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sumAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.of(context).textScaler;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart Page",
          style: TextStyle(
            fontSize: textScaler.scale(18),
          ),
        ),
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
      ),
      body: (cart.isNotEmpty)
          ? Stack(
        children: [
          Column(
            children: [
              ...cart.map(
                    (e) => Slidable(
                  endActionPane: ActionPane(
                    motion: const BehindMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          cart.remove(e);
                          setState(() {});
                        },
                        borderRadius: BorderRadius.circular(12),
                        backgroundColor: const Color(0xfff5d7d9),
                        foregroundColor: Colors.red,
                        icon: Icons.delete,
                      ),
                      SizedBox(
                        width: h * 0.01,
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          Navigator.pushNamed(context, Routes.detail_page, arguments: e);
                        },
                        borderRadius: BorderRadius.circular(12),
                        backgroundColor: Colors.green.withOpacity(0.3),
                        foregroundColor: Colors.green.shade300,
                        icon: Icons.info_outline_rounded,
                      ),
                    ],
                  ),
                  child: Container(
                    height: h * 0.1,
                    width: w,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          height: h * 0.075,
                          width: w * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(e['thumbnail']),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e['name'],
                                  style: TextStyle(
                                    fontSize: textScaler.scale(18),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\$ ${e['price']}".toString(),
                                      style: TextStyle(
                                        fontSize: textScaler.scale(16),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        if (e['qty'] > 1) {
                                          e['qty']--;
                                        } else {
                                          cart.remove(e);
                                        }
                                        subAllProduct();
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: h * 0.04,
                                        width: w * 0.095,
                                        decoration: BoxDecoration(
                                          color:  Colors.grey.shade400,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        child: const Icon(Icons.remove),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w * 0.02,
                                    ),
                                    Text(
                                      "${e['qty']}".toString(),
                                      style: TextStyle(
                                        fontSize: textScaler.scale(18),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: w * 0.02,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (e['stock'] > e['qty']) {
                                          e['qty']++;
                                        }
                                        sumAllProduct();
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: h * 0.04,
                                        width: w * 0.095,
                                        decoration: BoxDecoration(
                                          color: Color(0xfff03D3D3D),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: h * 0.25,
              width: w,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border(
                  top: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Discount",
                        style: TextStyle(
                          fontSize: textScaler.scale(20),
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\$ ${totalDiscount.toString().split('.')[0]}.${totalDiscount.toString().split('.')[1][0]}${totalDiscount.toString().split('.')[1][1]}",
                        style: TextStyle(
                          fontSize: textScaler.scale(20),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Cost",
                        style: TextStyle(
                          fontSize: textScaler.scale(20),
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\$ ${total.toString().split('.')[0]}.${total.toString().split('.')[1][0]}${total.toString().split('.')[1][1]}",
                        style: TextStyle(
                          fontSize: textScaler.scale(20),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      )
          : Center(
        child: Text(
          "You don't add the Data...",
          style: TextStyle(
            fontSize: textScaler.scale(22),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}
