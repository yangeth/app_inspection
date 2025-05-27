import 'package:app_inspection/generated/l10n.dart';
import 'package:flutter/foundation.dart';

// Inspeccion por rueda
class WheelInspection {
  String? brakeType;
  String? brakeChamberType;
  final Map<String, bool> wheelchecks = {};
  WheelInspection({this.brakeType, this.brakeChamberType});
}

class InspectionData extends ChangeNotifier {
  final Map<String, WheelInspection> _wheelData = {};
  final Map<String, bool> _brakesglobalChecks = {};
  final Map<String, bool> _sealglobalChecks = {};
  final Map<String, bool> _ujointsglobalChecks = {};
  final Map<String, bool> _fluidsglobalChecks = {};
  final Map<String, bool> _shocksglobalChecks = {};
  final Map<String, bool> _airbagglobalChecks = {};
  final Map<String, bool> _steeringsglobalChecks = {};
  final Map<String, bool> _mountsglobalChecks = {};
  final Map<String, bool> _airbglobalChecks = {};
  final Map<String, bool> _tiresglobalChecks  = {};
  final Map<String, bool> _exhaustglobalChecks  = {};
  final Map<String, bool> _safetyglobalChecks  = {};
  final Map<String, bool> _electricglobalChecks  = {};

Map<String, WheelInspection> get wheelData => _wheelData;
Map<String, bool> get brakesglobalChecks => _brakesglobalChecks;
Map<String, bool> get sealglobalChecks => _sealglobalChecks;
Map<String, bool> get ujointsglobalChecks => _ujointsglobalChecks;
Map<String, bool> get fluidsglobalChecks => _fluidsglobalChecks;
Map<String, bool> get shocksglobalChecks => _shocksglobalChecks;
Map<String, bool> get airbagglobalChecks => _airbagglobalChecks;
Map<String, bool> get steeringsglobalChecks => _steeringsglobalChecks;
Map<String, bool> get mountsglobalChecks => _mountsglobalChecks;
Map<String, bool> get airbglobalChecks => _airbglobalChecks;
Map<String, bool> get tiresglobalChecks => _tiresglobalChecks;
Map<String, bool> get exhaustglobalChecks => _exhaustglobalChecks;
Map<String, bool> get safetyglobalChecks => _safetyglobalChecks;
Map<String, bool> get electricglobalChecks => _electricglobalChecks;

  String selectedWheel= S.current.wheel_1;

  InspectionData({required this.selectedWheel});

  /// Obtiene la inspección general de una rueda, si no existe la crea
  WheelInspection _getInspection(String wheel) {
    return _wheelData.putIfAbsent(wheel, () => WheelInspection());
  }

  //Metodos para dropdowns de brakes por wheel
  String? getBrakeType(String wheel) => _getInspection(wheel).brakeType;
  void setBrakeType(String wheel, String? type) {
    _getInspection(wheel).brakeType = type;
    notifyListeners();
  }
  String? getBrakeChamberType(String wheel) => _getInspection(wheel).brakeChamberType;
  void setBrakeChamberType(String wheel, String? type) {
    _getInspection(wheel).brakeChamberType = type;
    notifyListeners();
  }

  //Metodos para checks por wheel
  bool getCheck(String wheel, String key) => _getInspection(wheel).wheelchecks[key] ?? false;
  void setCheck(String wheel, String key, bool value) {
    _getInspection(wheel).wheelchecks[key] = value;
    notifyListeners();
  }

  //Cambia la wheel actual
  void setSelectedWheel(String wheel) {
    selectedWheel = wheel;
    notifyListeners();
  }

  void resetWheel(String wheel) {
    final ins = _getInspection(wheel);
    ins.brakeType = null;
    ins.brakeChamberType = null;
    ins.wheelchecks.clear();
    notifyListeners();
  }
  void resetAll() {
    _wheelData.clear();
    notifyListeners();
  }

//---------------------------------------------------------------------------

  //Métodos Globales para Brakes 
  bool getBrakesGlobalCheck(String key) => _brakesglobalChecks[key] ?? false;
  void setBrakesGlobalCheck(String key, bool value) {
    _brakesglobalChecks[key] = value;
    notifyListeners();
  }

  void resetBrakesGlobalChecks() {
    _brakesglobalChecks.clear();
    notifyListeners();
  }

//---------------------------------------------------------------------------

  //Métodos Globales para Seals 
  bool getSealsGlobalCheck(String key) => _sealglobalChecks[key] ?? false;
  void setSealsGlobalCheck(String key, bool value) {
    _sealglobalChecks[key] = value;
    notifyListeners();
  }

  void resetSealsGlobalChecks() {
    _sealglobalChecks.clear();
    notifyListeners();
  }

//---------------------------------------------------------------------------

  //Métodos Globales para Seals 
  bool getUJointsGlobalCheck(String key) => _ujointsglobalChecks[key] ?? false;
  void setUJointsGlobalCheck(String key, bool value) {
    _ujointsglobalChecks[key] = value;
    notifyListeners();
  }

