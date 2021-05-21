import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';
import 'package:flutter_burc_rehberi/models/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;
  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;

  PaletteGenerator paletteGenerator;

  Color fPaletColor;
  @override
  void initState() { //bu metod constructor gibi uygulama  her sınıf öaprıldığında bir kez çalışır
    //kullanmamızın sebebi baskin rengi bul fonksiyonun sürekli değil sadece bir kere çalışmasını sağlamaktır.
    super.initState();
    secilenBurc = BurcListesi.tumBurclar[widget.gelenIndex];
    baskinRengiBul();

  }

  void baskinRengiBul(){
    Future<PaletteGenerator> fPaletGenerator= PaletteGenerator.fromImageProvider(AssetImage("images/"+secilenBurc.burcBuyukResim));
    fPaletGenerator.then((value) {
      paletteGenerator=value;

setState(() {
  fPaletColor=paletteGenerator.dominantColor.color;
});
      debugPrint("seçilen renk"+paletteGenerator.dominantColor.color.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: fPaletColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/" + secilenBurc.burcBuyukResim,fit: BoxFit.cover/*fotograf alanı kaplar*/,),
              centerTitle: true,
              title: Text(secilenBurc.burcAdi + " Burcu ve Özellikleri"),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Text(
                secilenBurc.burcDetayi,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
