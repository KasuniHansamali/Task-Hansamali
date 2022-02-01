
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailScreen extends StatelessWidget{



  bool isLike = false;

  Icon icon = Icon(FontAwesomeIcons.solidHeart);

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: ClipRRect(
              borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(60.0)),
              child: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Stack(
                  children: <Widget>[
                    Positioned(
                        bottom: 0,
                        top: 0,
                        right: 0,
                        left: 0,
                        child: Image(image:  ExactAssetImage(
                            "assets/images/Red-Flowers.jpg"),
                          fit: BoxFit.cover,)
                      // CachedNetworkImage(
                      //   imageUrl: widget.hotelData.imageUrl,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: FloatingActionButton(

                          backgroundColor: Colors.orange[600],
                          child: icon,
                          onPressed: () {
                            setState(() {
                              isLike = !isLike;
                              icon = !isLike
                                  ? Icon(FontAwesomeIcons.solidHeart)
                                  : Icon(
                                FontAwesomeIcons.solidHeart,
                                color: Colors.red,
                              );
                            });
                          },
                        ))
                  ],
                ),
              ),
            ),
          ),

          SliverFillRemaining(

            child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(20.0),
              child: Column(

                children: <Widget>[

                  _buildTitleInfo(),
                  SizedBox(
                    height: 20.0,
                  ),
                  _buildServiceBar(),
                  SizedBox(
                    height: 20.0,
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildTitleInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "AD 01",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2),
            ),
            SizedBox(
              height: 10.0,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(widget.hotelData.description,
            //     textAlign: TextAlign.justify,
            //   ),
            // ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Expanded(
                    child: Text(
                      // widget.hotelData.description,
                      "xxxxxx",
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              // '\$${widget.hotelData.perMonth}',
              "Flower",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 19.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("1000/=",
              style: TextStyle(color: Colors.grey[400],),),
          ],
        ),
      ],
    );
  }



  _buildServiceBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                  color: Colors.orange[600],
                  borderRadius: BorderRadius.circular(45.0)),
              child: Icon(
                FontAwesomeIcons.phone,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Call Us",
              style: TextStyle(
                color: Colors.grey[400],
              ),),
            SizedBox(
              height: 10.0,
            ),
            // Text(
            //   "12 sqft",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            // ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                  color: Colors.orange[600],
                  borderRadius: BorderRadius.circular(45.0)),
              child: Icon(
                FontAwesomeIcons.mailBulk,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Mail",
              style: TextStyle(
                color: Colors.grey[400],
              ),),
            SizedBox(
              height: 10.0,
            ),
            // Text(
            //   "20 sqft",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            // ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                  color: Colors.orange[600],
                  borderRadius: BorderRadius.circular(45.0)),
              child: Icon(
                FontAwesomeIcons.locationArrow,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Location",
              style: TextStyle(
                color: Colors.grey[400],
              ),),
            SizedBox(
              height: 10.0,
            ),
            // Text(
            //   "80 sqft",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            // ),
          ],
        ),
      ],
    );
  }



  void setState(Null Function() param0) {}
}
