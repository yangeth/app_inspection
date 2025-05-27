import 'package:app_inspection/Screens/InspectionScreens/inspection_data.dart';
import 'package:app_inspection/Screens/InspectionScreens/inspection_menu.dart';
import 'package:app_inspection/Screens/InspectionScreens/service_order_ins.dart';
import 'package:app_inspection/Screens/PhotoDocScreens/service_orders.dart';
import 'package:app_inspection/Screens/home_screen.dart';
import 'package:app_inspection/Screens/vehicle_general_screen.dart';
import 'package:app_inspection/Screens/InspectionScreens/inspections_export.dart';
import 'package:app_inspection/generated/l10n.dart';
import 'package:app_inspection/widgets/navigation_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_inspection/Screens/Profile.dart';
import 'package:app_inspection/widgets/custom_app_bar_bottom_nav.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SafetyInspection extends StatefulWidget {
  final String id;
  final String username;
  const SafetyInspection({super.key, required this.id, required this.username});

  @override
  State<SafetyInspection> createState() => _SafetyInspectionState();
}

class _SafetyInspectionState extends State<SafetyInspection> {
  final List<String> checklistSafety = [
    S.current.windshield_safety,
    S.current.wiper_safety,
    S.current.numbers_safety,
    S.current.lights_safety,
    S.current.reflector_safety,
    S.current.horn_safety,
    S.current.mirrors_safety,
    S.current.cabglasses_safety,
    S.current.decals_safety,
    S.current.fueltank_safety,
    S.current.pbrake_safety,
    S.current.cabcondition_safety,
    S.current.gauses_safety,
    S.current.footpedal_safety,
    S.current.extintor_safety
  ];

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
          builder: (context) => InspectionMenu(
                id: widget.id,
                username: widget.username,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<InspectionData>();
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
          margin: const EdgeInsets.only(top: 70, bottom: 60),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //lod  demas de esta ventaana

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.current.checklist_safety,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          ...checklistSafety.map((label) {
                            return CheckboxListTile(
                              title: Text(label),
                              value: data.getSafetyGlobalCheck(label),
                              onChanged: (v) =>
                                  data.setSafetyGlobalCheck(label, v!),
                              controlAffinity: ListTileControlAffinity.leading,
                            );
                          }),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            final data = Provider.of<InspectionData>(context,
                                listen: false);
                            data.setSelectedWheel(S.current.wheel_1);
                            Navigator.pushReplacement(
                              context,
                              createBackRoute(
                                ExhaustInspection(
                                    id: widget.id, username: widget.username),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            S.current.btn_back,
                            style: GoogleFonts.varela(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final data = Provider.of<InspectionData>(context,
                                listen: false);
                            data.setSelectedWheel(S.current.wheel_1);
                            Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ElectricInspection(
                                    id: widget.id, username: widget.username),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            S.current.btn_next,
                            style: GoogleFonts.varela(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomAppBarBottomNav(
        title: S.current.title_ins_safety,
        currentIndex: _paginaActual,
        onTabSelected: _onTabSelected,
        id: widget.id,
        username: widget.username,
        onMenu: _menu,
      ),
    );
  }
}
