import 'package:flutter/material.dart';
import 'package:flutter_02/registrar.dart';
import 'SobreApp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'registrar.dart';
import 'bemvindo.dart';
import 'package:fluttertoast/fluttertoast.dart';



void main() {

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BRASEXIL - SexShop',

      home: TelaInicial(),
    )
  );
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({ Key? key }) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {  
      final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value){
          if(value!.isEmpty){
            return "Digite seu e-mail";
          }
          if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
          .hasMatch(value)){
            return ("Digite um e-mail válido");
          }
          
          return null;
          
        },
        onSaved: (value){
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900),
          ),
          prefixIcon: Icon(Icons.mail,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(40, 15, 40, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        ),
      );

      final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,        
        validator: (value){
          RegExp regex = new RegExp(r'^.{6,}$');
          if(value!.isEmpty){
            return ("Coloque sua senha");

          }
          if(!regex.hasMatch(value))
          {
            return ("Entre uma senha válida(min 6 caracteres)");
          }
        },

        onSaved: (value){
          passwordController.text = value!;
        },
        
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900),
          ),
          prefixIcon: Icon(Icons.vpn_key,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(40, 15, 40, 15),
          hintText: "Senha",          
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        ),
      );

      // ignore: non_constant_identifier_names
      final BotaoLogin = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.black,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width*0.25,
          onPressed: (){
            logar(emailController.text, passwordController.text);

          },
          child: Text("Login",style: TextStyle(color: Colors.white),),
          padding:EdgeInsets.fromLTRB(40, 15, 40, 15),
        ),

      );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [

      Text('BRA',style: TextStyle(color:Colors.black,fontSize: 34)),
      Text('SEX',style: TextStyle(color: Colors.white,fontSize: 34),),
      Text('IL',style: TextStyle(color: Colors.black,fontSize: 34)),

      
      
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
               key: _formKey , 
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center ,
                 crossAxisAlignment: CrossAxisAlignment.center, 
                 children: <Widget>[
                   
                   
                  SizedBox(height: 45,), emailField,
                  SizedBox(height: 25,), passwordField,
                  SizedBox(height: 45,),  BotaoLogin,
                  SizedBox(height: 55,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text('Sem conta? '),
                      GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrarConta()));
                      },
                      child: Text("Registrar",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
 
                    ],
                  
                  )
                     ,SizedBox(height: 350,),
                      APPINFO('Sobre o app')
                 ],

               ), 

              ),
            ),
          )
        )

        
        
      ),
      

      
      
    );
    
  }

    void logar(String email, String password) async
    {
      if(_formKey.currentState!.validate())
      {
        await _auth.signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
        Fluttertoast.showToast(msg: "Login realizado"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BemVindo())),

        }).catchError((e)
        {
            Fluttertoast.showToast(msg: e!.message);
        });
      }
    }


  

    // ignore: non_constant_identifier_names
    Widget APPINFO(rotulo){
    return Container(
      
      width:130,
      height: 40,
      padding: EdgeInsets.only(top: 20),
      child:ElevatedButton(        
        child: Text(rotulo),
        onPressed: (){          
          
          Navigator.push(context, new MaterialPageRoute(builder: (context)=>InfoApp()));
                  
        },
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red.shade900)),
      ) ,
    );
    }  
}
