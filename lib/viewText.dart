import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:textrecognization/translate.dart';

import 'package:textrecognization/viewPdf.dart';
class ViewText extends StatefulWidget {
  String text;
  ViewText({this.text});
  @override
  _ViewTextState createState() => _ViewTextState(text: text);
}

class _ViewTextState extends State<ViewText> {
  String text;
  final pdf = pw.Document();
  String path ="";
  _ViewTextState({this.text});
  @override
  void setState(fn) {
    path = "";
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text From Image"),
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
             maxLines: 35,
             readOnly: true,

)
            ),
            Wrap(
              spacing: 50,
              children: <Widget>[
           RaisedButton(onPressed: ()async{
             //creating pdf
                       pdf.addPage(pw.Page(
             pageFormat: PdfPageFormat.a4.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
             
            build: (pw.Context context) {
              return pw.Center(
              child: pw.Text(text),
          ); // Center
        }));

          

        final output = await getExternalStorageDirectory();
            final file = File("${output.path}/example.pdf");
            await file.writeAsBytes(pdf.save());
            setState(() {
              path = "${output.path}/example.pdf";
            });


            if(path!=""){
           Navigator.of(context).push(
           MaterialPageRoute(
            builder: (_) => ViewPdf(path: path),
         ),
          );
            } 
            
            },
            child: Text("View Pdf"),),


                //translatte
                  RaisedButton(onPressed: (){
                     Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => TransLate(text: text),
                    ),
                      );
                  },
                  child: Text("TransLate"),
                
                
                )
              ]
            )
          ],



        ),
      ),

    );
  }
}