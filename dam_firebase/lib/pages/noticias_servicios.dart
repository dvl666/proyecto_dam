import 'package:dam_firebase/pages/noticia_modelo.dart';

class NoticiaServicio {
  static List<Noticia> noticias = [
    Noticia(
        1,
        "Bad Bunny En Chile",
        250000,
        "SI",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod elementum nisi quis eleifend quam.",
        "03-30-2001"),
    Noticia(
        2,
        "Cachureo En Chile",
        0,
        "NO",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod elementum nisi quis eleifend quam.",
        "11-16-2000"),
    Noticia(
        3,
        "Slipknot En Chile",
        500000,
        "SI",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod elementum nisi quis eleifend quam.",
        "03-30-2001"),
    Noticia(
        1,
        "Bad Bunny En Chile",
        250000,
        "SI",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod elementum nisi quis eleifend quam.",
        "03-30-2001"),
    Noticia(
        2,
        "Cachureo En Chile",
        0,
        "NO",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod elementum nisi quis eleifend quam.",
        "11-16-2000"),
    Noticia(
        3,
        "Slipknot En Chile",
        500000,
        "SI",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod elementum nisi quis eleifend quam.",
        "03-30-2001"),
    Noticia(
        1,
        "Bad Bunny En Chile",
        250000,
        "SI",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod elementum nisi quis eleifend quam.",
        "03-30-2001"),
    Noticia(
        2,
        "Cachureo En Chile",
        0,
        "NO",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod elementum nisi quis eleifend quam.",
        "11-16-2000"),
    Noticia(
        3,
        "Slipknot En Chile",
        500000,
        "SI",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod elementum nisi quis eleifend quam.",
        "03-30-2001"),
  ];

  Future<List<Noticia>> getNoticia() async {
    //
    return Future.value(noticias.sublist(0, 9));
  }
}
