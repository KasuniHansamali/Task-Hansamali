
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/add%20New/AddNew.dart';
import 'package:untitled1/admin/AddDetails.dart';
import 'package:untitled1/admin/Model/Court.dart';

class ManageCourt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.black54,
        elevation: 2.0,
        title: Text(
          "Add Advertisements",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.yellow[800],
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Addnew()));
            }
          // onPressed: () => Navigator.pop(context),
        ),

      ),
      //
      //
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Column(
              children: [Body()],
            ),
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
  var courtname;

  var price;
  var searchKey;

  var advertise;

  deleteData() {
    // ignore: unused_local_variable

    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("Courts").doc(advertise);
    documentReference.delete().whenComplete(() => print("$advertise deleted"));
  }

  editData() async {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("Courts").doc(advertise);

    Map<String, dynamic> courts = {
      'advertise': advertise,
      'courtname': courtname,
      'price': price,
      'searchKey': searchKey,
    };
    documentReference
        .set(courts)
        .whenComplete(() => print("$advertise Updated"));
  }

  Future<void> deleteDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter the advertise name that you want to delete'),
            titleTextStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w800,
            ),
            content: TextField(
              onChanged: (value) {
                advertise = value;
              },

              //controller: _textFieldController,
              decoration: InputDecoration(hintText: "Advertise"),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ManageCourt()));
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: Text('OK'),
                onPressed: () {
                  deleteData();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ManageCourt()));
                },
              ),
            ],
          );
        });
  }

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future<void> editDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter the details that you want to edit'),
            titleTextStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w800,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            content: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      focusNode: advertise,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'advertise',
                      ),
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        advertise = value;
                      },
                      validator: (val) {
                        if (val!.length == 0) {
                          return "* Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      focusNode: courtname,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'name',
                      ),
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        courtname = value;
                      },
                      validator: (val) {
                        if (val!.length == 0) {
                          return "* Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      focusNode: price,
                      keyboardType: TextInputType.text,
                      maxLength: 10,
                      decoration: InputDecoration(
                        labelText: 'Price',
                      ),
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        price = value;
                      },
                      validator: (val) {
                        if (val!.length == 0) {
                          return "* Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      focusNode: searchKey,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'SearchKey',
                      ),
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        searchKey = value;
                      },
                      validator: (val) {
                        if (val!.length == 0) {
                          return "* Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ManageCourt()));
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: Text('OK'),
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    editData();

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ManageCourt()));
                  }
                },
              ),
            ],
          );
        });
  }

  List<DataRow> _buildList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return snapshot.map((data) => _buildListItem(context, data)).toList();
  }

  DataRow _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Court.fromSnapshot(data);

    return DataRow(
        cells: [
          DataCell(
            Text(record.advertise),
          ),
          DataCell(Text(record.courtname)),
          DataCell(Text(record.searchKey)),
          DataCell(Container(
              width: 250,
              child: Text(record.price))),
          DataCell(
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                deleteDialog();
              },
            ),
          ),
          DataCell(
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              ),
              onPressed: () {
                editDialog();
              },
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pageChildren(double width) {
      return <Widget>[
        Column(children: [

          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(16.0),
            child: Container(
              height: 500,
              width: 900,
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
              child: new SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Manage your advertisements',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Court court;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddCourtDetails()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      child: Text(
                        "Add Advertisements",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Courts')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return LinearProgressIndicator();
                        return DataTable( dataRowHeight: 100,
                            columns: [
                              DataColumn(
                                  label: Text('advertise',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('name',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Searchkey',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(

                                  label: Text('Price',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Delete',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Edit',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                            ], rows: _buildList(context, snapshot.data!.docs));
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ])
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
}

