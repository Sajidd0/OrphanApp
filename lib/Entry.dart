
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class Entry extends StatefulWidget {
  @override
  State<Entry> createState() => _EntryState();
}
class _EntryState extends State<Entry>{

  final _formKey = GlobalKey<FormState>();
  DatabaseReference reference=FirebaseDatabase.instance.ref("childs");
  final _firebaseStorage = FirebaseStorage.instance;
  TextEditingController controller=new TextEditingController();
  TextEditingController controller1=new TextEditingController();
  TextEditingController controller2=new TextEditingController();
  File? imageFile;
  Future _getFromGallery() async {
    final pickedFile = (await ImagePicker().pickImage(
      source: ImageSource.gallery,
    ));
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  Future _getFromCamera() async {
    final pickedFile = (await ImagePicker().pickImage(
      source: ImageSource.camera,
    ));
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  CircleAvatar(
                    radius: 60.0,
                    child: ClipOval(
                      child: imageFile!=null?Image.file(imageFile!,fit: BoxFit.cover,):Image.asset('assets/imag1.png'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: Colors.red[500],
                    onPressed: () {
                      _getFromCamera();
                    },
                    child: Text("PICK FROM CAMERA"),
                  ),
                  RaisedButton(
                    color: Colors.red[900],
                    onPressed: () {
                      _getFromGallery();
                    },
                    child: Text("PICK FROM GALLERY"),
                  )
                ],
              ),
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter name',
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person, color: Colors.red[900],),

                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller1,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                decoration: InputDecoration(
                  hintText: 'Enter age',
                  labelText: 'Age',
                  prefixIcon: Icon(
                    Icons.onetwothree_rounded, color: Colors.red[900],),

                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller2,
                decoration: InputDecoration(
                  hintText: 'Enter Blood group',
                  labelText: 'Blood group',
                  prefixIcon: Icon(Icons.water_drop, color: Colors.red[900],),

                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 150, vertical: 16.00),

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red[900]),
                  onPressed: () {


                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      if(imageFile!=null)
                        {
                          String a=controller.text;
                          var snapshot =_firebaseStorage.ref().child('images/$a').putFile(imageFile!);
                        }
                      reference.set({
                      "name":controller.text,
                      "age":controller1.text,
                      "bloodgroup":controller2.text
                    }
                    );
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                    );
                    }
                  },
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
