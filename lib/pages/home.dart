import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Color.fromARGB(221, 48, 47, 47),
    backgroundColor: Colors.indigo,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  Map data = {};
  

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map; 

    String bgImg = data['isDay'] ? 'day.webp' : 'night.jpg';

    // print(data);

    return Scaffold(
        appBar: AppBar(
          title: Text('Country Time'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body:  Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImg'),
                fit: BoxFit.cover

              )
            ),
            child:  Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: ElevatedButton.icon(
                icon: const Icon(Icons.location_city_outlined, size: 18),
                label: Text('Choose Country'),
                onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context,'/choose_country');
                  setState(() {
                    data['location'] = result['location'];
                    data['time'] = result['time'];
                    data['flag'] = result['flag'];
                    data['isDay'] = result['isDay'];

                  });
                },
              ),),
              SizedBox(height: 20),
              Text(
                data["location"],
                style: TextStyle(
                  color: Color.fromARGB(255, 227, 228, 233),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20),
              Text(
                data["time"],
                style: TextStyle(
                  color: Color.fromARGB(255, 250, 250, 250),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          )
        
    );
  }
}