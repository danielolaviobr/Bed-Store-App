import 'package:bed_store_app/bed_list.dart';
import 'package:bed_store_app/bloc/bedhero_bloc.dart';
import 'package:bed_store_app/item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyBed());
}

class MyBed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BedHeroBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          BedList.id: (context) => BedList(),
          ItemView.id: (context) => ItemView(),
        },
        initialRoute: BedList.id,
      ),
    );
  }
}
