import 'package:dam_firebase/pages/noticia_modelo.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:dam_firebase/pages/home_page.dart';

class detalleCompraPage extends StatefulWidget {
  final Noticia _noticia;
  const detalleCompraPage(this._noticia, {Key? key}) : super(key: key);

  @override
  State<detalleCompraPage> createState() => _detalleCompraPageState();
}

class _detalleCompraPageState extends State<detalleCompraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: [
              Container(
                child: Icon(MdiIcons.newspaper),
                margin: EdgeInsets.only(right: 10),
              ),
              Text(widget._noticia.titulo),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [
              QrImage(
                data: "a http://www.usmentradas.cl/" +
                    widget._noticia.cod_evento.toString(),
                size: 250,
              ),
              Text(
                widget._noticia.fecha.toString(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                widget._noticia.vigente,
                style: TextStyle(color: Colors.blue, fontSize: 20),
              )
            ]),
            Column(
              children: [
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(widget._noticia.detalle),
                ),
              ],
            ),
            Divider(),
            Text("Codigo de entrada"),
            Text(
              widget._noticia.cod_evento.toString(),
              style: TextStyle(fontSize: 30),
            ),
            Divider(),
            Text("Nombre De Usuario"),
            Text(
              "´´Pepito Perez´´",
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
