import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import '../utils/responsive_layout.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List isHovering = [false, false, false, false];
    List isHoveringMiniMenu = [false, false, false, false];
    int _selectedScreenIndex = 0;

    // Generate a massive list of dummy products
    final myProducts = List<String>.generate(16, (i) => 'Country Item $i');

    void _selectScreen(int index) {
      setState(() {
        _selectedScreenIndex = index;
      });
    }

    //     final List _screens = [
    //   {"screen": const ScreenA(), "title": "Screen A Title"},
    //   {"screen": const ScreenB(), "title": "Screen B Title"}
    // ];
    log(screenSize.toString());
    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: ResponsiveLayout.isSmallScreen(context) &&
                defaultTargetPlatform == TargetPlatform.android
            ? BottomNavigationBar(
                backgroundColor: const Color.fromARGB(69, 67, 67, 67),
                currentIndex: _selectedScreenIndex,
                onTap: _selectScreen,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Screen A'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "Screen B")
                ],
              )
            : null,
        extendBodyBehindAppBar: true,
        appBar: ResponsiveLayout.isSmallScreen(context)
            ? AppBar(
                // for smaller screen sizes
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'TOUR DE RECIPE',
                  style: TextStyle(
                    color: Colors.blueGrey.shade100,
                    fontSize: 20,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3,
                  ),
                ),
              )
            : PreferredSize(
                preferredSize: Size(screenSize.width, 1000),
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 55),
                          child: Text(
                            'TOUR DE RECIPE',
                            style: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 213, 207, 209)),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    isHovering[0] = value;
                                  });
                                },
                                onTap: () {},
                                child: Text(
                                  'Discover'.tr,
                                  style: const TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontSize: 18,
                                      color:
                                          Color.fromARGB(255, 207, 193, 198)),
                                ),
                              ),
                              SizedBox(width: screenSize.width / 20),
                              Flexible(
                                child: InkWell(
                                  onHover: (value) {
                                    setState(() {
                                      isHovering[1] = value;
                                    });
                                  },
                                  onTap: () {},
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    'Contact Us'.tr,
                                    style: const TextStyle(
                                        fontFamily: 'Comfortaa',
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 199, 190, 193)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onHover: (value) {
                            setState(() {
                              isHovering[2] = value;
                            });
                          },
                          onTap: () {},
                          child: Text(
                            'Sign Up'.tr,
                            style: const TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: 18,
                                color: Color.fromARGB(255, 218, 204, 209)),
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width / 50,
                        ),
                        InkWell(
                          onHover: (value) {
                            setState(() {
                              isHovering[3] = value;
                            });
                          },
                          onTap: () {},
                          child: Text(
                            'Login'.tr,
                            style: const TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: 18,
                                color: Color.fromARGB(255, 219, 207, 211)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: screenSize.width,
                  height: ResponsiveLayout.isLargeScreen(context)
                      ? screenSize.height * 0.5
                      : screenSize.height * 0.4,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7), BlendMode.srcATop),
                    child: Container(
                      foregroundDecoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0, 0.5],
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/bg.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Welcome to The tour of the worlds recipe Here you can enjoy the best recipes from all over the world.'
                          .tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                          fontSize: ResponsiveLayout.isLargeScreen(context)
                              ? 30
                              : 25),
                    ),
                  ),
                ),
                ResponsiveLayout.isSmallScreen(context)
                    ? Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    isHoveringMiniMenu[0] = value;
                                  });
                                },
                                onTap: () {},
                                child: const Icon(
                                  Icons.explore,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    isHoveringMiniMenu[1] = value;
                                  });
                                },
                                onTap: () {},
                                child: const Icon(
                                  Icons.contact_mail,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    isHoveringMiniMenu[2] = value;
                                  });
                                },
                                onTap: () {},
                                child: const Icon(
                                  Icons.app_registration,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    isHoveringMiniMenu[3] = value;
                                  });
                                },
                                onTap: () {},
                                child: const Icon(
                                  Icons.login_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            Expanded(
                child: SizedBox(
              width: screenSize.width,
              height: ResponsiveLayout.isLargeScreen(context)
                  ? screenSize.height * 0.5
                  : screenSize.height * 0.4,
              child: Container(
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.5],
                  ),
                ),
                child: ImageSlideshow(
                  width: double.infinity,
                  initialPage: 0,
                  indicatorRadius: 0.1,
                  indicatorColor: const Color.fromARGB(255, 99, 99, 99),
                  indicatorBackgroundColor:
                      const Color.fromARGB(255, 35, 35, 35),
                  onPageChanged: (value) {
                    debugPrint('Page changed: $value');
                  },
                  autoPlayInterval: 4000,
                  isLoop: true,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Image.asset(
                            'assets/images/fr.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                            child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'France',
                            style: TextStyle(
                                fontFamily: 'Comfortaa',
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 70),
                          ),
                        ))
                      ],
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Image.asset(
                            'assets/images/gb.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                            child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'England',
                            style: TextStyle(
                                fontFamily: 'Comfortaa',
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 70),
                          ),
                        ))
                      ],
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Image.asset(
                            'assets/images/gr.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                            child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Greece',
                            style: TextStyle(
                                fontFamily: 'Comfortaa',
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 70),
                          ),
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ))
          ],
        ));
  }
}
