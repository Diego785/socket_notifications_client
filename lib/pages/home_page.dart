import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_notifications/services/socket_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SocketService socketService;

  @override
  void initState() {
    super.initState();

    socketService = Provider.of<SocketService>(context, listen: false);
    socketService.connect();
  }

  @override
  Widget build(BuildContext context) {
    socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              socketService.serverStatus == ServerStatus.Online
                  ? Icon(Icons.check_circle, color: Colors.blue[400], size: 70)
                  : const Icon(Icons.offline_bolt, color: Colors.red, size: 70),
              /*Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                margin: EdgeInsets.only(top: 400, right: 90, left: 90),
                decoration: BoxDecoration(
                  color: (socketService.serverStatus == ServerStatus.Online)? 
                  Colors.red[900]: Colors.green[500],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: (socketService.serverStatus == ServerStatus.Online)?
                       const Text(
                        "Desconectar Socket!!!",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ): const Text(
                        "Conectar Socket!!!",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ),
                      trailing:(socketService.serverStatus == ServerStatus.Online)

                      ?Icon(
                        Icons.offline_bolt,
                        color: Colors.yellow[600],
                      ): Icon(
                        Icons.check_circle,
                        color: Colors.white,
                      ),
                      onTap: () {
                        if (socketService.serverStatus == ServerStatus.Online) {
                          socketService.disconenct();
                        } else {
                          socketService.connect();
                        }
                      },
                    ),
                    ListTile(
                      title:
                       const Text(
                        "Ver Productos",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 28, 28, 28),
                            fontStyle: FontStyle.italic),
                      ),
                      trailing:Icon(
                        Icons.visibility,
                        color: Colors.white,
                      ),
                      onTap: () {
                        if (socketService.serverStatus == ServerStatus.Online) {
                          socketService.disconenct();
                        } else {
                          socketService.connect();
                        }
                      },
                    ),
                  ],
                ),
              ),*/
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                margin: EdgeInsets.only(top: 200, right: 90, left: 90),
                decoration: BoxDecoration(
                  color: (socketService.serverStatus == ServerStatus.Online)
                      ? Colors.red[900]
                      : Colors.green[500],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  title: (socketService.serverStatus == ServerStatus.Online)
                      ? const Text(
                          "Desconectar Socket!!!",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontStyle: FontStyle.italic),
                        )
                      : const Text(
                          "Conectar Socket!!!",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontStyle: FontStyle.italic),
                        ),
                  trailing: (socketService.serverStatus == ServerStatus.Online)
                      ? Icon(
                          Icons.offline_bolt,
                          color: Colors.yellow[600],
                        )
                      : Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                  onTap: () {
                    if (socketService.serverStatus == ServerStatus.Online) {
                      socketService.disconenct();
                    } else {
                      socketService.connect();
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                margin: EdgeInsets.only(top: 50, right: 90, left: 90),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  title: const Text(
                    "Ver Productos",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                  trailing: Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ),
                  onTap: () {
                    
                    Navigator.pushNamed(context, 'products');
                    
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
