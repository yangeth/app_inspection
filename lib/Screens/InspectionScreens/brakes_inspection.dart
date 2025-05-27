import 'package:app_inspection/Screens/InspectionScreens/inspection_data.dart';
import 'package:app_inspection/Screens/InspectionScreens/inspection_menu.dart';
import 'package:app_inspection/Screens/InspectionScreens/service_order_ins.dart';
import 'package:app_inspection/Screens/PhotoDocScreens/service_orders.dart';
import 'package:app_inspection/Screens/InspectionScreens/inspections_export.dart';
import 'package:app_inspection/Screens/home_screen.dart';
import 'package:app_inspection/Screens/InspectionScreens/inspection_screen.dart';
import 'package:app_inspection/Screens/vehicle_general_screen.dart';
import 'package:app_inspection/generated/l10n.dart';
import 'package:app_inspection/widgets/navigation_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_inspection/Screens/Profile.dart';
import 'package:app_inspection/widgets/custom_app_bar_bottom_nav.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BrakesInspection extends StatefulWidget {
  final String id;
  final String username;
  const BrakesInspection({super.key, required this.id, required this.username});

  @override
  State<BrakesInspection> createState() => _BrakesInspectionState();
}

class _BrakesInspectionState extends State<BrakesInspection> {
  final List<String> wheels = [
    S.current.wheel_1,
    S.current.wheel_2,
    S.current.wheel_3,
    S.current.wheel_4,
    S.current.wheel_5,
    S.current.wheel_6
  ];

  final List<String> checklistBrakes = [
    S.current.check_slack_adjuster,
    S.current.check_brake_chamber,
    S.current.check_brake_drum,
    S.current.check_brake_shoes,
  ];

  final List<String> checkBrakeWMoving = [
    S.current.check_brakeWhileMoving,
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
    final currentWheel = data.selectedWheel;
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
                children: [
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
                            S.current.brakes_Checklist,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          ...checkBrakeWMoving.map((label) {
                            return CheckboxListTile(
                              title: Text(label),
                              value: data.getBrakesGlobalCheck(label),
                              onChanged: (v) =>
                                  data.setBrakesGlobalCheck(label, v!),
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
                                InspectionScreen(
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
                                builder: (context) => SealsInspection(
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
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: DropdownButtonFormField<String>(
                      value: currentWheel,
                      decoration: InputDecoration(
                        labelText: S.current.w_inspection,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                      ),
                      items: wheels.map((wheel) {
                        return DropdownMenuItem<String>(
                          value: wheel,
                          child: Text(wheel),
                        );
                      }).toList(),
                      onChanged: (wheel) => data.setSelectedWheel(wheel!),
                    ),
                  ),
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
                            S.current.already_checked,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          ...checklistBrakes.map((label) {
                            return CheckboxListTile(
                              title: Text(label),
                              value: data.getCheck(currentWheel, label),
                              onChanged: (v) =>
                                  data.setCheck(currentWheel, label, v!),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            final idx = wheels.indexOf(currentWheel);
                            if (idx < wheels.length - 1) {
                              final nextWheel = wheels[idx + 1];
                              data.setSelectedWheel(nextWheel);
                            }
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
        title: S.current.title_ins_brakes,
        currentIndex: _paginaActual,
        onTabSelected: _onTabSelected,
        id: widget.id,
        username: widget.username,
        onMenu: _menu,
      ),
    );
  }
}
