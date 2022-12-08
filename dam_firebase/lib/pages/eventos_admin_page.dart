import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dam_firebase/pages/eventos_page.dart';
import 'package:dam_firebase/pages/login_page.dart';
import 'package:dam_firebase/pages/noticia_admin_page.dart';
import 'package:dam_firebase/pages/noticias_compra_page.dart';
import 'package:dam_firebase/pages/noticias_page.dart';
import 'package:dam_firebase/servicios/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class eventosadminPage extends StatelessWidget {
  const eventosadminPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const BottomNav(),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int indexSel = 0;
  final bool _admin = false;

  static List<Widget> paginas = [
    noticiasPage(),
    noticiasCompraPage(),
    noticiaAdminPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Text("USM Eventos"),
          Spacer(),
        ]),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.account_circle),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'about',
                child: Text('About Ejemplo Firebase'),
              ),
              PopupMenuItem(
                value: 'logout',
                child: Text('Cerrar Sesión'),
              ),
            ],
            onSelected: (opcionSeleccionada) {
              if (opcionSeleccionada == 'logout') {
                logout(context);
              }
            },
          ),
        ],
        leading: Icon(MdiIcons.book),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple[300],
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.newspaper,
              color: Colors.white,
            ),
            label: "Eventos",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.ticket,
              color: Colors.white,
            ),
            label: "Tickets",
          ),
          agregarNoticia(_admin),
        ],
        currentIndex: indexSel,
        onTap: pagSel,
      ),
      body: StreamBuilder(
        stream: FirestoreService().eventos(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var evento = snapshot.data!.docs[index];
              //print('PRODUCTO:' + producto.data().toString());
              return ListTile(
                leading: Icon(
                  MdiIcons.cube,
                  color: Colors.deepPurple,
                ),
                title: Text(evento['nombre']),
                subtitle: Text('Precio:${evento['precio'].toString()}'),
                trailing: OutlinedButton(
                  child: Text('Borrar'),
                  onPressed: () {
                    FirestoreService().borrar(evento.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => eventosPage(),
          );
          Navigator.push(context, route).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }

  void pagSel(int index) {
    setState(() {
      indexSel = index;
    });
  }

  BottomNavigationBarItem agregarNoticia(bool admin) {
    if (_admin == true) {
      return BottomNavigationBarItem(
        icon: Icon(
          MdiIcons.book,
          color: Colors.white,
        ),
        label: "Agregar Noticia",
      );
    } else {
      return BottomNavigationBarItem(
        icon: Icon(MdiIcons.cancel),
        label: "Blocked",
      );
    }
  }
}

Future<String> getUser() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  return sp.getString('user') ?? '';
}

void logout(BuildContext context) async {
  //cerrar sesion en firebase
  await FirebaseAuth.instance.signOut();

  //borrar user email de shared preferences
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.remove('user');

  //redirigir al login
  MaterialPageRoute route =
      MaterialPageRoute(builder: ((context) => LoginPage()));
  Navigator.pushReplacement(context, route);
}
