import 'package:cis/views/Mahasiswa/routes/routes_name.dart';
import 'package:cis/views/Mahasiswa/screens/home_screens.dart';
import 'package:cis/views/Mahasiswa/screens/izinkeluar_screens.dart';
import 'package:cis/views/Mahasiswa/screens/login_screens.dart';
import 'package:cis/views/Mahasiswa/screens/register_screens.dart';
import 'package:get/get.dart';

class pageRoute {
  static final page = [
    GetPage(
      name: RouteName.registerMhs,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: RouteName.loginMhs,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RouteName.homeMhs,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteName.ikmhs,
      page: () => IzinKeluarPage(),
    ),
  ];
}
