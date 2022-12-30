import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {

  String time = '';

  void setUpTime() async{
      WorldTime instance = new WorldTime(location : 'Berlin',flag : 'germany.png',url : 'Europe/Berlin');
      await instance.getTime();

      setState(() {
        time = instance.time;
      });

      Navigator.pushReplacementNamed(context,'/home', arguments: {
        'location' : instance.location,
        'time' : instance.time,
        'flag' : instance.flag,
        'isDay' : instance.isDay
      });
  }
  
  @override
  void initState() {
    super.initState();
    setUpTime();
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: SafeArea(
          child: Center(child: Container(
            color: Colors.indigo,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(24,20,24,20),
                  child: SpinKitFadingFour(
                          color: Colors.white,
                          size: 50.0,
                        ),
                  ),
              ],
          )
            ),
          ),)
    );
  }
}