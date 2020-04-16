import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
      child: InkWell(
        splashColor: Colors.black54,
        onTap: () => {},
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.person),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                     'buibibub' ,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
