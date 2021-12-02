import 'package:flutter/material.dart';
import 'package:flutter_02/widget_boneca.dart';

class InfoApp extends StatefulWidget {
  const InfoApp({ Key? key }) : super(key: key);

  @override
  _InfoAppState createState() => _InfoAppState();
}

class _InfoAppState extends State<InfoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Row(
        children: [

      Text('BRA',style: TextStyle(color:Colors.black,fontSize: 34)),
      Text('SEX',style: TextStyle(color: Colors.white,fontSize: 34),),
      Text('IL',style: TextStyle(color: Colors.black,fontSize: 34),),

      
      
      ],
      
      ),
      
      backgroundColor: Colors.red.shade900,
      ),
      body: Container(
      padding: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
            BonecaWidget('Adson','(Imagem meramente ilustrativa)','lib/imagens/adson.png'),  
            Center(child: Text('App criado por Adson Vitor Moura de Oliveira para matéria de Programação para dispositivos móveis.'),
            
            
            ), 
            SizedBox(height: 70,),  
            Text('Aplicativo criado utilizando Flutter + Firebase',style: TextStyle(color: Colors.red.shade900,fontSize: 20),)
            ],
          ),
        ),
      ) 
      
      
      
    );
  
  }
}