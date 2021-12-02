import 'package:flutter/material.dart';
import 'package:flutter_02/info_compra.dart';
import 'package:flutter_02/widget_boneca.dart';
import 'info_compra.dart';


class Bonecos extends StatefulWidget {
  const Bonecos({ Key? key }) : super(key: key);

  @override
  _BonecosState createState() => _BonecosState();
}

class _BonecosState extends State<Bonecos> {
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
      Text('Bonecos Masculinos',style: TextStyle(color:Colors.white,)),

      
      
      
      ],
      
      ),
      
      backgroundColor: Colors.red.shade900,
      ),
      body: Center(
      
        child: SingleChildScrollView(
          child: Column(
            children: [

            BonecaWidget('Big John', 'R\$300', 'lib/imagens/BigJohn.png'), 
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



            BonecaWidget('Jacinto', 'R\$300', 'lib/imagens/Jacinto.png'),
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

 