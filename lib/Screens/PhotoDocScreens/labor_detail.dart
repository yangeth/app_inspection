import 'dart:io';
import 'dart:typed_data';
import 'package:app_inspection/Screens/InspectionScreens/service_order_ins.dart';
import 'package:app_inspection/Screens/PhotoDocScreens/service_orders.dart';
import 'package:app_inspection/Screens/vehicle_general_screen.dart';
import 'package:app_inspection/generated/l10n.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:app_inspection/Screens/PhotoDocScreens/labors_screen.dart';
import 'package:app_inspection/Screens/home_screen.dart';
import 'package:app_inspection/utils/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_inspection/Screens/Profile.dart';
import 'package:app_inspection/widgets/custom_app_bar_bottom_nav.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class LaborDetailScreen extends StatefulWidget {
  final String id;
  final String username;
  final String sodid;
  final String refnum;
  final String laborname;
  final String vehicle;
  final String type;
  const LaborDetailScreen(
      {super.key,
      required this.id,
      required this.sodid,
      required this.refnum,
      required this.laborname,
      required this.vehicle,
      required this.type,
      required this.username});

  @override
  State<LaborDetailScreen> createState() => _LaborDetailScreenState();
}

class _LaborDetailScreenState extends State<LaborDetailScreen> {
  final TextEditingController customerController = TextEditingController();
  final TextEditingController truckTrailerController = TextEditingController();
  final TextEditingController platesController = TextEditingController();
  final TextEditingController technicianController = TextEditingController();
  String description = "";
  String laborType = "";
  String soid = "";
  int _paginaActual = 3;
  late List<Widget> _paginas;

  List<File?> beforeImages = List.filled(4, null);
  List<File?> laborFinishedImages = List.filled(4, null);

  Future<void> _pickImage(int index, bool isBefore) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      File compressedImage = await _compressImage(File(image.path));

