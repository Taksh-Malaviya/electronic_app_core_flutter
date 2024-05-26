import 'package:flutter/material.dart';

import '../Routs/routs.dart';
import '../screens/Hompage/home_page.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.myRoutes,
    );
  }
}
