import 'package:flutter/material.dart';

class BedItem extends StatelessWidget {
  BedItem({this.image, this.price, this.title, this.tag, this.onPress});
  final Function onPress;
  final String tag;
  final String image;
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              alignment: Alignment.topRight,
              // padding: EdgeInsets.only(right: 0),
              width: 270,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 10),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    this.title,
                    style: TextStyle(
                      fontFamily: 'Warownia',
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: this.onPress,
                        child: Container(
                          alignment: Alignment.topCenter,
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Color(0xFF1F76DE),
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF1F76DE).withOpacity(0.2),
                                blurRadius: 5,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Text(
                            'Buy',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'Warownia',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 25),
                      Container(
                        padding: EdgeInsets.only(right: 10.0),
                        alignment: Alignment.centerRight,
                        child: Text(
                          '€ ${this.price}',
                          style: TextStyle(
                            fontFamily: 'Warownia',
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Container(
            width: 130,
            height: 170,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 4),
                  blurRadius: 10,
                  spreadRadius: 3,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          child: Hero(
            tag: this.tag,
            child: Image.asset(this.image),
          ),
          width: 180,
        ),
      ],
    );
  }
}
