import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'modelo/modelo_user.dart';
import 'bonecos.dart';
import 'bonecas.dart';


class BemVindo extends StatefulWidget {
  const BemVindo({ Key? key }) : super(key: key);

  @override
  _BemVindoState createState() => _BemVindoState();
}

class _BemVindoState extends State<BemVindo> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Row(
        children: [

      Text('BRA',style: TextStyle(color:Colors.black,fontSize: 34)),
      Text('SEX',style: TextStyle(color: Colors.white,fontSize: 34),),
      Text('IL',style: TextStyle(color: Colors.black,fontSize: 34),)

      
      
      ],
      
      ),
      
      backgroundColor: Colors.red.shade900,
      ),
      body: Container(
        child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),  
        child: Column(
           
          children: <Widget>[   
              SizedBox(height: 100,),           
              Text("Bem-vindo, ",style: TextStyle(fontSize: 34),),
              Text("${loggedInUser.firstName}"),
              SizedBox(height: 90,),

              Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Bonecas()));
                      },
            child: CircleAvatar(
                backgroundColor: Colors.red.shade900,                
                radius: 100,
                child: Text('Bonecas Femininas', style: TextStyle(color: Colors.white),),
                
                      ),
                      
                      ),
              SizedBox(width: 50,),


              GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Bonecos()));
                      },
            child: CircleAvatar(
                backgroundColor: Colors.red.shade900,                
                radius: 100,
                child: Text('Bonecos Masculinos', style: TextStyle(color: Colors.white),),
                
                      ),
                      
                      ),

                ],
              ),)
              


              
          ],
        )
        )
      ),
    );
  }
}