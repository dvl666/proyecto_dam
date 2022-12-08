import 'dart:ffi';

import 'package:dam_firebase/pages/noticia_modelo.dart';
import 'package:dam_firebase/pages/noticias_servicios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'detalle_noticia_page.dart';
import 'noticia_admin_page.dart';

class noticiasPage extends StatefulWidget {
  noticiasPage({Key? key}) : super(key: key);

  @override
  State<noticiasPage> createState() => _noticiasPageState();
}

class _noticiasPageState extends State<noticiasPage> {
  int _color = 0xFFd54745;
  List<Noticia> _noticias = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNoticia();
  }

  @override
  Widget build(BuildContext context) {
    return _noticias.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _noticias.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.withOpacity(0.6),
                      ),
                      child: ListTile(
                        leading: Icon(
                          MdiIcons.ticketPercent,
                          size: 45,
                          color: Color(0xffff9c72),
                        ),
                        title: Text(_noticias[index].titulo,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        subtitle: Row(
                          children: [
                            Text(
                              "\$ " + _noticias[index].precio.toString(),
                            ),
                            Spacer(),
                            Text(_noticias[index].fecha.toString()),
                            Spacer(),
                            Text(_noticias[index].vigente),
                            Divider(thickness: 2),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            MdiIcons.cart,
                            size: 40,
                            color: Color(getColor(index)),
                          ),
                          onPressed: () {
                            setState(
                              () {
                                print(_noticias[index].cod_evento);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        detalleNoticiaPage(_noticias[index]),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 3,
                      color: Colors.black45,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ],
                ),
              );
            },
          );
  }

  int getColor(int index) {
    if (_noticias[index].vigente.toString() == "SI") {
      return _color = 0xFF00a9e5;
    } else {
      return _color = 0xFFd54745;
    }
  }

  void getNoticia() async {
    var sigNoticia = await NoticiaServicio().getNoticia();
    setState(() {
      _noticias = sigNoticia;
    });
  }
}
