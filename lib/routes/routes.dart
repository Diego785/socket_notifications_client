import 'package:flutter/material.dart';
import 'package:socket_notifications/pages/home_page.dart';
import 'package:socket_notifications/pages/productos_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => HomePage(),
  'products': (_) => ProductsPage(),
};
