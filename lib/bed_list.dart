import 'package:bed_store_app/bed.dart';
import 'package:bed_store_app/bloc/bedhero_bloc.dart';
import 'package:bed_store_app/bloc/bedhero_event.dart';
import 'package:bed_store_app/item_view.dart';
import 'package:bed_store_app/widgets/bed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BedList extends StatelessWidget {
  static String id = '/BedList';

  final yellowBed = Bed(
    title: 'Yellow Bed',
    price: '599.99',
    image: 'assets/bed_top_yellow.png',
    tag: 'YellowBed',
  );

  final whiteBed = Bed(
    title: 'White Bed',
    price: '499.99',
    image: 'assets/bed_top_white.png',
    tag: 'WhiteBed',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: BlocProvider.of<BedHeroBloc>(context),
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                SizedBox(height: 50),
                BedItem(
                  title: yellowBed.title,
                  image: yellowBed.image,
                  price: yellowBed.price,
                  tag: yellowBed.tag,
                  onPress: () {
                    Navigator.pushNamed(context, ItemView.id);
                    BlocProvider.of<BedHeroBloc>(context)
                        .add(UpdateHero(yellowBed));
                  },
                ),
                SizedBox(height: 30),
                BedItem(
                  title: whiteBed.title,
                  image: whiteBed.image,
                  price: whiteBed.price,
                  tag: whiteBed.tag,
                  onPress: () {
                    Navigator.pushNamed(context, ItemView.id);
                    BlocProvider.of<BedHeroBloc>(context)
                        .add(UpdateHero(whiteBed));
                  },
                ),
                SizedBox(height: 500),
              ],
            ),
          );
        },
      ),
    );
  }
}

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
            // offset: Offset(dx, dy)
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
