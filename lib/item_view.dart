import 'package:bed_store_app/bloc/bedhero_bloc.dart';
import 'package:bed_store_app/bloc/bedhero_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemView extends StatelessWidget {
  static String id = '/ItemView';

  Widget buildHero(state) {
    if (state is BedHeroLoading) {
      return CircularProgressIndicator();
    } else if (state is BedHeroDisplay) {
      return Image.asset(state.image);
    } else {
      print(state);
      return CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: BlocProvider.of<BedHeroBloc>(context),
        builder: (context, state) {
          return Center(
            child: Container(
              height: 300,
              width: 300,
              color: Colors.green,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  Hero(
                    tag: state.tag,
                    child: Image.asset(state.image),
                  ),
                  Hero(
                    tag: state.tag,
                    child: Image.asset(state.image),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