  void resetUJointsGlobalCheck() {
    _ujointsglobalChecks.clear();
    notifyListeners();
  }

//---------------------------------------------------------------------------

  //Métodos Globales para Fluids 
  bool getFluidsGlobalCheck(String key) => _fluidsglobalChecks[key] ?? false;
  void setFluidsGlobalCheck(String key, bool value) {
    _fluidsglobalChecks[key] = value;
    notifyListeners();
  }

  void resetFluidsGlobalCheck() {
    _fluidsglobalChecks.clear();
    notifyListeners();
  }

//---------------------------------------------------------------------------

  //Métodos Globales para Shocks 
  bool getShocksGlobalCheck(String key) => _shocksglobalChecks[key] ?? false;
  void setShocksGlobalCheck(String key, bool value) {
    _shocksglobalChecks[key] = value;
    notifyListeners();
  }

  void resetShocksGlobalCheck() {
    _shocksglobalChecks.clear();
    notifyListeners();
  }

  //---------------------------------------------------------------------------

  //Métodos Globales para Airbags 
  bool getAirbagGlobalCheck(String key) => _airbagglobalChecks[key] ?? false;
  void setAirbagGlobalCheck(String key, bool value) {
    _airbagglobalChecks[key] = value;
    notifyListeners();
  }

  void resetAirbagGlobalCheck() {
    _airbagglobalChecks.clear();
    notifyListeners();
  }

//---------------------------------------------------------------------------

  //Métodos Globales para SteeringS 
  bool getSteeringsGlobalCheck(String key) => _steeringsglobalChecks[key] ?? false;
  void setSteeringsGlobalCheck(String key, bool value) {
    _steeringsglobalChecks[key] = value;
    notifyListeners();
  }

  void resetSteeringsGlobalCheck() {
    _steeringsglobalChecks.clear();
    notifyListeners();
  }

//---------------------------------------------------------------------------

//Métodos Globales para Mounts 
  bool getMountsGlobalCheck(String key) => _mountsglobalChecks[key] ?? false;
  void setMountsGlobalCheck(String key, bool value) {
    _mountsglobalChecks[key] = value;
    notifyListeners();
  }

  void resetMountsGlobalCheck() {
    _mountsglobalChecks.clear();
    notifyListeners();
  }

//---------------------------------------------------------------------------

  //Métodos Globales para Air Brakes 
  bool getAirBGlobalCheck(String key) => _airbglobalChecks[key] ?? false;
  void setAirBGlobalCheck(String key, bool value) {
    _airbglobalChecks[key] = value;
    notifyListeners();
  }

  void resetAirBGlobalCheck() {
    _airbglobalChecks.clear();
    notifyListeners();
  }

//---------------------------------------------------------------------------

  //Métodos Globales para Tires 
  bool getTiresGlobalCheck(String key) => _tiresglobalChecks[key] ?? false;
  void setTiresGlobalCheck(String key, bool value) {
    _tiresglobalChecks[key] = value;
    notifyListeners();
  }

  void resetTiresBGlobalCheck() {
    _tiresglobalChecks.clear();
    notifyListeners();
  }

//---------------------------------------------------------------------------

  //Métodos Globales para Exhaust
  bool getExhaustGlobalCheck(String key) => _exhaustglobalChecks[key] ?? false;
  void setExhaustGlobalCheck(String key, bool value) {
    _exhaustglobalChecks[key] = value;
    notifyListeners();
  }

  void resetExhaustBGlobalCheck() {
    _exhaustglobalChecks.clear();
    notifyListeners();
  }

//---------------------------------------------------------------------------

  //Métodos Globales para Electric
  bool getElectricGlobalCheck(String key) => _electricglobalChecks[key] ?? false;
  void setElectricGlobalCheck(String key, bool value) {
    _electricglobalChecks[key] = value;
    notifyListeners();
  }

  void resetElectricGlobalCheck() {
    _electricglobalChecks.clear();
    notifyListeners();
  }

//---------------------------------------------------------------------------

  //Métodos Globales para Safety
  bool getSafetyGlobalCheck(String key) => _safetyglobalChecks[key] ?? false;
  void setSafetyGlobalCheck(String key, bool value) {
    _safetyglobalChecks[key] = value;
    notifyListeners();
  }

  void resetSafetyGlobalCheck() {
    _safetyglobalChecks.clear();
    notifyListeners();
  }

//---------------------------------------------------------------------------

  //Método para limpiar todo al descartar valores
  void resetAllData() {
  _wheelData.clear();
  _brakesglobalChecks.clear();
  _sealglobalChecks.clear();
  _ujointsglobalChecks.clear();
  _fluidsglobalChecks.clear();
  _shocksglobalChecks.clear();
  _airbagglobalChecks.clear();
  _steeringsglobalChecks.clear();
  _mountsglobalChecks.clear();
  _airbglobalChecks.clear();
  _tiresglobalChecks.clear();
  _exhaustglobalChecks.clear();
  _safetyglobalChecks.clear();
  _electricglobalChecks.clear();
  selectedWheel = S.current.wheel_1;
  notifyListeners();
}

}