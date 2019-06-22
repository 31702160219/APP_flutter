import 'package:flutter/material.dart';
import './demo/bottom_navigation_bar_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      //主题
      theme: ThemeData(
        primarySwatch: Colors.yellow, //APP主题颜色
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5), //主题高亮颜色
        splashColor: Colors.white70, //头部水波纹颜色
      ),
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        //BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => debugPrint('点击搜索按钮.'),
            ),
          ],
          
          // leading: IconButton(     //leading是在左边创建图标
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigration',
          //   onPressed: () => debugPrint('点击菜单按钮.'),
          // ),
          title: Text('NINGHAO'),
          elevation: 0.0,
          bottom: TabBar(
            //调整未被选择标签颜色
            unselectedLabelColor: Colors.black38,
            // indicatorColor: Colors.black54,            //被选中标签下划线颜色
            // indicatorSize: TabBarIndicatorSize.label,  //下划线长度与标签长度一致
            indicatorWeight: 2.0, //调整下划线粗细
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.local_activity),
              ),
              Tab(
                icon: Icon(Icons.label_important),
              ),
              Tab(
                icon: Icon(Icons.label_outline),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.local_activity, size: 128.0, color: Colors.black12),
            Icon(Icons.label_important, size: 128.0, color: Colors.black12),
            Icon(Icons.label_outline, size: 128.0, color: Colors.black12),
          ],
        ),

        
        //侧边抽屉
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[

              //1.1侧边栏头部(存放用户信息)
                UserAccountsDrawerHeader(
                  accountName: Text('赖康翔', style:TextStyle(fontWeight: FontWeight.bold)),
                  accountEmail: Text('laikangxiang@qq.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage('https://resources.ninghao.org/images/wanghao.jpg'),
                  ),
                  //设置用户信息盒子的装饰
                  decoration: BoxDecoration(
                    color: Colors.yellow[400],
                    image: DecorationImage(
                      image: NetworkImage('https://resources.ninghao.org/images/childhood-in-a-picture.jpg'),
                      fit: BoxFit.cover,    //让图片填充满盒子
                      //滤镜
                      colorFilter: ColorFilter.mode(
                        Colors.grey[100].withOpacity(0.5), 
                        BlendMode.hardLight,
                        ),
                    ),
                  ),
                ),
              //1.2侧边栏头部(存放文本信息)
                // DrawerHeader(
                //   child: Text('header'.toLowerCase()),
                //   decoration: BoxDecoration(
                //     //设置背景浅灰色
                //     color: Colors.grey[100],
                //   ),
                // ),



              //2.侧边栏标题1
              ListTile(
                title: Text('Messages',textAlign: TextAlign.left),
                trailing: Icon(Icons.message, color:Colors.black12,size: 25.0),
                //创建事件调用pop方法返回到主界面
                onTap: () => Navigator.pop(context),
              ),
              //2.侧边栏标题2
              ListTile(
                title: Text('Favorite',textAlign: TextAlign.left),
                trailing: Icon(Icons.favorite, color:Colors.black12,size: 25.0),
              ),
              //2.侧边栏标题3
              ListTile(
                title: Text('Settings',textAlign: TextAlign.left),
                //trailing是在右边创建图标 
                trailing: Icon(Icons.settings, color:Colors.black12,size: 25.0),
              ),
            ],
          ),
        ),


          //3.底部导航栏,引入封装好的BottomNavigationBarDemo类
          bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
