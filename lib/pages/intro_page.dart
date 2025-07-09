import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: DefaultTabController(
          length: 3,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [ 
                  Color(0xFFCE048C),// warna atas
                  Color(0xFF4D0A8E),
                ],
              ),
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.only(
              top: screenHeight * 0.05,       // 8% dari tinggi layar
              left: screenWidth * 0.075,      // 7.5% dari lebar layar
              right: screenWidth * 0.075,
              bottom: 0,
            ),
              child: SingleChildScrollView(
                child: Column(
                  children:[
                     SizedBox(height: screenHeight * 0.02),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SmoothPageIndicator(
                                      controller: _controller,
                                      count: 3,
                                      effect: const ExpandingDotsEffect(
                                        dotHeight: 6,
                                        dotWidth: 6,
                                        spacing: 8,
                                        expansionFactor: 3, // Bikin titik aktif jadi oval
                                        dotColor: Colors.white38,
                                        activeDotColor: Colors.white,
                                      ),
                                    ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.72, 
                  child: PageView(
                    controller: _controller,
                    children: [
                      Center(child: Image.asset("assets/icons/1.png")),
                      Center(child: Image.asset("assets/icons/1.png")),
                      Center(child: Image.asset("assets/icons/1.png")),
                    ],
                    ), 
                  ),
                   SizedBox(height: screenHeight * 0.03),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/homepage');
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.0125, // setara 10px-an tergantung device
                        horizontal: screenWidth * 0.045, // setara 18px-an
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.0125, // setara 5px-an
                        ),
                
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                BoxShadow(
                  color: Colors.white,
                ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                Text(
                  "LOG IN",
                  style: TextStyle(
                    color: Color(0xFFFF5500),
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/homepage');
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.0125, // setara 10px-an tergantung device
                          horizontal: screenWidth * 0.045, // setara 18px-an
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: screenWidth > 500 ? 24 : screenWidth * 0.05, // setara 5px-an
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                Text(
                  "SKIP",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    SvgPicture.asset('assets/icons/9.svg')
                  ]
                ),
              ),
            ),
          ),
        ),
      );
  }
}
