import 'package:flutter/material.dart';

class CartMenuCard extends StatefulWidget {
  final String item;

  const CartMenuCard({Key key, this.item}) : super(key: key);
  @override
  _CartMenuCardState createState() => _CartMenuCardState();
}

class _CartMenuCardState extends State<CartMenuCard> {
  String item;
  @override
  void initState() {
    // TODO: implement initState
    item = widget.item;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double wrem = width / 100;
    double hrem = height / 100;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context){
            return Container();
          }
        );
      },
      child: Container(
        // constraints: BoxConstraints.expand(),
        color: Colors.grey[100],
        // width: 13 * wrem,
        height: 3 * hrem,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 1 * wrem),
              child: Text(item),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
