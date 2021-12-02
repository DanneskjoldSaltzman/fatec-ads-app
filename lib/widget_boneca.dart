import 'package:flutter/material.dart';

class BonecaWidget extends StatelessWidget {

  final String nome;
  final String valor;
  final String foto;


  const BonecaWidget(this.nome,this.valor,this.foto,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      
      width: 300,
      
      color: Colors.white,
      child: Column(children: [

        Image.asset(this.foto,fit: BoxFit.fill,),
        Text(this.nome, style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.red.shade900),),
        Text(this.valor),
      ],
      )
      
    );
  }
}