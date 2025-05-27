import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class Data {
  static List<String> userdata = [];
  static List<String> labordetails = [];
  static Uint8List? userPhoto;

  static Future<void> fetchUserData(String userId) async {
    final url =
        Uri.parse('http://192.168.0.3:8080/photodoc/getUserData/$userId');
    try {
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final udata = json.decode(response.body);
        if (udata is Map<String, dynamic>) {
          userdata = [
            udata['names'] ?? 'Name ERROR',
            udata['lastname'] ?? 'Lastname ERROR',
            udata['role'] ?? 'Role ERROR',
            udata['email'] ?? 'Email ERROR',
            udata['photoImg'] ?? 'Photo ERROR',
          ];
        }
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  static Future<void> updateUserData(
      String userId, Map<String, dynamic> updatedData) async {
    final url =
        Uri.parse('http://192.168.0.3:8080/photodoc/updateUser/$userId');
    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updatedData),
      );
      print(json.encode(updatedData));
      if (response.statusCode != 200) {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to update user data: $e');
    }
  }

  static Future<void> fetchLaborDetails(String sodid) async {
    final url =
        Uri.parse('http://192.168.0.3:8080/photodoc/getLaborDetails/$sodid');
    try {
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final List<dynamic> ldataList =
            jsonDecode(utf8.decode(response.bodyBytes));
        if (ldataList.isNotEmpty) {
          final Map<String, dynamic> ldata = ldataList.first;
          labordetails = [
            ldata['ref_number'].toString(),
            ldata['Description'] ?? 'Description ERROR',
            ldata['LaborType'] ?? 'LaborType ERROR',
            ldata['Technician'] ?? 'technician ERROR',
            ldata['Customer'] ?? 'Customer ERROR',
            ldata['sodid'].toString(),
            ldata['Plates'] ?? 'plates ERROR',
            ldata['VehicleTypeMaker'] ?? 'VehicleTypeMaker ERROR'
          ];
        } else {
          labordetails = [];
        }
      }
    } catch (e) {
      print("Error fetching Labor data: $e");
    }
  }
}
