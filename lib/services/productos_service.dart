import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:socket_notifications/global/environment.dart';
import 'package:socket_notifications/models/specific-products.dart';
import 'package:socket_notifications/models/producto.dart';

class ProductsService with ChangeNotifier {
  Future<List<Product>> getProducts() async {
    try {
      final uri = Uri.parse('${Environment.apiUrl}/productos');
      final resp =
          await http.get(uri, headers: {'Content-Type': 'application/json'});

      final productResponse = productosResponseFromJson(resp.body);
      return productResponse.myProducts;
    } catch (error) {
      return [];
    }
  }

  Future<List<SpecificProduct>> getProductwithExpirationDate() async {
    try {
      final uri =
          Uri.parse('${Environment.apiUrl}/productos/specific-products');
      final resp =
          await http.get(uri, headers: {'Content-Type': 'application/json'});

      final productResponse = specificProductosResponseFromJson(resp.body);
      return productResponse.myProducts;
    } catch (error) {
      return [];
    }
  }
}
