import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_inspection/Screens/home_screen.dart';
import 'package:app_inspection/generated/l10n.dart';

class CustomAppBarBottomNav extends StatefulWidget {
  final String title;
  final int currentIndex;
  final Function(int) onTabSelected;
  final VoidCallback? onLogout;
  final VoidCallback? onLabors;
  final VoidCallback? onMenu;
  final String id;
  final Future<bool?> Function()? onConfirmDiscardChanges;
  final String username;

  const CustomAppBarBottomNav({
    super.key,
    required this.title,
    required this.currentIndex,
    required this.onTabSelected,
    required this.id,
    required this.username,
    this.onLogout,
    this.onLabors,
    this.onMenu,
    this.onConfirmDiscardChanges,
  });

  @override
  State<CustomAppBarBottomNav> createState() => _CustomAppBarBottomNavState();
}

class _CustomAppBarBottomNavState extends State<CustomAppBarBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: AppBar(
            toolbarHeight: 70,
            title: Padding(
              padding: const EdgeInsets.only(top: 33),
              child: Text(
                widget.title,
                style: GoogleFonts.varela(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: IconButton(
                icon: Icon(
                  widget.currentIndex == 0 && widget.onLogout != null
                      ? Icons.logout
                      : widget.onLabors != null
                          ? Icons.arrow_back
                          : widget.onMenu != null
                              ? Icons.arrow_back
                              : Icons.home_outlined,
                  size: 28,
                ),
                onPressed: () async {
                  if (widget.currentIndex == 0 && widget.onLogout != null) {
                    widget.onLogout!();
                  } else if (widget.onLabors != null) {
                    widget.onLabors!();
                  } else if (widget.onMenu != null) {
                    widget.onMenu!();
                  } else {
                    if (widget.onConfirmDiscardChanges != null) {
                      final descartar = await widget.onConfirmDiscardChanges!();
                      if (descartar == true) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                                id: widget.id, username: widget.username),
                          ),
                        );
                      }
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                              id: widget.id, username: widget.username),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 33, right: 16),
                child: Text(
                  S.current.customBarsHi(widget.username),
                  style: GoogleFonts.varela(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(),
        ),
        BottomNavigationBar(
          currentIndex: widget.currentIndex,
          onTap: widget.onTabSelected,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: S.current.title_home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fire_truck),
              label: S.current.customBarHomeVehicle,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: S.current.customBarInspection,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_crash_outlined),
              label: S.current.service_orders_title,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: S.current.customBarProfile,
            ),
          ],
        ),
      ],
    );
  }
}
