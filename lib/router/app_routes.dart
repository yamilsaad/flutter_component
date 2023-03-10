import 'package:flutter/material.dart';

import 'package:fl_components/models/models.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoutes = 'home';

  static final menuOptions = <MenuOption>[
    //TODO: borrar o comentar home screen
//    MenuOption(route: 'home',name: 'Home Screen',scree: const HomeScreen(),icon: Icons.home_rounded),
    MenuOption(
        route: 'listbiew1',
        name: 'Listview tipo 1',
        scree: const Listview1Screen(),
        icon: Icons.list_alt),
    MenuOption(
        route: 'listview2',
        name: 'Listview tipo 2',
        scree: const Listview2Screen(),
        icon: Icons.list_alt),
    MenuOption(
        route: 'alert',
        name: 'Alertas - Alert',
        scree: const AlertScreen(),
        icon: Icons.add_alert),
    MenuOption(
        route: 'card',
        name: 'Tarjetas - Cards',
        scree: const CardScreen(),
        icon: Icons.credit_card),

    MenuOption(
        route: 'avatar',
        name: 'Circle Avatar',
        scree: const AvatarScreen(),
        icon: Icons.supervised_user_circle_outlined),

    MenuOption(
        route: 'animated',
        name: 'Animated Container',
        scree: const AnimatedScreen(),
        icon: Icons.play_circle_outline_rounded),

    MenuOption(
        route: 'inputs',
        name: 'Text Inputs',
        scree: const InputsScreen(),
        icon: Icons.input_rounded),

    MenuOption(
        route: 'slider',
        name: 'Slider && Checks',
        scree: const SliderScreen(),
        icon: Icons.slideshow_sharp),

    MenuOption(
        route: 'listviewbuilder',
        name: 'InfinitScroll & Pull to Refresh',
        scree: const ListViewBuilderScreen(),
        icon: Icons.build_circle_outlined),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.scree});
    }
    return appRoutes;
  }

  //static Map<String, Widget Function(BuildContext)> routes = {
  //  'home': (BuildContext context) => const HomeScreen(),
  //  'listview1': (BuildContext context) => const Listview1Screen(),
  //  'listview2': (BuildContext context) => const Listview2Screen(),
  //  'alert': (BuildContext context) => const AlertScreen(),
  //  'card': (BuildContext context) => const CardScreen(),
  //};

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
