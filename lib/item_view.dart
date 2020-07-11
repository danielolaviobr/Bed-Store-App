import 'package:bed_store_app/bloc/bedhero_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemView extends StatelessWidget {
  static String id = '/ItemView';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.black, statusBarBrightness: Brightness.light));
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 80),
          Container(
            width: double.infinity,
            height: 300,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: [
                BedDisplay(),
                BedDisplay(),
              ],
            ),
          ),
          SizedBox(height: 20),
          BedInfo()
        ],
      ),
    );
  }
}

class BedInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<BedHeroBloc>(context),
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 400,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1488CC),
                Color(0xFF2B32B2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF1488CC).withOpacity(0.5),
                blurRadius: 20.0,
                spreadRadius: 5.0,
              )
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                state.title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Warownia',
                  fontSize: 45,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  state.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SFPro',
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                  child: FlatButton(
                    onPressed: () {
                      print('Buying');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: double.infinity,
                      child: Text(
                        'Buy for €${state.price}',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SFPro',
                          fontSize: 20,
                        ),
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF79B31D).withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                          )
                        ],
                        borderRadius: BorderRadius.circular(50.0),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF79B31D), Color(0xFF56ab2f)],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BedDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<BedHeroBloc>(context),
      builder: (context, state) {
        return Hero(
          tag: state.tag,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 260,
                width: 230,
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
              Image.asset(state.image),
            ],
          ),
        );
      },
    );
  }
}
