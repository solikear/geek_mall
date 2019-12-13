import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:geek_mall/common/custom_icon.dart';
import 'package:geek_mall/ui/pages/category/category_page.dart';
import 'package:geek_mall/ui/pages/good/detail_webview.dart';
import 'package:geek_mall/ui/pages/good/goodlist_page.dart';
import 'package:geek_mall/ui/test/test_dio.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Widget> _list = List();
  var _controller = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    // debugPrint("进入首页");
    // TODO: implement initState
    // _list..add(HomePage())..add(HomePage())..add(HomePage())..add(HomePage());
    super.initState();
  }

  void _onItemTapped(int index) {
    _controller.jumpToPage(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          GoodsPage(),
          CategoryPage(),
          GoodsPage(),
          WebViewPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CustomIcon.home),
            title: Container(),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), title: Container()),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Container()),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
