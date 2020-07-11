import 'package:bed_store_app/bed.dart';
import 'package:bed_store_app/bloc/bedhero_bloc.dart';
import 'package:bed_store_app/bloc/bedhero_event.dart';
import 'package:bed_store_app/item_view.dart';
import 'package:bed_store_app/widgets/bed_item.dart';
import 'package:bed_store_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BedList extends StatelessWidget {
  static String id = '/BedList';

  final yellowBed = Bed(
    title: 'Yellow Bed',
    price: '599.99',
    image: 'assets/bed_top_yellow.png',
    tag: 'YellowBed',
    description: 'Nice Yellow bed with pillows and blankets',
  );

  final whiteBed = Bed(
    title: 'White Bed',
    price: '499.99',
    image: 'assets/bed_top_white.png',
    tag: 'WhiteBed',
    description: 'Nice White bed with pillows and blankets',
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.dark));
    return Scaffold(
      body: BlocBuilder(
        bloc: BlocProvider.of<BedHeroBloc>(context),
        builder: (context, state) {
          return SingleChildScrollView(
            physics: ClampingScrollPhysics(),
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
