import 'dart:convert';
import 'package:app_inspection/Screens/InspectionScreens/inspection_data.dart';
import 'package:app_inspection/Screens/InspectionScreens/inspection_menu.dart';
import 'package:app_inspection/Screens/InspectionScreens/overview.dart';
import 'package:app_inspection/Screens/PhotoDocScreens/service_orders.dart';
import 'package:app_inspection/Screens/home_screen.dart';
import 'package:app_inspection/Screens/vehicle_general_screen.dart';
import 'package:app_inspection/generated/l10n.dart';
import 'package:app_inspection/widgets/navigation_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:app_inspection/Screens/Login_Screen.dart';
import 'package:app_inspection/Screens/Profile.dart';
import 'package:app_inspection/widgets/custom_app_bar_bottom_nav.dart';
import 'package:provider/provider.dart';

class ServiceOrderIns extends StatefulWidget {
  final String id;
  final String username;
  const ServiceOrderIns({super.key, required this.id, required this.username});

  @override
  State<ServiceOrderIns> createState() => _ServiceOrderInsState();
}

class _ServiceOrderInsState extends State<ServiceOrderIns> {
  int _paginaActual = 2;
  late List<Widget> _paginas;
  List<Map<String, dynamic>> _orders = [];
  bool _isLoading = true;
  List<String> estatusList = ['01', '02', '04', '05', '06'];
  String selectedEstatus = '02';

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
    _fetchOrders();
  }

  Future<void> _fetchOrders() async {
    final url = Uri.parse(
        'http://192.168.0.3:8080/photodoc/getServiceOrdersByStatus/$selectedEstatus');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
        setState(() {
          _orders = List<Map<String, dynamic>>.from(data);
          _isLoading = false;
        });
      } else {
        throw Exception('Error getting orders');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onEstatusSelected(String? newValue) {
    setState(() {
      selectedEstatus = newValue!;
    });
    _fetchOrders();
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
              // Cancelar: ir a Overview sin borrar datos
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
              // Descartar: borrar datos y cerrar diálogo con true
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
      body: Stack(
        children: [
          Container(
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
          Positioned.fill(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        ..._orders.map((order) => _buildOrderItem(order)),
                        const SizedBox(height: 65),
                      ],
                    ),
                  ),
          ),
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: selectedEstatus,
                    onChanged: _onEstatusSelected,
                    items: estatusList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Text(S.current.current_estatus(value),
                              style: GoogleFonts.varela(
                                  fontWeight: FontWeight.bold)),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomAppBarBottomNav(
        title: S.current.service_orders_title,
        currentIndex: _paginaActual,
        onTabSelected: _onTabSelected,
        id: widget.id,
        username: widget.username,
        onLogout: _logout,
        onConfirmDiscardChanges: _mostrarDialogoConfirmacion,
      ),
    );
  }

  Widget _buildOrderItem(Map<String, dynamic> order) {
    String soid = order['ServOrderID']?.toString() ?? 'No SODID';
    String refnum = order['Ref_number']?.toString() ?? 'No ID';
    String customer = order['Customer'] ?? 'No Customer';
    String vehicle = order['VehicleMaker'] ?? 'No Vehicle';
    String type = order['Type'] ?? 'No Type';
    String plates = order['Plates'] ?? 'No Plates';
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).hintColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: ListTile(
        title: Text(S.current.ref_num(refnum),
            style: GoogleFonts.varela(fontWeight: FontWeight.bold)),
        subtitle: Text(
          "${S.current.vehicle_client}: $customer\n"
          "${S.current.vehicle_maker}: $vehicle\n"
          "${S.current.vehicle_type}: $type\n"
          "${S.current.vehicle_plates}: $plates\n",
          style: GoogleFonts.varela(),
        ),
        trailing: Icon(
          Icons.construction_sharp,
          color: Theme.of(context).hintColor,
        ),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => InspectionMenu(
                id: widget.id,
                username: widget.username,
              ),
            ),
          );
        },
      ),
    );
  }
}
