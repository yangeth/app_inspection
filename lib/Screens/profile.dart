import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:app_inspection/Screens/InspectionScreens/service_order_ins.dart';
import 'package:app_inspection/Screens/PhotoDocScreens/service_orders.dart';
import 'package:app_inspection/Screens/vehicle_general_screen.dart';
import 'package:app_inspection/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_inspection/Screens/home_screen.dart';
import 'package:app_inspection/widgets/custom_app_bar_bottom_nav.dart';
import 'package:app_inspection/utils/data.dart';

class Profile extends StatefulWidget {
  final String username;
  final String id;
  const Profile({super.key, required this.id, required this.username});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isButtonDisabled = false;
  int _paginaActual = 4;
  late List<Widget> _paginas;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _role = TextEditingController();

  File? _selectedImage;
  String? _base64Image;
  Uint8List? _decodedImage;
  bool _isLoadingImage = true;

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
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      await Data.fetchUserData(widget.id);
      setState(() {
        if (Data.userdata.isNotEmpty) {
          _name.text = Data.userdata[0];
          _lastname.text = Data.userdata[1];
          _role.text = Data.userdata[2];
          _email.text = Data.userdata[3];
          String? base64Image = Data.userdata[4];
          Future.delayed(Duration(milliseconds: 500), () {
            setState(() {
              _decodedImage = base64Decode(base64Image);
              _isLoadingImage = false;
            });
          });
        }
      });
    } catch (e) {}
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
        _base64Image = base64Encode(_selectedImage!.readAsBytesSync());
      });
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        image: _selectedImage != null
                            ? DecorationImage(
                                image: FileImage(_selectedImage!),
                                fit: BoxFit.cover,
                              )
                            : _isLoadingImage
                                ? const DecorationImage(
                                    image: AssetImage(
                                        'assets/default_profile.png'),
                                    fit: BoxFit.cover,
                                  )
                                : (_decodedImage != null
                                    ? DecorationImage(
                                        image: MemoryImage(_decodedImage!),
                                        fit: BoxFit.cover,
                                      )
                                    : const DecorationImage(
                                        image: AssetImage(
                                            'assets/default_profile.png'),
                                        fit: BoxFit.cover,
                                      )),
                        shape: BoxShape.circle,
                        border: Border.all(width: 0),
                      ),
                      child: _isLoadingImage
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              S.current.profile_my_data,
                              style: GoogleFonts.varela(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          _buildProfileField(S.current.profile_name, _name),
                          const SizedBox(height: 10),
                          _buildProfileField(
                              S.current.profile_lastname, _lastname),
                          const SizedBox(height: 10),
                          _buildProfileField(S.current.email, _email),
                          const SizedBox(height: 10),
                          _buildProfileField(S.current.profile_role, _role),
                          const SizedBox(height: 10),
                          Center(
                            child: ElevatedButton(
                              onPressed:
                                  _isButtonDisabled ? null : _updateUserData,
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                      color: Theme.of(context).hintColor),
                                ),
                              ),
                              child: Text(
                                _isButtonDisabled
                                    ? S.current.profile_wait
                                    : S.current.profile_update_data,
                                style: GoogleFonts.varela(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(width: 150),
                  SizedBox(height: 70),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomAppBarBottomNav(
        title: S.current.title_profile,
        currentIndex: _paginaActual,
        id: widget.id,
        username: _name.text,
        onTabSelected: _onTabSelected,
      ),
    );
  }

  Future<void> _updateUserData() async {
    if (_isButtonDisabled) return;
    setState(() {
      _isButtonDisabled = true;
    });

    final updatedData = {
      'names': _name.text,
      'lastName': _lastname.text,
      'snuser': (_name.text + _lastname.text),
      'email': _email.text,
      'role': _role.text,
      'photoImg': _base64Image,
    };
    await Data.updateUserData(widget.id, updatedData);
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isButtonDisabled = false;
      });
    });
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

  Widget _buildProfileField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: GoogleFonts.varela(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: TextFormField(
              controller: controller,
              style: GoogleFonts.varela(
                fontSize: 17,
              ),
              decoration: InputDecoration(
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
          ),
        ],
      ),
    );
  }
}
