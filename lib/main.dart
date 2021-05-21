import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_detay.dart';

import 'burc_liste.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      routes: {
        "/": (context) => BurcListesi(),
        "/burcListesi": (context) => BurcListesi(),
        
      },
      onGenerateRoute: (RouteSettings settings) {//tıklanan liste elemanına göre sayfa yönelndirmesi
        List<String> burcsPath = settings.name.split("/");
        if (burcsPath[1] == 'burcDetay') {
          return MaterialPageRoute(builder: (context) => BurcDetay(int.parse(burcsPath[2])));
        }else return null;
      },
      debugShowCheckedModeBanner: false,
      title: "Burç Rehberi",
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}
