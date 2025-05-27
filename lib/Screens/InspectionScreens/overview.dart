import 'package:app_inspection/Screens/InspectionScreens/electric_inspection.dart';
import 'package:app_inspection/Screens/InspectionScreens/inspection_data.dart';
import 'package:app_inspection/Screens/InspectionScreens/service_order_ins.dart';
import 'package:app_inspection/Screens/PhotoDocScreens/service_orders.dart';
import 'package:app_inspection/Screens/InspectionScreens/inspection_menu.dart';
import 'package:app_inspection/Screens/home_screen.dart';
import 'package:app_inspection/Screens/vehicle_general_screen.dart';
import 'package:app_inspection/generated/l10n.dart';
import 'package:app_inspection/widgets/navigation_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_inspection/Screens/Profile.dart';
import 'package:app_inspection/widgets/custom_app_bar_bottom_nav.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Overview extends StatefulWidget {
  final String id;
  final String username;

  const Overview({super.key, required this.id, required this.username});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  int _paginaActual = 2;
  late List<Widget> _paginas;

  List<Widget> _buildGlobalSections(InspectionData data) {
    final sections = {
      S.current.title_ins_brakes: data.brakesglobalChecks,
      S.current.title_ins_seals: data.sealglobalChecks,
      S.current.title_ins_u_joints: data.ujointsglobalChecks,
      S.current.title_ins_fluids: data.fluidsglobalChecks,
      S.current.title_ins_shocks: data.shocksglobalChecks,
      S.current.title_ins_airbags: data.airbagglobalChecks,
      S.current.title_ins_steering_and_suspension: data.steeringsglobalChecks,
      S.current.title_ins_mounts: data.mountsglobalChecks,
      S.current.title_ins_air_brakes: data.airbglobalChecks,
      S.current.title_ins_exhaust: data.exhaustglobalChecks,
      S.current.title_ins_safety: data.safetyglobalChecks,
      S.current.title_ins_electric: data.electricglobalChecks,
    };

    return sections.entries.map((entry) {
      final sectionName = entry.key;
      final checks = entry.value;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sectionName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              ...checks.entries
                  .where((checkEntry) => checkEntry.value == true)
                  .map((checkEntry) => CheckboxListTile(
                        title: Text(checkEntry.key),
                        value: checkEntry.value,
                        onChanged: null,
                        controlAffinity: ListTileControlAffinity.leading,
                      )),
              const Divider(),
            ],
          ),
        ),
      );
    }).toList();
  }

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
                    builder: (context) =>
                        Overview(id: widget.id, username: widget.username),
                  ),
                );
              },
              child: Text(S.current.cancel_button),
            ),
            TextButton(
              onPressed: () {
                Provider.of<InspectionData>(context, listen: false)
                    .resetAllData();
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
        builder: (context) =>
            InspectionMenu(id: widget.id, username: widget.username),
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
          margin: const EdgeInsets.only(top: 70, bottom: 80),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                                ElectricInspection(
                                    id: widget.id, username: widget.username),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
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
                            Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => InspectionMenu(
                                  id: widget.id,
                                  username: widget.username,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Consumer<InspectionData>(
                      builder: (context, inspectionData, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(12),
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
                                    S.current.title_ins_wheel,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  ...inspectionData.wheelData.entries
                                      .map((entry) {
                                    final wheel = entry.key;
                                    final inspection = entry.value;
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          wheel,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          S.current.types_brakes_ovr((inspection
                                                      .brakeType?.isNotEmpty ??
                                                  false)
                                              ? inspection.brakeType!
                                              : S.current.types_ovr_na),
                                        ),
                                        Text(
                                          S.current.types_brakes_chamber_ovr(
                                              (inspection.brakeChamberType
                                                          ?.isNotEmpty ??
                                                      false)
                                                  ? inspection.brakeChamberType!
                                                  : S.current
                                                      .types_chamber_ovr_na),
                                        ),
                                        ...inspection.wheelchecks.entries
                                            .where((e) =>
                                                e.value ==
                                                true) // Filtramos solo true
                                            .map(
                                              (e) => Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: CheckboxListTile(
                                                  title: Text(e.key),
                                                  value: e.value,
                                                  onChanged: null,
                                                ),
                                              ),
                                            ),
                                        const Divider(),
                                      ],
                                    );
                                  }),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 10),
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
                                  const Text(
                                    'Global Checks',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  ..._buildGlobalSections(inspectionData),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomAppBarBottomNav(
        title: S.current.title_overview,
        currentIndex: _paginaActual,
        onTabSelected: _onTabSelected,
        id: widget.id,
        username: widget.username,
        onMenu: _menu,
      ),
    );
  }
}
