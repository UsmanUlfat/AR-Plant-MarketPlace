// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:ar_base_plant_app/view/seller/cart_page.dart';
// import 'package:ar_base_plant_app/view/seller/favorite_page.dart';
// import 'package:ar_base_plant_app/view/seller/home_page.dart';
// import 'package:ar_base_plant_app/view/seller/predict_screen.dart';
// import 'package:ar_base_plant_app/view/seller/profile_page.dart';
// import 'package:flutter/material.dart';
//
// import 'package:page_transition/page_transition.dart';
//
// import '../../model/plants.dart';
// import '../../utils/colors.dart';
// import '../../utils/constants.dart';
// import 'armodels.dart';
//
// class RootPage extends StatefulWidget {
//   const RootPage({super.key});
//
//   @override
//   State<RootPage> createState() => _RootPageState();
// }
//
// class _RootPageState extends State<RootPage> {
//   List<Plant> favorites = [];
//   List<Plant> myCart = [];
//
//   int _bottomNavIndex = 0;
//
//   //List of the pages
//   List<Widget> _widgetOptions() {
//     return [
//       const HomePage(),
//       FavoritePage(
//         favoritedPlants: favorites,
//       ),
//       CartPage(
//         addedToCartPlants: myCart,
//       ),
//       const ProfilePage(),
//     ];
//   }
//
//   //List of the pages icons
//   List<IconData> iconList = [
//     Icons.home,
//     Icons.favorite,
//     Icons.shopping_cart,
//     Icons.person,
//   ];
//
//   //List of the pages titles
//   List<String> titleList = [
//     'Home',
//     'Favorite',
//     'Cart',
//     'Profile',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               titleList[_bottomNavIndex],
//               style: TextStyle(
//                 color: Constants.blackColor,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 24,
//               ),
//             ),
//             Icon(
//               Icons.notifications,
//               color: Constants.blackColor,
//               size: 30.0,
//             )
//           ],
//         ),
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 0.0,
//       ),
//       body: IndexedStack(
//         index: _bottomNavIndex,
//         children: _widgetOptions(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//               context,
//               PageTransition(
//                   child: PredictScreen(),
//                   type: PageTransitionType.bottomToTop));
//         },
//         backgroundColor: Constants.primaryColor,
//         child: Image.asset(
//           'assets/images/code-scan-two.png',
//           height: 30.0,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: AnimatedBottomNavigationBar(
//           splashColor: Constants.primaryColor,
//           activeColor: Constants.primaryColor,
//           inactiveColor: Colors.black.withOpacity(.5),
//           icons: iconList,
//           activeIndex: _bottomNavIndex,
//           gapLocation: GapLocation.center,
//           notchSmoothness: NotchSmoothness.softEdge,
//           onTap: (index) {
//             setState(() {
//               _bottomNavIndex = index;
//               final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
//               final List<Plant> addedToCartPlants = Plant.addedToCartPlants();
//
//               favorites = favoritedPlants;
//               myCart = addedToCartPlants.toSet().toList();
//             });
//           }),
//
//     );
//   }
// }

// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:ar_base_plant_app/view/seller/cart_page.dart';
// import 'package:ar_base_plant_app/view/seller/favorite_page.dart';
// import 'package:ar_base_plant_app/view/seller/home_page.dart';
// import 'package:ar_base_plant_app/view/seller/predict_screen.dart';
// import 'package:ar_base_plant_app/view/seller/profile_page.dart';
// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
// import '../../model/plants.dart';
// import '../../utils/colors.dart';
// import '../../utils/constants.dart';
// import 'armodels.dart';
//
// class RootPage extends StatefulWidget {
//   const RootPage({super.key});
//
//   @override
//   State<RootPage> createState() => _RootPageState();
// }
//
// class _RootPageState extends State<RootPage> {
//   List<Plant> favorites = [];
//   List<Plant> myCart = [];
//
//   int _bottomNavIndex = 0;
//   bool _isVisible = false;
//
//   //List of the pages
//   List<Widget> _widgetOptions() {
//     return [
//       const HomePage(),
//       FavoritePage(
//         favoritedPlants: favorites,
//       ),
//       CartPage(
//         addedToCartPlants: myCart,
//       ),
//       const ProfilePage(),
//     ];
//   }
//
//   //List of the pages icons
//   List<IconData> iconList = [
//     Icons.home,
//     Icons.favorite,
//     Icons.shopping_cart,
//     Icons.person,
//   ];
//
//   //List of the pages titles
//   List<String> titleList = [
//     'Home',
//     'Favorite',
//     'Cart',
//     'Profile',
//   ];
//
//   void _toggleButtons() {
//     setState(() {
//       _isVisible = !_isVisible;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               titleList[_bottomNavIndex],
//               style: TextStyle(
//                 color: Constants.blackColor,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 24,
//               ),
//             ),
//             Icon(
//               Icons.notifications,
//               color: Constants.blackColor,
//               size: 30.0,
//             )
//           ],
//         ),
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 0.0,
//       ),
//       body: IndexedStack(
//         index: _bottomNavIndex,
//         children: _widgetOptions(),
//       ),
//       floatingActionButton: Stack(
//         children: [
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 80.0), // Adjust as needed
//               child: FloatingActionButton(
//                 onPressed: _toggleButtons,
//                 backgroundColor: Constants.primaryColor,
//                 child: Icon(Icons.add),
//                 heroTag: null,
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Visibility(
//                   visible: _isVisible,
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 80.0), // Adjust as needed
//                     child: FloatingActionButton(
//                       shape: CircleBorder(eccentricity: 0.5),
//                       backgroundColor: AppColors.robotbookColor,
//                       elevation: 0.5,
//                       splashColor: AppColors.appColor3,
//                       hoverColor: AppColors.appColor3,
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const Model(),
//                           ),
//                         );
//                       },
//                       child: Icon(Icons.camera),
//                       heroTag: 'cameraButton',
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 0),
//                 Visibility(
//                   visible: _isVisible,
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 80.0), // Adjust as needed
//                     child: FloatingActionButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           PageTransition(
//                             child: PredictScreen(),
//                             type: PageTransitionType.bottomToTop,
//                           ),
//                         );
//                       },
//                       backgroundColor: Constants.primaryColor,
//                       child: Image.asset(
//                         'assets/images/code-scan-two.png',
//                         height: 30.0,
//                       ),
//                       heroTag: 'predictButton',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: AnimatedBottomNavigationBar(
//         splashColor: Constants.primaryColor,
//         activeColor: Constants.primaryColor,
//         inactiveColor: Colors.black.withOpacity(.5),
//         icons: iconList,
//         activeIndex: _bottomNavIndex,
//         gapLocation: GapLocation.center,
//         notchSmoothness: NotchSmoothness.softEdge,
//         onTap: (index) {
//           setState(() {
//             _bottomNavIndex = index;
//             final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
//             final List<Plant> addedToCartPlants = Plant.addedToCartPlants();
//
//             favorites = favoritedPlants;
//             myCart = addedToCartPlants.toSet().toList();
//           });
//         },
//       ),
//     );
//   }
// }


import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ar_base_plant_app/view/seller/cart_page.dart';
import 'package:ar_base_plant_app/view/seller/favorite_page.dart';
import 'package:ar_base_plant_app/view/seller/home_page.dart';
import 'package:ar_base_plant_app/view/seller/predict_screen.dart';
import 'package:ar_base_plant_app/view/seller/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../model/plants.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import 'armodels.dart';
import 'armodelsroot.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Plant> favorites = [];
  List<Plant> myCart = [];

  int _bottomNavIndex = 0;
  bool _isVisible = false;

  // List of the pages
  List<Widget> _widgetOptions() {
    return [
      const HomePage(),
      FavoritePage(
        favoritedPlants: favorites,
      ),
      CartPage(
        addedToCartPlants: myCart,
      ),
      const ProfilePage(),
    ];
  }

  // List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  // List of the pages titles
  List<String> titleList = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];

  void _toggleButtons() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _closeButtons() {
    if (_isVisible) {
      setState(() {
        _isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _closeButtons,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleList[_bottomNavIndex],
                style: TextStyle(
                  color: Constants.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),

            ],
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
        ),
        body: IndexedStack(
          index: _bottomNavIndex,
          children: _widgetOptions(),
        ),
        floatingActionButton: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80.0), // Adjust as needed
                child: FloatingActionButton(
                  onPressed: _toggleButtons,
                  backgroundColor: Constants.primaryColor,
                  child: Icon(Icons.add),
                  heroTag: null,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible: _isVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 80.0), // Adjust as needed
                      child: FloatingActionButton(
                        shape: CircleBorder(eccentricity: 0.5),
                        backgroundColor: AppColors.robotbookColor,
                        elevation: 0.5,
                        splashColor: AppColors.appColor3,
                        hoverColor: AppColors.appColor3,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  Armodels(),
                            ),
                          );
                        },
                        child: Icon(Icons.camera),
                        heroTag: 'cameraButton',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Visibility(
                    visible: _isVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 80.0), // Adjust as needed
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: PredictScreen(),
                              type: PageTransitionType.bottomToTop,
                            ),
                          );
                        },
                        backgroundColor: Constants.primaryColor,
                        child: Image.asset(
                          'assets/images/code-scan-two.png',
                          height: 30.0,
                        ),
                        heroTag: 'predictButton',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Constants.primaryColor,
          activeColor: Constants.primaryColor,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
              final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
              final List<Plant> addedToCartPlants = Plant.addedToCartPlants();

              favorites = favoritedPlants;
              myCart = addedToCartPlants.toSet().toList();
            });
          },
        ),
      ),
    );
  }
}
