import 'package:flutter/material.dart';
import 'fim.dart';



// ignore: camel_case_types
class Info_Compra extends StatefulWidget {
  const Info_Compra({ Key? key }) : super(key: key);

  @override
  _Info_CompraState createState() => _Info_CompraState();
}

// ignore: camel_case_types
class _Info_CompraState extends State<Info_Compra> {


  @override  
  Widget build(BuildContext context) {


        final nomecompleto = TextFormField(
        autofocus: false,        
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900),
          ),
          prefixIcon: Icon(Icons.account_box,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(100, 15, 100, 15),
          hintText: ("Nome Completo"),
          
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        ),
      );


        final endereco = TextFormField(
        autofocus: false,        
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900),
          ),
          prefixIcon: Icon(Icons.add_location_alt,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(100, 15, 100, 15),
          hintText: ("Endereço"),
          
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        ),
      );

        
        final telefone = TextFormField(
        autofocus: false,        
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900),
          ),
          prefixIcon: Icon(Icons.local_phone,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(100, 15, 100, 15),
          hintText: ("Telefone"),
          
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        ),
      );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Row(
        children: [

      Text('BRA',style: TextStyle(color:Colors.black,)),
      Text('SEX',style: TextStyle(color: Colors.white),),
      Text('IL  -  ',style: TextStyle(color: Colors.black),),
      Text('Informações do Comprador')

      
      
      ],
      
      ),
      
      
      
      backgroundColor: Colors.red.shade900,
      ),
      body: Container(
        
        
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: Form(

               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center ,
                 crossAxisAlignment: CrossAxisAlignment.center, 
                 children: <Widget>[
                  
                  Text('Coloque suas informações',style: TextStyle(color: Colors.red.shade900,fontSize: 24)), 

                  SizedBox(height: 20,),nomecompleto,
                  SizedBox(height: 20,),endereco,
                  SizedBox(height: 20,),telefone,
                  SizedBox(height: 40,),
                  Text('Total a pagar : R\$300'),
                  SizedBox(height: 20,),
                  Text('Escolha a Forma de Pagamento',style: TextStyle(color: Colors.red.shade900,fontSize: 24)),
                  SizedBox(height: 40,),
                  Container(child: Row(
                    children: [
                                          
                     GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Fim()));
                      },
            child: CircleAvatar(
                backgroundColor: Colors.red.shade900,                
                radius: 5,
                               
                      ),  
                                          
                      ), 
                      SelectableText(' Bitcoin - 18j9c6a1JTZoqWEewrqE78fvrWVjUPVgrw', style: TextStyle(color: Colors.black),), 
                      SizedBox(width: 0,),

                    ],


                  ),
                  ),
                  Container(child: Row(children: [
                   GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Fim()));
                      },
            child: CircleAvatar(
                backgroundColor: Colors.red.shade900,                
                radius: 5,
                               
                      ),  
                                          
                      ),
                      SelectableText(' PIX - 16 96661-444141', style: TextStyle(color: Colors.black),)
                  ],),),
              SizedBox(height: 50,),   
              Container(
              width: 170,
              height: 25,
              child: ElevatedButton(child: 
              Text('Finalizar Compra'),
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>Fim()));
              },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent.shade700)),
              ),
            ),

                 ],

               ), 
              
              ),
            ),
          )
        )

        
        
      ),
      
    );
  }
}