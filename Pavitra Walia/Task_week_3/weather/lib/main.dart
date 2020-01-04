import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './ui/klimatic.dart';



String _apiUrl2 = "https://api.openweathermap.org/data/2.5/forecast?q=delhi&appid=55e8d39f6c1a038205ca25270f6ef7ff&units=metric";


List _provider2;

void main() async {
  
  _provider2 =await fetchData(_apiUrl2);


  runApp(new MaterialApp(
    home: new Climate(),
  ));

}
class Climate extends StatelessWidget {
  void showStuff() async {
    print("hi");
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WEATHER"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              padding:const EdgeInsets.all(12.0),
              color:Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<Map>(builder: (BuildContext context){
                    return new Klimatic();
                  })
                );
              },
              child:new Text("Today's weather",
              style: new TextStyle(
                fontSize: 21.0,
                color: Colors.white,
              ),),
              
              ),
              new RaisedButton(
              padding:const EdgeInsets.all(12.0),
              color:Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context)=> new Forecast(provider: _provider2,))
                );
              },
              child:new Text("Get Forecast",
              style: new TextStyle(
                fontSize: 21.0,
                color: Colors.white,
              ),),
              
              ),

          ],
        )
      )
      
    );
  }
}


class Forecast extends StatelessWidget {
  final List provider;
  Forecast({Key key,@required this.provider}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("weather"),
        centerTitle: true,
      ),
      body: new Center(
        child: new ListView.builder(
          padding: const EdgeInsets.all(15.0),
          itemCount:provider.length,
          itemBuilder: (BuildContext context, int position){
            if(position.isOdd)return new Divider(
              color: Colors.red,
              );
              final index = position ~/2;
              return new ListTile(
                title: new Text(
                  "Temp:${provider[index]['main']['temp'].toString()} °C",
                style: new TextStyle(
                  fontSize: 18.9,
                  fontWeight: FontWeight.bold)),

                  subtitle: new Text("${provider[index]['dt_txt']}"),

              );
          },
        )
      )
      
    );
  }
}
  Future<List> fetchData(String apiUrl) async {
    http.Response response = await http.get(apiUrl);
    return(json.decode(response.body))['list'];
  }