import 'dart:ffi';
import 'dart:math';

import 'package:dam_firebase/pages/detalle_compra_page.dart';
import 'package:dam_firebase/pages/noticia_modelo.dart';
import 'package:dam_firebase/pages/noticias_servicios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'detalle_noticia_page.dart';

class noticiasCompraPage extends StatefulWidget {
  noticiasCompraPage({Key? key}) : super(key: key);

  @override
  State<noticiasCompraPage> createState() => _noticiasCompraPageState();
}

class _noticiasCompraPageState extends State<noticiasCompraPage> {
  List<Noticia> _noticias = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNoticia();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      color: Colors.purple[100],
      child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: _noticias.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey.withOpacity(0.6),
              ),
              margin: EdgeInsets.all(3),
              height: 100,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/usm.png",
                    height: 90,
                    width: 150,
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                    endIndent: 10,
                    indent: 10,
                  ),
                  Text(
                    _noticias[index].titulo,
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    _noticias[index].fecha,
                    style: TextStyle(
                        fontSize: 19,
                        color: Color(0xffffda9e),
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton.icon(
                    icon: Icon(MdiIcons.information),
                    label: Text("Info"),
                    style: ButtonStyle(),
                    onPressed: () {
                      setState(() {
                        print(_noticias[index].cod_evento);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                detalleCompraPage(_noticias[index]),
                          ),
                        );
                      });
                    },
                  )
                ],
              ),
            );
          }),
    );
  }

  void getNoticia() async {
    var sigNoticia = await NoticiaServicio().getNoticia();
    setState(() {
      _noticias = sigNoticia;
    });
  }
}
