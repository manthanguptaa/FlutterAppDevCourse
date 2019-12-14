
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// main app
class MyApp extends StatelessWidget {
  static const String _title = 'First Flutter UI Login Page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: new ThemeData(
  primarySwatch: Colors.grey,
  primaryTextTheme: TextTheme(
    title: TextStyle(
      color: Colors.yellow,
    )
  )
),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Text('This is a sample layout to create a login page '),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Field cannot empty';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter Password',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Field cannot empty';
              }
              return null;
            },
          ),
           TextFormField(
            decoration: const InputDecoration(
              hintText: 'Re-enter Password',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Field cannot empty';
              }
              return null;
            },
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: RaisedButton(
                color: Colors.grey,
              onPressed: () {
                
                if (_formKey.currentState.validate()) {
                  //code for functionality
                }
              },
              child: Text('Submit'),
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: RaisedButton(
              color: Colors.grey,
              onPressed: () {
          
                if (_formKey.currentState.validate()) {
                  // code for functionality
                }
              },
              child: Text('Forgot Passord'),
            ),
          ),
          Text('Basic Layout Creation Task-1 Pavitra walia'),
        ],
      ),
    );
  }
}
