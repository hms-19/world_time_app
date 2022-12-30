import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';


class ChooseCountry extends StatefulWidget {
  const ChooseCountry({ Key? key }) : super(key: key);

  @override
  _ChooseCountryState createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.black87,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
  );

  List<WorldTime> locations = [
    WorldTime(flag: 'japan.webp',location: 'Japan',url: 'Asia/Japan'),
    WorldTime(flag: 'myanmar.webp',location: 'Myanmar',url: 'Asia/Myanmar'),
    WorldTime(flag: 'malaysia.webp',location: 'Malaysia',url: 'Asia/Malaysia'),
    WorldTime(flag: 'india.webp',location: 'India',url: 'Asia/India'),
    WorldTime(flag: 'qatar.webp',location: 'Qatar',url: 'Asia/Qatar'),
    WorldTime(flag: 'israel.webp',location: 'Israel',url: 'Asia/Israel'),

  ];

  void updateCountry (index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context,{
      'location' : instance.location,
      'time' : instance.time,
      'flag' : instance.flag,
      'isDay' : instance.isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Country'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.0,vertical: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateCountry(index);
                  },

                  title: Text(locations[index].location.toString()),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ),
    );
  }
}