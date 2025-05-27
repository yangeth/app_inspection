import 'package:app_inspection/Screens/InspectionScreens/service_order_ins.dart';
import 'package:app_inspection/Screens/home_screen.dart';
import 'package:app_inspection/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_inspection/Screens/vehicle_general_screen.dart';
import 'package:app_inspection/Screens/Profile.dart';
import 'package:app_inspection/Screens/PhotoDocScreens/labor_detail.dart';
import 'package:app_inspection/Screens/PhotoDocScreens/service_orders.dart';
import 'package:app_inspection/widgets/custom_app_bar_bottom_nav.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LaborScreen extends StatefulWidget {
  final String id;
  final String username;
  final String soid;
  final String refnum;
  final String customer;
  final String vehicle;
  final String plates;
  final String type;
  const LaborScreen(
      {super.key,
      required this.id,
      required this.soid,
      required this.refnum,
      required this.customer,
      required this.vehicle,
      required this.plates,
      required this.username,
      required this.type});

  @override
  State<LaborScreen> createState() => _LaborScreenState();
}

class _LaborScreenState extends State<LaborScreen> {
  int _paginaActual = 3;
  late List<Widget> _paginas;
  List<Map<String, dynamic>> _labor1 = [];
  bool _isLoading = true;

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
    _fetchLabor();
  }

  Future<void> _fetchLabor() async {
    final url = Uri.parse(
        'http://192.168.0.3:8080/photodoc/getLaborsList/${widget.soid}');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

        setState(() {
          _labor1 = List<Map<String, dynamic>>.from(data);
          _isLoading = false;
        });
      } else {
        throw Exception('Error getting labors');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
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
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ServiceOrderScreen(id: widget.id, username: widget.username)),
      );
    }
  }

  void _labor() {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
          builder: (context) => ServiceOrderScreen(
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

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Fondo con imagen dependiendo del tema
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
          // Contenido
          Positioned.fill(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 80),
                        _buildOrderDetails(),
                        ..._labor1.map((labor) => _buildLaborItem(labor)),
                        const SizedBox(height: 65),
                      ],
                    ),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: CustomAppBarBottomNav(
        title: S.current.ref_num(widget.refnum),
        currentIndex: _paginaActual,
        onTabSelected: _onTabSelected,
        id: widget.id,
        username: widget.username,
        onLabors: _labor,
      ),
    );
  }

  Widget _buildLaborItem(Map<String, dynamic> labor) {
    String sodid = labor['SODetailID']?.toString() ?? 'No Labor ID';
    String description = labor['Description'] ?? 'No Description';
    String status = labor['LaborEstatus'] ?? 'No Status';
    String laborname = labor['Labor'] ?? 'No LaborName';
    String technician = labor['Technician'] ?? 'No Tech';
    return Card(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).hintColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
          title: Text(
            "${S.current.labor_name}: $laborname",
            style:
                GoogleFonts.varela(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: Text(
            "${S.current.description}: $description\n"
            "${S.current.status}: $status\n"
            "${S.current.technician}: $technician\n",
          ),
          trailing: Icon(
            Icons.build,
            color: Theme.of(context).hintColor,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LaborDetailScreen(
                  id: widget.id,
                  sodid: sodid,
                  refnum: widget.refnum,
                  laborname: laborname,
                  vehicle: widget.vehicle,
                  username: widget.username,
                  type: widget.type,
                ),
              ),
            );
          }),
    );
  }

  Widget _buildOrderDetails() {
    return Card(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).hintColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Center(
          child: Text(
            "${S.current.vehicle_client}: ${widget.customer}",
            style:
                GoogleFonts.varela(fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
        ),
        subtitle: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${S.current.vehicle_maker}: ${widget.vehicle}",
                style: GoogleFonts.varela(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Text(
                "${S.current.vehicle_type}: ${widget.type}",
                style: GoogleFonts.varela(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Text(
                "${S.current.vehicle_plates}: ${widget.plates}",
                style: GoogleFonts.varela(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
