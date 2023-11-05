import 'package:flutter/material.dart';
import 'package:news_app/detay_sayfa.dart';

class MyContainer extends StatelessWidget {

  String resimUrl;
  String haberBaslik;
  String haberTanim;
  String haberIcerik;
  String haberUrl;


  MyContainer({required this.resimUrl,required this.haberBaslik,required this.haberTanim,required this.haberIcerik,required this.haberUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0,top: 20.0),
            child: Image.network(
                height:300 ,
                width: MediaQuery.of(context).size.width,
                fit:BoxFit.cover,
                resimUrl),
          ),
          Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  haberBaslik !="---"
                    ? haberIcerik.length > 250
                      ? haberIcerik.substring(0,100)
                       : "${haberIcerik.toString().substring(0, haberIcerik.length - 2)}..."
                  : haberIcerik,
                  style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,)),
              Text(haberTanim,style: TextStyle(fontSize: 16,color: Colors.grey),),
              Text(haberIcerik.length>50 ? haberIcerik.substring(0,50) : haberIcerik.toString().substring(0,haberIcerik.length),style: TextStyle(fontSize: 16),),
            ],
          ),
          ),

          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetaySayfa(haberUrl: haberUrl)));
                },
                    child: Text("Haberin Devamı",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.grey,elevation:5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
