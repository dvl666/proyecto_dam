import 'package:dam_firebase/pages/noticia_modelo.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class detalleNoticiaPage extends StatefulWidget {
  final Noticia _noticia;
  const detalleNoticiaPage(this._noticia, {Key? key}) : super(key: key);

  @override
  State<detalleNoticiaPage> createState() => _detalleNoticiaPageState();
}

class _detalleNoticiaPageState extends State<detalleNoticiaPage> {
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
              Icon(
                MdiIcons.ticketConfirmation,
                size: 250,
                color: Colors.green,
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
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: ElevatedButton(
                child: Container(
                  child: Text(
                    "\$ " + widget._noticia.precio.toString(),
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => _popUp(context),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _popUp(BuildContext context) {
    return new AlertDialog(
      title: Row(
        children: [
          Container(
            child: Icon(MdiIcons.cart),
            margin: EdgeInsets.only(right: 25),
          ),
          Text('Comprar Ticket')
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 40),
            child: IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Center(
                child: Icon(
                  MdiIcons.checkCircle,
                  color: Colors.green[600],
                  size: 70,
                ),
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Container(
            child: Text(
              'Close',
            ),
            margin: EdgeInsets.only(right: 100),
          ),
        ),
      ],
    );
  }
}
