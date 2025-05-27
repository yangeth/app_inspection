import 'dart:io';
import 'package:app_inspection/Screens/InspectionScreens/service_order_ins.dart';
import 'package:app_inspection/Screens/PhotoDocScreens/service_orders.dart';
import 'package:app_inspection/Screens/home_screen.dart';
import 'package:app_inspection/Screens/InspectionScreens/inspection_screen.dart';
import 'package:app_inspection/Screens/profile.dart';
import 'package:app_inspection/Screens/vehicle_general_screen.dart';
import 'package:app_inspection/widgets/custom_app_bar_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_inspection/generated/l10n.dart';

class VehicleScreenRegister extends StatefulWidget {
  final String id;
  final String username;
  const VehicleScreenRegister(
      {super.key, required this.id, required this.username});
  @override
  State<VehicleScreenRegister> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreenRegister> {
  int _paginaActual = 1;
  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  String? selectedType;
  final List<String> type = [S.current.vehicle_type1, S.current.vehicle_type2];
  late List<Widget> _paginas;
  final List<String> clientes = [
    'FEMSA',
    'CASTORES',
    'TORNELL',
    'NIKE',
    'ADIDAS',
    'PUMA',
    'CONVERSE',
    'PEÑAFIEL'
  ];

  final TextEditingController _clienteController = TextEditingController();

  // esta es la lista para almacenar las sugerencias ya filtradas
  List<String> _filteredClientes = [];
  final List<TextEditingController> _controllers =
      List.generate(7, (_) => TextEditingController());
  //final TextEditingController _clienteController1 = TextEditingController();

  /*String? selectedCliente;
  String? customCliente;*/

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

  void _filterClientes(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _filteredClientes = clientes
            .where((cliente) =>
                cliente.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        _filteredClientes = [];
      });
    }
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
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                VehicleGeneralScreen(id: widget.id, username: widget.username)),
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
        child: Container(
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
                        /*TextButton(
                          onPressed: () {
                            //buscara las placas en el futuro
                          },
                          child: Text(
                            S.current.search_Plates,
                            style: GoogleFonts.varela(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),*/
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _buildTextField(
                    label: S.current.vehicle_plates,
                    controller: _controllers[0]),
                _buildTextField(
                    label: S.current.vehicle_model,
                    controller: _controllers[1]),
                Row(
                  children: [
                    Expanded(
                        child: _buildTextField(
                            label: S.current.vehicle_year,
                            controller: _controllers[2])),
                    SizedBox(width: 10),
                    Expanded(
                        child: _buildTextField(
                            label: S.current.vehicle_type,
                            controller: TextEditingController())),
                  ],
                ),
                _buildTextField(
                    label: S.current.vehicle_economic_number,
                    controller: _controllers[3]),
                _buildClienteTextField(),
                //_buildTextField(label: S.current.vehicle_client),
                _buildTextField(
                    label: S.current.customer_phone,
                    controller: _controllers[4]),
                _buildTextField(
                    label: S.current.customer_email,
                    controller: _controllers[5]),
                ElevatedButton(
                  onPressed: () {
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
                    for (var controller in _controllers) {
                      controller.text = '';
                    }
                    _clienteController.text = '';
                    selectedType = null;
                    setState(() {});

                    FocusScope.of(context).unfocus();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InspectionScreen(
                                id: widget.id, username: widget.username)));
                    //Guardará los datos del vehiculo
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    S.current.save_vehicle,
                    style: GoogleFonts.varela(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomAppBarBottomNav(
        title: S.current.title_register,
        currentIndex: _paginaActual,
        onTabSelected: _onTabSelected,
        id: widget.id,
        username: widget.username,
      ),
    );
  }

  Widget _buildClienteTextField() {
    final Color dropdownFillColor = Theme.of(context).colorScheme.surface;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _clienteController,
            onChanged: _filterClientes,
            decoration: InputDecoration(
              labelText: S.current.vehicle_client,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
            ),
          ),
          if (_filteredClientes.isNotEmpty)
            Container(
              constraints: BoxConstraints(
                maxHeight: 200,
              ),
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: dropdownFillColor,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: _filteredClientes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _filteredClientes[index],
                      style: GoogleFonts.varela(fontSize: 17),
                    ),
                    onTap: () {
                      setState(() {
                        _clienteController.text = _filteredClientes[index];
                        _filteredClientes = [];
                      });
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
  }) {
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
    final int? maxLength = _getMaxLength(label);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        maxLength: maxLength,
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

  int? _getMaxLength(String label) {
    if (label == S.current.vehicle_plates) {
      return 7;
    } else if (label == S.current.vehicle_year) {
      return 4;
    } else {
      return null;
    }
  }
}
