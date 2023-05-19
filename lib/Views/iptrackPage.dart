import 'package:flutter/material.dart';

class IpTrackPage extends StatefulWidget {
  @override
  State<IpTrackPage> createState() => _IpTrackPageState();
}

class _IpTrackPageState extends State<IpTrackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter an ip address eg 127.0.0.1"
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  // Yet to call the responsible function.
                }, 
                icon: Icon(Icons.search)
                )
            ],
          ),
         Text('Ip Address:'),
          SizedBox(height: 10.0),
          Text('Country:'),
          SizedBox(height: 10.0),
          Text('Region:'),
          SizedBox(height: 10.0)
        ],
      ),
    );
  }
}
