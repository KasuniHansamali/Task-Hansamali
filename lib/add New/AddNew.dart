
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/add%20New/SearchService.dart';
import 'package:untitled1/admin/UI.dart';
import 'package:untitled1/home/homescreen.dart';


class Addnew extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.black),

      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  late String courtname;
  late String advertise;

  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot snapshot) {
        for (int i = 0; i < snapshot.docs.length; ++i) {
          queryResultSet.add(snapshot.docs[i].data());
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['advertise'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {



    return new Scaffold(
        appBar: AppBar(

          title: InkWell(


            child:
            GestureDetector(

              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ManageCourt()));
              },
              child: Row(

                children: [
                  Text("Add New Advertisement", style: TextStyle(color: Colors.white),),
                  SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ManageCourt()));
                    },

                    child: Icon(Icons.plus_one_rounded,color:Colors.yellow[800],size: 35,),

                  ),


                ],
              ),
            ),

          ),
          backgroundColor: PrimaryColor,
          // leading: BackButton(color: Colors.yellow[800]),
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),

            child: TextField(
              style: TextStyle(color: Colors.grey),
              onChanged: (val) {
                initiateSearch(val);
              },
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back),
                  iconSize: 20.0,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                contentPadding: EdgeInsets.only(left: 25.0),
                hintText: 'Search by Advertise',
                hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          StreamBuilder<Object>(

              stream: null,
              builder: (context, snapshot) {
                return GridView.count(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    crossAxisCount: 1,
                    // crossAxisSpacing: 4.0,
                    // mainAxisSpacing: 4.0,
                    primary: false,
                    shrinkWrap: true,
                    children: tempSearchStore.map((element) {
                      return buildResultCard(context, element);
                    }).toList());
              }
          )
        ]));
  }
}

Widget buildResultCard(BuildContext context, data) {
  var imageUrl;
  return  SizedBox(
    height: 150,
    width:300,

    child:Card(

      color: Colors.yellow[800],
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 35.0),

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)),

      child: GestureDetector(
          // onTap: () =>
          //     Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => BookingDate())),

          // elevation: 2.0,
          child: Container(
            height: 150,
            width:300,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Colors.orangeAccent,
                  Colors.black54,
                ],
              ),
              border: Border.all(
                color: Colors.white10,
                width: 5,
              ),

            ),


            child: Column(


              children: <Widget>[

                Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.category,
                        color: Colors.black,
                        size: 20,
                      ),
                      Text(
                        data['courtname'],style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                    ]
                ),
                SizedBox(
                  height:2,

                ),
                (imageUrl!= null)
                    ? Image.file(imageUrl,
                    width: 280, height: 150):

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Container(
                        width:310,
                        height: 160,

                        decoration: BoxDecoration(
                            gradient:
                            LinearGradient(colors: [Color(0xFFFFAB40), Color(0xFF4E342E)]),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),


                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                data['image'],
                              ),
                            )

                        )


                    ),
                  ],
                ),



                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.add_alert,
                        color: Colors.black,
                        size: 17,
                      ),
                      Text(data['advertise'],style: TextStyle(color: Colors.black,fontSize: 18),)
                    ],
                  ),
                ),

                SizedBox(
                  height:4,

                ),
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    gradient:
                    LinearGradient(colors: [Color(0x8A000000), Color(0xFF424242)]),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),

                  ),

                ),









                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    gradient:
                    LinearGradient(colors: [Color(0x8A000000), Color(0xFF424242)]),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),

                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.price_change_rounded,
                        color: Colors.black,
                        size: 22,
                      ),
                      Text(data['price'],style: TextStyle(color: Colors.black,fontSize: 20),)
                    ],
                  ),
                ),

              ],
            ),
          )
      ),
    ),



  );









}






