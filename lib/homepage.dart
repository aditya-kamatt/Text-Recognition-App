import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:textrecognization/viewText.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File pickedImage;
  bool isImageLoaded = false;
  String text= "";
    Future pickImage() async {
    var tempStore = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = tempStore;
      isImageLoaded = true;
    });
  }

  Future readText() async {
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(ourImage);

    for (TextBlock block in readText.blocks) {
     
          setState(() {
            text = text + block.text; 
          });
       // }
      //}
    }
  }

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Recognization")
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
            SizedBox(height: 20.0),
            isImageLoaded
                ? Center(
                    child: Container(
                        height: 530.0,
                        width: 350.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(pickedImage), fit: BoxFit.cover))),
                  )
                : Container(),
            SizedBox(height: 10.0),
            RaisedButton(
              child: Text('Pick an image'),
              onPressed:(){ pickImage();
              setState(() {
                text= "";
              });
              },
            ),
            SizedBox(height: 10.0),
            isImageLoaded== false? Container():RaisedButton(
              child: Text('Read Text'),
              onPressed: (){
                readText();
                if (text!= "") {
                  print(text);
                   Navigator.push(context, MaterialPageRoute(builder:(context)=> ViewText(text: text) ));
                }
                
               
              },
            ),




    //         SizedBox(height:20.0),
    //       
    //         SizedBox(height: 10.0),
    //         RaisedButton(onPressed: ()async{
    
    //         }),
    //          SizedBox(height: 10.0),





    //         SizedBox(height:20.0),
    //         RaisedButton(onPressed: (){
    

    //         },
    //         child: Text('View Pdf'),
    //         ),








        
            
          ],
    ),
        ),
      
    );
  }
  
}