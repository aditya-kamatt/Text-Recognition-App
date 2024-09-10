import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
class TransLate extends StatefulWidget {
  String text;
  TransLate({this.text});
  @override
  _TransLateState createState() => _TransLateState(text: text);
}

class _TransLateState extends State<TransLate> {
  String text;
  _TransLateState({this.text});
  final translator = GoogleTranslator();
  String transl= "";
  final input = "Hello";

  void tranHindi() async{
    translator.translate(text, to: 'hi').then((s){
      setState(() {
        transl = s;
        
      });
    });
      print(transl);
  }
   void tranUrdu() async{
    translator.translate(text, to: 'ur').then((s){
      setState(() {
        transl = s;
        
      });
    });
      print(transl);
  }
void tranTamil() async{
    translator.translate(text, to: 'ta').then((s){
      setState(() {
        transl = s;
        
      });
    });
      print(transl);
  }
  void traGujrati() async{
    translator.translate(text, to: 'gu').then((s){
      setState(() {
        transl = s;
        
      });
    });
      print(transl);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Translate")
      ),
       body: Container(

         decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assests/bs.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child:TextFormField(
              
              decoration: InputDecoration(border:  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)), fillColor: Colors.white, filled:  true),
              initialValue: text,
            keyboardType: TextInputType.multiline,
             maxLines: 15,
             readOnly: true,)
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 7,
              children:<Widget>[
                RaisedButton(onPressed: (){
                  setState(() {
                    transl = "";
                    
                  });
                  
                  tranHindi();
                }, child: Text("Hindi"),),


                 RaisedButton(onPressed: (){
                  setState(() {
                    transl = "";
                    
                  });
                  
                  traGujrati();
                }, child: Text("Gujrati"),),
                  RaisedButton(onPressed: (){
                  setState(() {
                    transl = "";
                    
                  });
                  
                 tranUrdu();
                }, child: Text("Urdu"),),
                   RaisedButton(onPressed: (){
                  setState(() {
                    transl = "";
                    
                  });
                  
                  tranTamil();
                }, child: Text("Tamil"),),

              ]
            ),
           transl==""? Container(): Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child:TextFormField(
              
              decoration: InputDecoration(border:  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)), fillColor: Colors.white, filled:  true),
              initialValue: transl,
            keyboardType: TextInputType.multiline,
             maxLines: 15,
             readOnly: true,)
            ),
            
        
          ])
      
      ),
    );
  }
}