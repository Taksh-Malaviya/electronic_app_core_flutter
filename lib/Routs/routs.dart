
import 'package:electronic_app/screens/Detail_page/detail_page.dart';
import 'package:flutter/material.dart';

import '../screens/Hompage/home_page.dart';
import '../screens/cart/cart_page.dart';

class Routes {
  static String home_page = '/';
  static String detail_page = 'detail_page';
  static String cart_page = 'cart_page';


  static Map<String, WidgetBuilder> myRoutes = {
    home_page: (context) => const Homepage(),
    detail_page: (context) => const Detail_page(),
    cart_page: (context) => const Cartpage(),
  };
}