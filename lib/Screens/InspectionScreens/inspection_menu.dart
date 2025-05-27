import 'package:app_inspection/Screens/InspectionScreens/inspection_data.dart';
import 'package:app_inspection/Screens/InspectionScreens/inspections_export.dart';
import 'package:app_inspection/Screens/InspectionScreens/service_order_ins.dart';
import 'package:app_inspection/Screens/PhotoDocScreens/service_orders.dart';
import 'package:app_inspection/Screens/InspectionScreens/overview.dart';
import 'package:app_inspection/Screens/home_screen.dart';
import 'package:app_inspection/Screens/InspectionScreens/inspection_screen.dart';
import 'package:app_inspection/Screens/vehicle_general_screen.dart';
import 'package:app_inspection/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:app_inspection/Screens/Profile.dart';
import 'package:app_inspection/widgets/custom_app_bar_bottom_nav.dart';
import 'package:provider/provider.dart';

class InspectionMenu extends StatefulWidget {
  final String id;
  final String username;
  const InspectionMenu({super.key, required this.id, required this.username});

  @override
  State<InspectionMenu> createState() => _InspectionMenuInspectionState();
}

class _InspectionMenuInspectionState extends State<InspectionMenu> {
  int _paginaActual = 2;
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

  void _onTabSelected(int index) async {
    final rootPage = ServiceOrderIns(id: widget.id, username: widget.username);

    if (index != _paginaActual) {
      bool? confirmar = await _mostrarDialogoConfirmacion();

      if (confirmar == true) {
        setState(() {
          _paginaActual = index;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => _paginas[index]),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => rootPage),
      );
    }
  }

  Future<bool?> _mostrarDialogoConfirmacion() {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(S.current.discard_changes_title),
        content: Text(S.current.discard_changes_content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Overview(id: widget.id, username: widget.username),
                ),
              );
            },
            child: Text(S.current.cancel_button),
          ),
          TextButton(
            onPressed: () {
              Provider.of<InspectionData>(context, listen: false).resetAllData();
              Navigator.pop(context, true);
            },
            child: Text(S.current.discard_button),
          ),
        ],
      );
    },
  );
}

  void _menu() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => ServiceOrderIns(
                id: widget.id,
                username: widget.username,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundImage = isDark
        ? 'assets/tr_background_dark.png'
        : 'assets/tr_background_light.png';

    final List<Map<String, dynamic>> menuItems = [
      {
        'title': S.current.title_ins_wheel,
        'screen': InspectionScreen(id: widget.id, username: widget.username)
      },
      {
        'title': S.current.title_ins_brakes,
        'screen': BrakesInspection(id: widget.id, username: widget.username)
      },
      {
        'title': S.current.title_ins_seals,
        'screen': SealsInspection(id: widget.id, username: widget.username)
      },
      {
        'title': S.current.title_ins_u_joints,
        'screen': UjointsInspection(id: widget.id, username: widget.username)
      },
      {
        'title': S.current.title_ins_fluids,
        'screen': FluidsInspection(id: widget.id, username: widget.username)
      },
      {
        'title': S.current.title_ins_shocks,
        'screen': ShocksInspection(id: widget.id, username: widget.username)
      },
      {
        'title': S.current.title_ins_airbags,
        'screen': AirbagsInspection(id: widget.id, username: widget.username)
      },
      {
        'title': S.current.title_ins_steering_and_suspension,
        'screen': SteeringSuspensionInspection(
            id: widget.id, username: widget.username)
      },
      {
        'title': S.current.title_ins_mounts,
        'screen': MountsInspection(id: widget.id, username: widget.username)
      },
      {
        'title': S.current.title_ins_air_brakes,
        'screen': AirBrakesInspection(id: widget.id, username: widget.username)
      },
      {
        'title': S.current.title_ins_tires,
        'screen': TiresInspection(id: widget.id, username: widget.username)
      },
      {
        'title': S.current.title_ins_exhaust,
        'screen': ExhaustInspection(id: widget.id, username: widget.username)
      },
      {
        'title': S.current.title_ins_safety,
        'screen': SafetyInspection(id: widget.id, username: widget.username)
      },
      {
        'title': S.current.title_ins_electric,
        'screen': ElectricInspection(id: widget.id, username: widget.username)
      },
      {
        'title': S.current.title_overview,
        'screen': Overview(id: widget.id, username: widget.username)
      },
    ];

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
          margin: const EdgeInsets.only(top: 70),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.only(bottom: 60),
              children: menuItems.map((item) {
                return ElevatedButton(
                  onPressed: () {
                    final data =
                        Provider.of<InspectionData>(context, listen: false);
                    data.setSelectedWheel(S.current.wheel_1);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => item['screen']),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      item['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomAppBarBottomNav(
        title: S.current.title_ins_menu,
        currentIndex: _paginaActual,
        onTabSelected: _onTabSelected,
        id: widget.id,
        username: widget.username,
        onMenu: _menu,
      ),
    );
  }
}
