import 'package:app_inspection/Screens/InspectionScreens/service_order_ins.dart';
import 'package:app_inspection/Screens/PhotoDocScreens/service_orders.dart';
import 'package:app_inspection/Screens/vehicle_general_screen.dart';
import 'package:app_inspection/generated/l10n.dart';
import 'package:app_inspection/widgets/navigation_helpers.dart';
import 'package:flutter/material.dart';
import 'package:app_inspection/Screens/Login_Screen.dart';
import 'package:app_inspection/Screens/Profile.dart';
import 'package:app_inspection/widgets/custom_app_bar_bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  final String id;
  final String username;
  const HomeScreen({super.key, required this.id, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _paginaActual = 0;
  late List<Widget> _paginas;

  @override
  void initState() {
    super.initState();
    _paginas = [
      HomeScreen(id: widget.id, username: widget.username),
      VehicleGeneralScreen(id: widget.id, username: widget.username),
      ServiceOrderIns(id: widget.id, username: widget.username),
      ServiceOrderScreen(id: widget.id, username: widget.username),
      Profile(id: widget.id, username: widget.username)
    ];
  }

  void _onTabSelected(int index) {
    if (index != _paginaActual) {
      setState(() {
        _paginaActual = index;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => _paginas[index]),
      );
    }
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      createBackRoute(
        LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundImage = isDark
        ? 'assets/tr_background_dark.png'
        : 'assets/tr_background_light.png';
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomAppBarBottomNav(
        title: S.current.title_home,
        currentIndex: _paginaActual,
        onTabSelected: _onTabSelected,
        id: widget.id,
        username: widget.username,
        onLogout: _logout,
      ),
    );
  }
}
