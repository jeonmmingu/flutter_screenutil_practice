import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Size deviceSize = MediaQuery.of(context).size;
    // double designSizeWidth = deviceSize.width;
    // double designSizeHeight = deviceSize.height;
    double designSizeWidth = 360;
    double designSizeHeight = 690;
    int sizeParameter = 1;

    // 만약 ScreenUtil을 사용하고 싶다면, build 단계에서 초기화를 진행해주어야한다.
    // Material 위에 Wrapped 하여 사용하는 방법도 존재한다.
    ScreenUtil.init(
      context,
      designSize: Size(
        designSizeWidth / sizeParameter,
        designSizeHeight / sizeParameter,
      ),
      minTextAdapt: true,
    );

    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // width, height 를 지정할 때, sw, sh를 사용하면 현재 device 화면 비율에 맞춘다.
  // 때문에 designSize 비율에 맞게 UI가 늘어나는 것을 원하면 w, h로 길이를 정해야 한다.
  
  // 또한 폰트 사이즈에 .sp를 붙이는 이유는 고밀도, 저밀도 화면에서 폰트 사이즈를 균일하게 맞추기 위해서 이다.

  // 기본 fontSize는 픽셀 단위에 맞추게 되는데 화면의 밀도가 다르면 픽셀 개수도 달라지게 되어 같은 fontSize여도
  // 다른 화면에서는 다른 사이즈로 보이게 된다.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "안녕하세요",
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
