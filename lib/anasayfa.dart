import 'package:flutter/material.dart';
import 'package:news_app/haberler/haberler.dart';
import 'package:news_app/kontroller/haberleriGetir.dart';
import 'package:news_app/yardimcilar/my_container.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool yukleniyorMu = true;
  late Haberler haberler;

  HaberleriAl()async{
    haberler=await GetHaberler.getHaberler();
    setState(() {
      yukleniyorMu=false;
    });
  }

  @override
  void initState(){
    HaberleriAl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (value){
          setState(() {
            yukleniyorMu=true;
          });
          HaberleriAl();
        },
        itemBuilder: (context, index) {
          return yukleniyorMu ? Center(child: CircularProgressIndicator(),) : MyContainer(
              resimUrl: haberler.resimUrl,
              haberBaslik: haberler.haberBaslik,
              haberTanim: haberler.haberTanim ,
              haberIcerik:haberler.haberIcerik,
              haberUrl: haberler.haberUrl);
        },
      ),
    );
  }
}
