import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart'; // Dùng để tạo barcode
import 'package:qr_flutter/qr_flutter.dart'; // Dùng để tạo QR code

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            Expanded(
              flex: 2, // Tỉ lệ 2 phần
              child: Container(
                width: 200,  // Set the width of the container
                height: 50,  // Set the height of the container
                padding: EdgeInsets.only(left: 10, right: 10),
                child: FittedBox(
                  fit: BoxFit.contain, // This will ensure the barcode fits within the container
                  child: BarcodeWidget(
                    data: '31241021234', // Dữ liệu barcode
                    barcode: Barcode.code128(), // Dạng barcode
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3, // Tỉ lệ 3 phần
              child: Container(
                color: Colors.orange, // Màu cam cho phần dưới
                padding: EdgeInsets.only(top: 80), // Chừa khoảng trống cho ảnh đại diện
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ngày sinh',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              '16/09/2006',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Giới tính',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'Nữ',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Khóa',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'DHCQK55',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Nơi sinh',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'Hải Phòng',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Hệ',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'Đại học',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Niên học: 2024 - 2027',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green, // Color of the border
                                    width: 3, // Border width of 2 pixels
                                  ), // Optional: Add rounded corners if you like
                                ),
                                child: QrImageView(
                                  data: '31241021234', // Dữ liệu QR code
                                  version: QrVersions.auto,
                                  size: 100,
                                  gapless: false,  // Loại bỏ khoảng trắng giữa các ô QR
                                  foregroundColor: Colors.black, // Set the QR code color to blue
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedBuilder(
                  animation: _glowAnimation,
                  builder: (context, child) {
                    return Container(
                      margin: EdgeInsets.only(right: 50),
                      width: 150, // Đặt chiều rộng của ảnh
                      height: 200, // Đặt chiều cao của ảnh
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white, // Màu viền trắng
                          width: 4, // Độ dày viền
                        ),
                        borderRadius: BorderRadius.circular(10), // Bo góc viền
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.6), // Màu glow
                            blurRadius: _glowAnimation.value, // Giá trị thay đổi theo animation
                            spreadRadius: 10, // Độ lan rộng của glow
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5), // Bo góc cho ảnh
                        child: Image.asset(
                          'assets/images/avatar.jpg', // Đường dẫn ảnh local
                          fit: BoxFit.fill, // Căn chỉnh ảnh
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 200),
          child: Text(
            'Nguyễn Thùy Dương',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ),
      ],
    );
  }
}