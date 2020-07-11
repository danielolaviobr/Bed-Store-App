import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          colors: [
            Color(0xFF1488CC),
            Color(0xFF2B32B2),
          ],
        ),
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF1488CC).withOpacity(0.5),
            blurRadius: 20.0,
            spreadRadius: 5.0,
            // offset: Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 40.0),
              child: SvgPicture.asset(
                'assets/menu.svg',
                color: Colors.white,
                width: 40,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 40.0),
              child: SvgPicture.asset(
                'assets/cart.svg',
                color: Colors.white,
                width: 40,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0, left: 20.0),
              child: Text(
                'Discover',
                style: TextStyle(
                  fontSize: 45.0,
                  color: Colors.white,
                  fontFamily: 'SFPro',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
