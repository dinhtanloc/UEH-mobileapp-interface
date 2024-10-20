import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:widgetdemo/widgets/account.dart';
import 'package:widgetdemo/widgets/home.dart'; // Kiểm tra lại đường dẫn này

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;  // Index của tab đang được chọn

  // Danh sách các tiêu đề tương ứng với từng tab
  static const List<String> _titles = <String>[
    'Trang chủ',
    'Thông báo',
    'Điểm danh',
    'Tài khoản',
  ];

  // Các tab sẽ hiển thị nội dung tương ứng khi click
  static const List<Widget> _widgetOptions = <Widget>[
    WebViewScreen(),  // Trang chủ (WebView)
    Text('Thông báo', style: TextStyle(fontSize: 35)),
    Text('Điểm danh', style: TextStyle(fontSize: 35)),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cập nhật tab được chọn
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 90),
          child: Text(
            _titles[_selectedIndex],
            style: TextStyle(
              color: Colors.white, // Set the text color to red
              fontSize: 20, // Optional: Adjust the font size
            ),
          ),
        ), // Tiêu đề AppBar căn giữa
        backgroundColor: Colors.blue, // Màu xanh da trời cho AppBar
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Header chứa logo UEH
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white, // Nền trắng cho Drawer Header
              ),
              child: Center(
                child: Image.asset('assets/images/ueh_logo.png', height: 80), // Thêm ảnh logo UEH
              ),
            ),
            // Tin tức UEH
            ListTile(
              leading: FaIcon(FontAwesomeIcons.newspaper, color: Colors.white), // Icon Tin tức
              title: Text('Tin tức UEH', style: TextStyle(color: Colors.white)),
              tileColor: Colors.orange, // Màu nền cam cho ListTile
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0); // Chuyển đến Tab "Trang chủ"
              },
              shape: Border(
                bottom: BorderSide(color: Colors.white, width: 1), // Border bottom màu trắng
              ),
            ),
            // Sự kiện UEH
            ListTile(
              leading: FaIcon(FontAwesomeIcons.solidCalendarDays, color: Colors.white), // Icon Sự kiện
              title: Text('Sự kiện UEH', style: TextStyle(color: Colors.white)),
              tileColor: Colors.orange, // Màu nền cam cho ListTile
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1); // Chuyển đến Tab "Thông báo"
              },
              shape: Border(
                bottom: BorderSide(color: Colors.white, width: 1), // Border bottom màu trắng
              ),
            ),
            // Xem điểm
            ListTile(
              leading: FaIcon(FontAwesomeIcons.listCheck, color: Colors.white), // Icon Xem điểm
              title: Text('Xem điểm', style: TextStyle(color: Colors.white)),
              tileColor: Colors.orange, // Màu nền cam cho ListTile
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2); // Chuyển đến Tab "Điểm danh"
              },
              shape: Border(
                bottom: BorderSide(color: Colors.white, width: 1), // Border bottom màu trắng
              ),
            ),
            // Thời khóa biểu
            ListTile(
              leading: FaIcon(FontAwesomeIcons.solidCalendar, color: Colors.white), // Icon Thời khóa biểu
              title: Text('Thời khóa biểu', style: TextStyle(color: Colors.white)),
              tileColor: Colors.orange, // Màu nền cam cho ListTile
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(3); // Chuyển đến Tab "Tài khoản"
              },
              shape: Border(
                bottom: BorderSide(color: Colors.white, width: 1), // Border bottom màu trắng
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), // Hiển thị nội dung tương ứng của tab
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),  // Icon Trang chủ
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bullhorn),  // Icon Thông báo
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userCheck),  // Icon Điểm danh
            label: 'Điểm danh',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userTie),  // Icon Tài khoản
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _selectedIndex, // Tab được chọn hiện tại
        selectedItemColor: Colors.blue[900],  // Màu xanh đậm khi được chọn
        unselectedItemColor: Colors.blue,     // Màu xanh da trời khi không được chọn
        onTap: _onItemTapped,  // Hàm xử lý khi click vào các tab
        type: BottomNavigationBarType.fixed, // Giữ các icon cố định
        backgroundColor: Colors.white,       // Màu nền của BottomNavigationBar
        selectedIconTheme: IconThemeData(size: 30), // Kích thước icon khi được chọn
        unselectedIconTheme: IconThemeData(size: 25), // Kích thước icon khi không được chọn
      ),
    );
  }
}
