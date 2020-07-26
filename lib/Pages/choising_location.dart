import 'package:flutter/material.dart';
import 'package:worl_time/Services/world_time.dart';

class ChoosingLocation extends StatefulWidget {
  @override
  _ChoosingLocationState createState() => new _ChoosingLocationState();
}

class _ChoosingLocationState extends State<ChoosingLocation> {
  List<WorldTime> locations = [
    new WorldTime(
        url: 'America/Argentina/Buenos_Aires',
        flag: 'Argentina.png',
        location: 'Buenos Aires'),
    new WorldTime(
        url: 'America/Toronto', flag: 'Canada.png', location: 'Toronto'),
    new WorldTime(
        url: 'Asia/Shanghai', flag: 'China.png', location: 'Shanghai'),
    new WorldTime(url: 'Africa/Cairo', flag: 'Egypt.png', location: 'Cairo'),
    new WorldTime(url: 'Europe/Paris', flag: 'France.png', location: 'Paris'),
    new WorldTime(
        url: 'Europe/Berlin', flag: 'Germany.png', location: 'Berlin'),
    new WorldTime(url: 'Asia/Tokyo', flag: 'Japan.png', location: 'Tokyo'),
    new WorldTime(
        url: 'Afica/Casablanca', flag: 'Morocco.png', location: 'Casablanca'),
    new WorldTime(url: 'Europe/Moscow', flag: 'Russia.png', location: 'Moscow'),
    new WorldTime(
        url: 'Africa/Johannesburg',
        flag: 'South_africa.png',
        location: 'Johannesburg'),
    new WorldTime(
        url: 'Asia/Seoul', flag: 'South_Korea.png', location: 'Seoul'),
    new WorldTime(url: 'Asia/Qatar', flag: 'Qatar.png', location: 'Doha'),
    new WorldTime(url: 'Europe/London', flag: 'UK.png', location: 'London'),
    new WorldTime(
        url: 'America/New_York', flag: 'USA.png', location: 'New York'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Text('Choose a loaction'),
          backgroundColor: Colors.blue[800],
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${locations[index].flag}'),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
