import 'package:flutter/material.dart';
import 'package:flutter_02/info_compra.dart';
import 'package:flutter_02/widget_boneca.dart';

class Bonecas extends StatefulWidget {
  const Bonecas({ Key? key }) : super(key: key);

  @override
  _BonecasState createState() => _BonecasState();
}

class _BonecasState extends State<Bonecas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Row(
        children: [

      Text('BRA',style: TextStyle(color:Colors.black,fontSize: 34)),
      Text('SEX',style: TextStyle(color: Colors.white,fontSize: 34),),
      Text('IL - ',style: TextStyle(color: Colors.black,fontSize: 34)), 
      Text('Bonecas Femininas',style: TextStyle(color:Colors.white,)),


      
      
      ],
      
      ),
      
      backgroundColor: Colors.red.shade900,
      ),
      body: Center(
      
        child: SingleChildScrollView(
          child: Column(
            children: [
            BonecaWidget('Florentina', 'R\$300', 'lib/imagens/Florentina.png'),   
            SizedBox(height: 15,),

            Container(
              width: 100,
              height: 25,
              child: ElevatedButton(child: 
              Text('COMPRAR'),
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>Info_Compra()));
              },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent.shade700)),
              ),
            ),
            SizedBox(height: 15,),

            BonecaWidget('Hipotenusa', 'R\$300', 'lib/imagens/Hipotenusa.png'),  
            SizedBox(height: 15,),

            Container(
              width: 100,
              height: 25,
              child: ElevatedButton(child: 
              Text('COMPRAR'),
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>Info_Compra()));
              },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent.shade700)),
              ),
            ),


        ]
          ),
        ),
      ) 
    );
  }
}