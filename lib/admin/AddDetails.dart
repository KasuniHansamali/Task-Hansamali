
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:untitled1/admin/UI.dart';


class AddCourtDetails extends StatefulWidget {


  @override
  _AddCourtDetailsState createState() => _AddCourtDetailsState();
}

class _AddCourtDetailsState extends State<AddCourtDetails> {
  var imageUrlup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.black54,
        elevation: 2.0,
        title: Text(
          "Return to Manage",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.yellow[800],
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ManageCourt()));
            }
          // onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            //Header(),
            SizedBox(
              height: 20,
            ),
            Body()
          ],
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var uploadedPhotoUrl;



  createData([var downloadUrl]) async {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("Courts").doc(advertise);

    Map<String, dynamic> courts = {
      'advertise': advertise,
      'courtname': courtname,
      'price': price,
      'searchKey': searchKey,
      'image': downloadUrl,
    };
    documentReference
        .set(courts)
        .whenComplete(() => print("$advertise created"));
  }
  //File downloadUrl;
  var advertise;
  var courtname;
  var price;
  var searchKey;
  //String imageUrl;
  //UploadTask task;
  //File file;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //final fileName = file != null ? basename(file.path) : 'No File Selected';
    List<Widget> pageChildren(double width) {
      return <Widget>[
        Form(
            key: _formkey,
            child: Column(children: [
              Container(
                height: 700,
                width: 650,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Colors.orangeAccent,
                      Colors.orange,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white10,
                    width: 5,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Advertise Details',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            'Advertise',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 230,
                          child: new TextFormField(
                            validator: (val) {
                              if (val!.length == 0) {
                                return "* Required";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              advertise = value;
                            },
                            decoration: new InputDecoration(
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),

                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            'name',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 230,
                          child: new TextFormField(
                            onChanged: (value) {
                              courtname = value;
                            },
                            decoration: new InputDecoration(
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            validator: (val) {
                              if (val!.length == 0) {
                                return "* Required";
                              } else {
                                return null;
                              }
                            },
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            'searchKey',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 230,
                          child: new TextFormField(
                            onChanged: (value) {
                              searchKey = value;
                            },
                            decoration: new InputDecoration(
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            validator: (value) {
                              if (value!.length == 0) {
                                return "* Required";
                              } else {
                                return null;
                              }
                            },
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            'price',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 230,
                          child: new TextFormField(
                            onChanged: (value) {
                              price = value;
                            },
                            //description = value;
                            // minLines: 1,
                            // maxLines: 5,
                            decoration: new InputDecoration(
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            validator: (value) {
                              if (value!.length == 0) {
                                return "* Required";
                              } else {
                                return null;
                              }
                            },
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        // selectFile();
                        // uploadFile();
                        chooseImage();
                      },
                      tooltip: 'Pick ImageFrom Gallery',
                      child: Icon(
                        Icons.image_rounded,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 8),
                    // Text(
                    //   pickedFile,
                    //   style:
                    //       TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    // ),

                    SizedBox(height: 20),

                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50.0,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.orangeAccent,
                          onSurface: Colors.grey,
                        ),
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(80.0)),
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            uploadImageToStorage();
                            createData();
                            //
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => Dashboard()));
                          }
                        },

                        child: Text("Submit".toUpperCase(),
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
            ]))
      ];
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 2),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }

  late PickedFile pickedFile;
  //PickedFile pickedFile;
  //final _descriptionController = TextEditingController();
  chooseImage() async {
    // ignore: deprecated_member_use
    pickedFile = (await ImagePicker().getImage(
      source: ImageSource.gallery,
    ))!;
  }

  final _firebaseStorage = FirebaseStorage.instance;

  uploadImageToStorage() async {
    if (kIsWeb) {
      Reference _reference = _firebaseStorage
          .ref()
          .child('images/${Path.basename(pickedFile.path)}');
      await _reference
          .putData(
        await pickedFile.readAsBytes(),
        SettableMetadata(contentType: 'image/jpeg'),
      )
          .whenComplete(() async {
        await _reference
            .getDownloadURL()
            .then((downloadUrl) => createData(downloadUrl));
      });
    } else {}
  }
}
