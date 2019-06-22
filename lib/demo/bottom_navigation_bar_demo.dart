import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarDemoState();
  }
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
        
        //底部导航-激活状态索引默认值
        int _currentIndex = 0;
        //底部导航-激活状态点击事件
        void _onTapHandler (int index) {
            setState((){
              _currentIndex = index;
            });
        }

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
            //激活状态-索引
            currentIndex: _currentIndex,      
            //调用_onTapHandler()方法
            onTap: _onTapHandler,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.black,   //选中激活状态下颜色的
                 
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                title: Text('Explore'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                title: Text('History'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text('List'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('My'),
              ),
            ],
          );
  }

}