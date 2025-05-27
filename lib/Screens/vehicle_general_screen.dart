import 'dart:io';
import 'package:app_inspection/Screens/InspectionScreens/inspection_data.dart';
import 'package:app_inspection/Screens/InspectionScreens/service_order_ins.dart';
import 'package:app_inspection/Screens/PhotoDocScreens/service_orders.dart';
import 'package:app_inspection/Screens/home_screen.dart';
import 'package:app_inspection/Screens/InspectionScreens/inspection_screen.dart';
import 'package:app_inspection/Screens/profile.dart';
import 'package:app_inspection/Screens/register_vehicle_screen.dart';
import 'package:app_inspection/widgets/custom_app_bar_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_inspection/generated/l10n.dart';
import 'package:provider/provider.dart';

class VehicleGeneralScreen extends StatefulWidget {
  final String id;
  final String username;
  const VehicleGeneralScreen(
      {super.key, required this.id, required this.username});
  @override
  State<VehicleGeneralScreen> createState() => _VehicleGeneralScreenState();
}

class _VehicleGeneralScreenState extends State<VehicleGeneralScreen> {
  int _paginaActual = 1;
  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  String? selectedType;
  final List<String> type = [S.current.vehicle_type1, S.current.vehicle_type2];
  late List<Widget> _paginas;
  final TextEditingController _clienteController = TextEditingController();

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

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _image = photo;
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
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundImage = isDark
        ? 'assets/tr_background_dark.png'
        : 'assets/tr_background_light.png';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/logo2.png', height: 120),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: _takePhoto,
                        child: Container(
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              image: _image != null
                                  ? FileImage(File(_image!.path))
                                      as ImageProvider
                                  : AssetImage(S.current.path_plates),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: _buildTextField(label: S.current.vehicle_plates)),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      //buscara las placas en el futuro
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      S.current.search_Plates,
                      style: GoogleFonts.varela(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              //_buildTextField(label: S.current.vehicle_plates),
              _buildTextField(label: S.current.vehicle_model),
              Row(
                children: [
                  Expanded(
                      child: _buildTextField(label: S.current.vehicle_year)),
                  SizedBox(width: 10),
                  Expanded(
                      child: _buildTextField(label: S.current.vehicle_type)),
                ],
              ),
              _buildTextField(label: S.current.vehicle_economic_number),
              _buildTextField(
                  label: S.current.vehicle_client,
                  controller: _clienteController),
              _buildTextField(label: S.current.customer_phone),
              _buildTextField(label: S.current.customer_email),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VehicleScreenRegister(
                        id: widget.id,
                        username: widget.username,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  S.current.register_vehicle,
                  style: GoogleFonts.varela(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  final data = Provider.of<InspectionData>(context,
                                listen: false);
                            data.setSelectedWheel(S.current.wheel_1);
                  if (_clienteController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(S.current.required_fields),
                        content: Text(S.current.complete_fields),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(S.current.accept),
                          ),
                        ],
                      ),
                    );
                    return;
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InspectionScreen(
                        id: widget.id,
                        username: widget.username,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  S.current.btn_next,
                  style: GoogleFonts.varela(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomAppBarBottomNav(
        title: S.current.title_vehicle,
        currentIndex: _paginaActual,
        onTabSelected: _onTabSelected,
        id: widget.id,
        username: widget.username,
      ),
    );
  }

  Widget _buildTextField(
      {required String label, TextEditingController? controller}) {
    if (label == S.current.vehicle_type) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: DropdownButtonFormField<String>(
          value: selectedType,
          decoration: InputDecoration(
            labelText: label,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
          ),
          items: type.map((String t) {
            return DropdownMenuItem<String>(
              value: t,
              child: Text(t, style: GoogleFonts.varela(fontSize: 17)),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedType = newValue;
            });
          },
        ),
      );
    }
    //final int? maxLength = _getMaxLength(label);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        //maxLength: maxLength,
        style: GoogleFonts.varela(
          fontSize: 17,
        ),
        decoration: InputDecoration(
          filled: true,
          labelText: label,
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
        ),
      ),
    );
  }

  /*int? _getMaxLength(String label) {
    if (label == S.current.vehicle_type) {       NO SE SI ESTA SEA NECESARIO AQUI YA QUE SE LLENARA SOLO
      return 7;
    } else if (label == S.current.vehicle_year) {
      return 4;
    } else {
      return null;
    }
  }*/
}
