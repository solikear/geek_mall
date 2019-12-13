import 'package:flutter/material.dart';

class TabCategory extends StatefulWidget {
  @override
  _TabCategoryState createState() => _TabCategoryState();
}

class _TabCategoryState extends State<TabCategory> {
  int _selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (c, i) {
          return _categoryWidget(i);
        },
      ),
    );
  }

  _itemClick(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  Widget _categoryWidget(int index) {
    return GestureDetector(
      onTap: () => _itemClick(index),
      child: Container(
        width: 100.0,
        height: 50.0,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              height: 48.0,
              alignment: Alignment.center,
              child: Text(
                "居家",
                style: index == _selectIndex
                    ? TextStyle(fontSize: 14.0, color: Colors.deepOrangeAccent)
                    : TextStyle(fontSize: 14.0, color: Colors.black54),
              ),
            ),
            Divider(
              color: index == _selectIndex
                  ? Colors.deepOrangeAccent
                  : Colors.white,
              height: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
