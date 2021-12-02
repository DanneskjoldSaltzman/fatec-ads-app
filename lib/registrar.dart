import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_02/main.dart';
import 'package:flutter_02/modelo/modelo_user.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrarConta extends StatefulWidget {
  const RegistrarConta({ Key? key }) : super(key: key);

  @override
  _RegistrarContaState createState() => _RegistrarContaState();
}

class _RegistrarContaState extends State<RegistrarConta> {

  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {

           final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value){
          RegExp regex = new RegExp(r'^.{3,}$');
          if(value!.isEmpty){
            return ("Coloque um nome");

          }
          if(!regex.hasMatch(value))
          {
            return ("Entre um nome válido (min 3 caracteres)");
          }
          return null;
        },

        onSaved: (value){
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900),
          ),
          prefixIcon: Icon(Icons.account_box,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(40, 15, 40, 15),
          hintText: "Nome",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        ),
      );


           final secondNameField = TextFormField(
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value){
          
          if(value!.isEmpty){
            return ("Coloque um sobrenome");

          }
          return null;

        },

        onSaved: (value){
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900),
          ),
          prefixIcon: Icon(Icons.account_box,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(40, 15, 40, 15),
          hintText: "Sobrenome",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        ),
      );



           final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
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
          emailEditingController.text = value!;
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
        controller: passwordEditingController,
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
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
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

           final confirmField = TextFormField(
        autofocus: false,
        controller: confirmEditingController,
        obscureText: true,
        validator: (value)
        {
          if(confirmEditingController.text != passwordEditingController.text)
          {
            return "Senhas diferentes";
          }
          return null;
        },

        onSaved: (value){
          confirmEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900),
          ),
          prefixIcon: Icon(Icons.vpn_key,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(40, 15, 40, 15),
          hintText: "Confirme a Senha",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        ),
      );

           // ignore: non_constant_identifier_names
           final RegistrarAcc = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.black,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width*0.25,
          onPressed: (){
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: Text("Registrar",style: TextStyle(color: Colors.white),),
          padding:EdgeInsets.fromLTRB(40, 15, 40, 15),
        ),

      );



 return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Row(
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
                   
                   
                  SizedBox(height: 45,), firstNameField,
                  SizedBox(height: 25,), secondNameField,
                  SizedBox(height: 25,), emailField,
                  SizedBox(height: 25,), passwordField,
                  SizedBox(height: 25,), confirmField,
                  SizedBox(height: 45,), RegistrarAcc, 
                  SizedBox(height: 25,)
                  

                 ],

               ), 

              ),
            ),
          )
        )

        
        
      ),
      

      
      
    );













  }
  void signUp(String email, String password) async
  {
    if(_formKey.currentState!.validate())
    {
        await _auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
          postDetailsToFirestore()
        }).catchError((e)
        {
            Fluttertoast.showToast(msg: e!.message);
        });
    }
  }
  postDetailsToFirestore() async
  {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

  userModel.email = user!.email;
  userModel.uid = user.uid;
  userModel.firstName = firstNameEditingController.text;
  userModel.secondName = secondNameEditingController.text;

  await firebaseFirestore.
  collection("users")
  .doc (user.uid)
  .set(userModel.toMap());
  Fluttertoast.showToast(msg: "Conta criada com sucesso");

  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TelaInicial()), 
  (route) => false);


  }
}

