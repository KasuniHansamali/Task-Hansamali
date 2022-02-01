
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/add%20New/AddNew.dart';
import 'package:untitled1/detailed%20screen/detail.dart';



const PrimaryColor = const Color(0xFF000000);
Color myColor = Color(0xff00bfa5);



class HomePage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return new Scaffold(



        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [

                Color.fromRGBO(0,0, 0, 1),
                Color.fromRGBO(0,0, 0, 1),






              ],
            ),
          ),
          child: ListView(children: <Widget>[

            Container(
              child: Text(
                "WELCOME",
                style: TextStyle(
                  fontSize: (25),
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[800],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 45.0),

            Container(
              width: 30,

              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                color: Colors.yellow[800],




              ),

              child:Card(
                color: Colors.yellow[800],

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),

                child: DropdownSearch<String>(


                  //mode of dropdown
                  mode: Mode.DIALOG,
                  //to show search box
                  showSearchBox: true,
                  showSelectedItem: true,

                  //list of dropdown items
                  items: [
                    "100.00 - 1000.00",
                    "1000.00 - 2000.00",
                    "2000.00 - 3000.00",
                    "3000.00 - 4000.00",
                    "4000.00 - 5000.00",
                    "5000.00 - 6000.00",
                    "6000.00 - 7000.00",
                    "7000.00 - 8000.00",

                  ],
                  label: "Select your Price",

                  onChanged: print,
                  //show selected item
                  selectedItem: "100.00 - 1000.00",
                ),
              ),
            ),

            SizedBox(height: 30.0),
            GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 2,
                    mainAxisExtent: 120,
                    childAspectRatio: 1),
                children: [
                  Card(
                      color: Colors.blueGrey.shade100,
                      margin: EdgeInsets.only(
                          left: 5.0, right: 0.0, top: 0.0, bottom: 10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),





                      // elevation: 2.0,
                      child:  GestureDetector(
                        onTap: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => DetailScreen ())),
                        child: Container(
                          height: 120,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.white,
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
                                    Text(
                                      'AD 01',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ]),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 310,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10.0)),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: ExactAssetImage(
                                                "assets/images/Red-Flowers.jpg"),
                                          ))),
                                ],
                              ),

                              // Container(
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: <Widget>[
                              //       Icon(
                              //         Icons.phone,
                              //         color: Colors.black,
                              //         size: 17,
                              //       ),
                              //       Text(
                              //         'material',
                              //         style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 18),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 4,
                              // ),

                              // Container(
                              //   child: Row(
                              //     children: <Widget>[

                              //       Text('description'),
                              //     ],
                              //   ),
                              // ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SingleChildScrollView(
                                        child: Text('1000/=',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 12)))
                                  ],
                                ),
                              ),

                              // ElevatedButton(onPressed: null, child: Text('Add to cart'))
                            ],
                          ),
                        ),
                      )
                    //),
                  ),
                  Card(
                    color: Colors.blueGrey.shade100,
                    margin: EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 0.0, bottom: 10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),

                    // child: GestureDetector(
                    // onTap: () => Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => BookingDate()
                    // )
                    // ),

                    // elevation: 2.0,
                    child:  GestureDetector(
                        // onTap: () => Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) => DetailScreen ())),
                        child: Container(
                          height: 120,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.white,
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
                                    Text(
                                      'AD 02',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ]),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 310,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10.0)),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: ExactAssetImage(
                                                "assets/images/1_bag.jpg"),
                                          ))),
                                ],
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SingleChildScrollView(
                                        child: Text('3000/=',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 12)))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )

                    ),
                  ),
                  Card(
                    color: Colors.blueGrey.shade100,
                    margin: EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 0.0, bottom: 10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),

                    // child: GestureDetector(
                    // onTap: () => Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => BookingDate()
                    // )
                    // ),
                    // elevation: 2.0,
                    child:  GestureDetector(
                        // onTap: () => Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) => DetailScreen ())),
                        child: Container(
                          height: 120,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.white,
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
                                    Text(
                                      'AD 03',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ]
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 310,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10.0)),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: ExactAssetImage(
                                                "assets/images/car.jpg"),
                                          ))),
                                ],
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SingleChildScrollView(
                                        child: Text('4500/=',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 12)))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                  Card(
                    color: Colors.blueGrey.shade100,
                    margin: EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 0.0, bottom: 10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),

                    child: GestureDetector(
                        // onTap: () => Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) => DetailScreen()
                        // )
                        // ),

                        // elevation: 2.0,
                        child: Container(
                          height: 120,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.white,
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

                                    Text(
                                      'AD 04',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ]),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 310,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10.0)),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: ExactAssetImage(
                                                "assets/images/2_bag.jpg"),
                                          ))),
                                ],
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SingleChildScrollView(
                                        child: Text('6000/=',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 12)))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                  Card(
                      color: Colors.blueGrey.shade100,
                      margin: EdgeInsets.only(
                          left: 5.0, right: 0.0, top: 0.0, bottom: 10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),





                      // elevation: 2.0,
                      child:  GestureDetector(
                        // onTap: () => Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) => DetailScreen ())),
                        child: Container(
                          height: 120,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.white,
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
                                    Text(
                                      'AD 05',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ]),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 310,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10.0)),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: ExactAssetImage(
                                                "assets/images/shoes.jpg"),
                                          ))),
                                ],
                              ),

                              // Container(
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: <Widget>[
                              //       Icon(
                              //         Icons.phone,
                              //         color: Colors.black,
                              //         size: 17,
                              //       ),
                              //       Text(
                              //         'material',
                              //         style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 18),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 4,
                              // ),

                              // Container(
                              //   child: Row(
                              //     children: <Widget>[

                              //       Text('description'),
                              //     ],
                              //   ),
                              // ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SingleChildScrollView(
                                        child: Text('1000/=',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 12)))
                                  ],
                                ),
                              ),

                              // ElevatedButton(onPressed: null, child: Text('Add to cart'))
                            ],
                          ),
                        ),
                      )
                    //),
                  ),
                  Card(
                    color: Colors.blueGrey.shade100,
                    margin: EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 0.0, bottom: 10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),

                    // child: GestureDetector(
                    // onTap: () => Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => BookingDate()
                    // )
                    // ),

                    // elevation: 2.0,
                    child:  GestureDetector(
                      // onTap: () => Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (context) => DetailScreen ())),
                        child: Container(
                          height: 120,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.white,
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
                                    Text(
                                      'AD 06',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ]),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 310,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10.0)),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: ExactAssetImage(
                                                "assets/images/Red-Flowers.jpg"),
                                          ))),
                                ],
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SingleChildScrollView(
                                        child: Text('3000/=',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 12)))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )

                    ),
                  ),
                ],
                padding: EdgeInsets.all(10),
                shrinkWrap: true),



            SizedBox(height: 40.0),
            ElevatedButton(
              child: Text("CONTINUE",
                style: TextStyle(

                    color: Colors.black
                ),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Addnew()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),





          ]),
        )
    );
  }
}
