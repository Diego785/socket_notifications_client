import 'dart:io';

class Environment {
  static String apiUrl = Platform.isAndroid ? 'https://sockets-notifications-backend-production.up.railway.app/api' : 'http://localhost:3000/api';
  static String socketUrl = Platform.isAndroid ? 'https://sockets-notifications-backend-production.up.railway.app/' : 'http://localhost:3000';
}