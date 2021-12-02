import 'package:flutter/material.dart';


class Fim extends StatefulWidget {
  const Fim({ Key? key }) : super(key: key);

  @override
  _FimState createState() => _FimState();
}

class _FimState extends State<Fim> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            SizedBox(height: 180,),
            Center(child: Text('Obrigado pela Compra!!!',style: TextStyle(color: Colors.red.shade900,fontSize: 30),),)    
            ],
          ),
        ),
      ) 
      
      
      
    );
  }
}