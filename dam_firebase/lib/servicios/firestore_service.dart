import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //obtener los productos
  Stream<QuerySnapshot> eventos() {
    return FirebaseFirestore.instance.collection('eventos').snapshots();
    //int limite = 10;
    //return FirebaseFirestore.instance.collection('productos').where('stock', isLessThan: limite).snapshots();
  }

  //agregar
  Future agregar(int id, String nombre, int precio, String descripcion,
      bool estado, String fecha) {
    return FirebaseFirestore.instance.collection('eventos').doc().set({
      'id': id,
      'nombre': nombre,
      'precio': precio,
      'estado': estado,
      'descripcion': descripcion,
      'fecha': fecha
    });
  }

  //borrar
  Future borrar(String id) {
    return FirebaseFirestore.instance.collection('eventos').doc(id).delete();
  }
}