      setState(() {
        if (isBefore) {
          beforeImages[index] = compressedImage;
        } else {
          laborFinishedImages[index] = compressedImage;
        }
      });
    }
  }

  Future<File> _compressImage(File file) async {
    final filePath = file.absolute.path;
    final lastIndex = filePath.lastIndexOf('.');
    final newPath = '${filePath.substring(0, lastIndex)}_compressed.webp';

    final compressedFile = await FlutterImageCompress.compressAndGetFile(
      filePath,
      newPath,
      quality: 70,
      format: CompressFormat.webp,
    );
    return File(compressedFile!.path);
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
    fetchLaborData();
    _loadImages0();
  }

  void _loadImages0() async {
    List<File?> before = await fetchImages(int.parse(widget.sodid), 0);
    List<File?> finished = await fetchImages(int.parse(widget.sodid), 1);
    if (mounted) {
      setState(() {
        beforeImages = before;
        laborFinishedImages = finished;
      });
    }
  }

  Future<void> fetchLaborData() async {
    await Data.fetchLaborDetails(widget.sodid);
    if (mounted && Data.labordetails.isNotEmpty) {
      setState(() {
        description = Data.labordetails[1];
        laborType = Data.labordetails[2];
        technicianController.text = Data.labordetails[3];
        customerController.text = Data.labordetails[4];
        soid = Data.labordetails[5];
        platesController.text = Data.labordetails[6];
        truckTrailerController.text = Data.labordetails[7];
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
          builder: (context) => LaborScreen(
                id: widget.id,
                soid: soid,
                refnum: widget.refnum,
                customer: customerController.text,
                vehicle: widget.vehicle,
                plates: platesController.text,
                username: widget.username,
                type: widget.type,
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
          // Fondo con imagen dinámica
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
          // Contenido principal
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 80, left: 10, right: 10, bottom: 20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${S.current.labor_name}: ${widget.laborname}',
                              style: GoogleFonts.varela(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${S.current.vehicle_type}: $laborType',
                              style: GoogleFonts.varela(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${S.current.description}: $description',
                              style: GoogleFonts.varela(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                          const SizedBox(height: 10),
                          _buildLaborField('${S.current.vehicle_client}: ',
                              customerController),
                          _buildLaborField('${S.current.vehicle_model}: ',
                              truckTrailerController),
                          _buildLaborField('${S.current.vehicle_plates}: ',
                              platesController),
                          _buildLaborField('${S.current.technician}: ',
                              technicianController),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildImageSection(
                        "${S.current.before_parts}:", beforeImages, true),
                    const SizedBox(height: 10),
                    _buildImageSection("${S.current.labor_finished}:",
                        laborFinishedImages, false),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomAppBarBottomNav(
        title: S.current.labor_detail,
        currentIndex: _paginaActual,
        onTabSelected: _onTabSelected,
        id: widget.id,
        username: widget.username,
        onLabors: _labor,
      ),
    );
  }

  Widget _buildLaborField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: GoogleFonts.varela(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: TextFormField(
              readOnly: true,
              controller: controller,
              style: GoogleFonts.varela(
                fontSize: 13,
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

  Widget _buildImageSection(String title, List<File?> images, bool isBefore) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: GoogleFonts.varela(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              return GestureDetector(
                onTap: () => _pickImage(index, isBefore),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: images[index] != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(images[index]!, fit: BoxFit.cover),
                        )
                      : Center(
                          child: Icon(
                            Icons.camera_alt,
                          ),
                        ),
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _uploadImages(images, isBefore ? 0 : 1),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).hintColor),
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child:
                Text(isBefore ? S.current.save_update : S.current.save_update),
          ),
        ],
      ),
    );
  }

  Future<List<File?>> fetchImages(int serviceOrderDetId, int estatus) async {
    List<File?> images = List.filled(4, null);
    List<File?> images1 = List.filled(4, null);
    if (estatus == 0) {
      for (int doctoId = 1; doctoId <= 4; doctoId++) {
        final url = Uri.parse(
            'http://192.168.0.3:8080/photodoc/getDocto/$serviceOrderDetId/$doctoId/0?timestamp=${DateTime.now().millisecondsSinceEpoch}');
        try {
          final response = await http.get(url);
          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            if (data != null && data['docto'] != null) {
              Uint8List imageBytes = base64Decode(data['docto']);
              File imageFile =
                  await _writeToFile(imageBytes, 'image_$doctoId.webp');
              images[doctoId - 1] = imageFile;
            }
          }
        } catch (e) {}
      }
    } else if (estatus == 1) {
      for (int doctoId = 1; doctoId <= 4; doctoId++) {
        final url = Uri.parse(
            'http://192.168.0.3:8080/photodoc/getDocto/$serviceOrderDetId/$doctoId/1?timestamp=${DateTime.now().millisecondsSinceEpoch}');
        try {
          final response = await http.get(url);
          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            if (data != null && data['docto'] != null) {
              Uint8List imageBytes = base64Decode(data['docto']);
              File imageFile =
                  await _writeToFile(imageBytes, 'image1_$doctoId.webp');
              images1[doctoId - 1] = imageFile;
            }
          }
        } catch (e) {}
      }
    }

    if (estatus == 0) {
      return images;
    } else {
      return images1;
    }
  }

  Future<File> _writeToFile(Uint8List bytes, String fileName) async {
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(bytes);
    return file;
  }

  Future<void> _uploadImages(List<File?> images, int estatus) async {
    if (images.every((image) => image == null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.current.no_images_to_upload)),
      );
      return;
    }

    for (int i = 0; i < images.length; i++) {
      if (images[i] != null) {
        try {
          List<int> imageBytes = await images[i]!.readAsBytes();
          String base64Image = base64Encode(imageBytes);

          Map<String, dynamic> insertDocto = {
            "serviceOrderDetailId": int.parse(widget.sodid),
            "estatus": estatus,
            "doctoId": i + 1,
            "docto": base64Image
          };

          var response = await http.post(
            Uri.parse("http://192.168.0.3:8080/photodoc/insertDocto"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(insertDocto),
          );

          if (response.statusCode == 200) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      "${S.current.image_uploaded_successfully}: ${i + 1} ")),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content:
                      Text("${S.current.error_uploading_image}: ${i + 1}")),
            );
          }
        } catch (e) {
          print("${S.current.error_uploading_image} ${i + 1}: $e");
        }
      }
    }
  }
}
