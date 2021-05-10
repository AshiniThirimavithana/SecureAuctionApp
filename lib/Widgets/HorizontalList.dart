import 'package:flutter/material.dart';
import '../Pages/ItemBid.dart';

class HorizontalList extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_caption: 'Books',
          ),
          Category(
            image_caption: 'Posters',
          ),
          Category(
            image_caption: 'Coins',
          ),
          Category(
            image_caption: 'Arts',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_caption;
  Category({this.image_caption});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 100.0,
            child: ListTile(
              title: Text(
                image_caption,
                style: new TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ));
  }
}
