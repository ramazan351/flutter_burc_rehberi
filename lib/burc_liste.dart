import 'package:flutter/material.dart';

import 'models/burc.dart';
import 'utils/strings.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar = veriKaynaginiHazirla();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Listesi"),
      ),
      body: ListeyiHazirla(),
    );
  }
}

Widget ListeyiHazirla() {
  return ListView.builder(
      itemCount: Strings.BURC_ADLARI.length - 1,
      itemBuilder: (context, index) => tekSatirBurc(context, index));
}

Widget tekSatirBurc(BuildContext buildContext, int index) {
  return Card(
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: ()=> Navigator.pushNamed(buildContext, "/burcDetay/$index"),
        leading: Image.asset(
          "images/" + BurcListesi.tumBurclar[index].burcKucukResim,
          width: 64,
          height: 64,
        ),
        title: Text(
          BurcListesi.tumBurclar[index].burcAdi,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w400, color: Colors.pink[500]),
        ),
        subtitle: Text(
          BurcListesi.tumBurclar[index].burcTarihi,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.pink[700]),
        ),trailing: Icon(Icons.arrow_forward_ios,color: Colors.pink,),
      ),
    ),
  );
}

List<Burc> veriKaynaginiHazirla() {
  List<Burc> burcListeElemani = [];
  String kucukResim;
  String buyukResim;
  for (int i = 0; i <= Strings.BURC_ADLARI.length - 1; i++) {
    kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
    buyukResim = Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk${i + 1}.png";
    burcListeElemani.add(Burc(Strings.BURC_ADLARI[i], Strings.BURC_TARIHLERI[i],
        Strings.BURC_GENEL_OZELLIKLERI[i], kucukResim, buyukResim));
  }
  return burcListeElemani;
}
