import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hostelapplication/core/constant/string.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final kTitleStyle = const TextStyle(
    color: Colors.black,
    fontFamily: 'CM Sans Serif',
    fontSize: 18.0,
    height: 1.2,
    fontWeight: FontWeight.bold
  );

  final kSubtitleStyle = const TextStyle(
    color: Colors.grey,
    fontSize: 18.0,
    height: 1.2,
  );
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive? const Color(0xFF7B51D3) : Colors.grey ,
        borderRadius: const BorderRadius.all(const Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                
                SizedBox(
                  height: 600.0,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                'assets/images/onbord1.png',
                                height: 370.0,
                                width: 370.0,
                              ),
                            ),
                            const SizedBox(height: 50.0),
                            Center(
                              child: Text(
                                'FIND PROBLEM',
                                style: kTitleStyle,
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                'Find the problems yoy are facing in your hostel',
                                style: kSubtitleStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                             Center(
                              child: Image.asset(
                                'assets/images/onbord2.png',
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            const SizedBox(height: 50.0),
                            Center(
                              child: Text(
                                'POST YOUR COMPLAINTS',
                                style: kTitleStyle,
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              textAlign: TextAlign.center,
                              'Log in to your account and upload the problem you are facing',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                             Center(
                              child: Image.asset(
                                'assets/images/onbord3.png',
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Center(
                              child: Text(
                                'BE SMART',
                                style: kTitleStyle,
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              textAlign: TextAlign.center,
                              'Thats it! your problem will be shown\nto the management and will\nbe solved soon',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: FractionalOffset.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 TextButton(
                                  onPressed: () {
                                     Navigator.pushReplacementNamed(context, logInScreenRoute);
                                  },
                                  child: const Text(
                                    'Skip',
                                    style: TextStyle(
                                      color:Colors.grey,
                                      fontSize: 22.0,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: const Text(
                                    'Next',
                                    style: TextStyle(
                                      color:Color.fromARGB(209, 116, 66, 224),
                                      fontSize: 22.0,
                                    ),
                                  ),
                                ),
                               
                              ],
                            ),
                          ),
                        ),
                      )
                    : const Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                   Navigator.pushReplacementNamed(context, logInScreenRoute);
                },
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Color(0xFF5B16D0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const Text(''),
    );
  }
}
