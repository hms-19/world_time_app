import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String? location = '';
  String time = '';
  String? flag = '';
  String? url = '';
  bool isDay = false;

  WorldTime({this.flag,this.location,this.url});


  Future<void> getTime() async {
      try{
        http.Response response = await http.get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
        Map data = jsonDecode(response.body);

        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1,3);

        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));

        time = DateFormat.jm().format(now);

        isDay = now.hour > 6 && now.hour < 20 ? true : false;
        
      }
      catch(e) {
        print('Error $e');
        time = 'could not time data';
      }
  }


}


