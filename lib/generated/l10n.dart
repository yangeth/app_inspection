// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login_btn {
    return Intl.message('Login', name: 'login_btn', desc: '', args: []);
  }

  /// `Welcome Back`
  String get welcome_lbl {
    return Intl.message(
      'Welcome Back',
      name: 'welcome_lbl',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `{label} is required`
  String required(Object label) {
    return Intl.message(
      '$label is required',
      name: 'required',
      desc: '',
      args: [label],
    );
  }

  /// `Invalid Email or Password`
  String get invalidEP {
    return Intl.message(
      'Invalid Email or Password',
      name: 'invalidEP',
      desc: '',
      args: [],
    );
  }

  /// `Server timeout`
  String get serverTimeout {
    return Intl.message(
      'Server timeout',
      name: 'serverTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Cannot connect to the server. \nPlease check if is running.`
  String get checkServer {
    return Intl.message(
      'Cannot connect to the server. \nPlease check if is running.',
      name: 'checkServer',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, {name}!`
  String welcome_msj(Object name) {
    return Intl.message(
      'Welcome, $name!',
      name: 'welcome_msj',
      desc: '',
      args: [name],
    );
  }

  /// `{name}`
  String customBarsHi(Object name) {
    return Intl.message('$name', name: 'customBarsHi', desc: '', args: [name]);
  }

  /// `Home`
  String get customBarHome {
    return Intl.message('Home', name: 'customBarHome', desc: '', args: []);
  }

  /// `Vehicle`
  String get customBarHomeVehicle {
    return Intl.message(
      'Vehicle',
      name: 'customBarHomeVehicle',
      desc: '',
      args: [],
    );
  }

  /// `Inspection`
  String get customBarInspection {
    return Intl.message(
      'Inspection',
      name: 'customBarInspection',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get customBarProfile {
    return Intl.message(
      'Profile',
      name: 'customBarProfile',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get title_home {
    return Intl.message('Home', name: 'title_home', desc: '', args: []);
  }

  /// `Vehicle`
  String get title_vehicle {
    return Intl.message('Vehicle', name: 'title_vehicle', desc: '', args: []);
  }

  /// `assets/default_en.png`
  String get path_plates {
    return Intl.message(
      'assets/default_en.png',
      name: 'path_plates',
      desc: '',
      args: [],
    );
  }

  /// `Truck`
  String get vehicle_type1 {
    return Intl.message('Truck', name: 'vehicle_type1', desc: '', args: []);
  }

  /// `Trailer`
  String get vehicle_type2 {
    return Intl.message('Trailer', name: 'vehicle_type2', desc: '', args: []);
  }

  /// `Search plates`
  String get search_Plates {
    return Intl.message(
      'Search plates',
      name: 'search_Plates',
      desc: '',
      args: [],
    );
  }

  /// `Plates`
  String get vehicle_plates {
    return Intl.message('Plates', name: 'vehicle_plates', desc: '', args: []);
  }

  /// `Model`
  String get vehicle_model {
    return Intl.message('Model', name: 'vehicle_model', desc: '', args: []);
  }

  /// `Year`
  String get vehicle_year {
    return Intl.message('Year', name: 'vehicle_year', desc: '', args: []);
  }

  /// `Type`
  String get vehicle_type {
    return Intl.message('Type', name: 'vehicle_type', desc: '', args: []);
  }

  /// `Economic Number`
  String get vehicle_economic_number {
    return Intl.message(
      'Economic Number',
      name: 'vehicle_economic_number',
      desc: '',
      args: [],
    );
  }

  /// `Client`
  String get vehicle_client {
    return Intl.message('Client', name: 'vehicle_client', desc: '', args: []);
  }

  /// `Phone`
  String get customer_phone {
    return Intl.message('Phone', name: 'customer_phone', desc: '', args: []);
  }

  /// `Email`
  String get customer_email {
    return Intl.message('Email', name: 'customer_email', desc: '', args: []);
  }

  /// `Register`
  String get title_register {
    return Intl.message('Register', name: 'title_register', desc: '', args: []);
  }

  /// `Register New Vehicle / Customer`
  String get register_vehicle {
    return Intl.message(
      'Register New Vehicle / Customer',
      name: 'register_vehicle',
      desc: '',
      args: [],
    );
  }

  /// `Save Data`
  String get save_vehicle {
    return Intl.message('Save Data', name: 'save_vehicle', desc: '', args: []);
  }

  /// `Menu`
  String get title_ins_menu {
    return Intl.message('Menu', name: 'title_ins_menu', desc: '', args: []);
  }

  /// `Inspection by Wheel`
  String get title_ins_wheel {
    return Intl.message(
      'Inspection by Wheel',
      name: 'title_ins_wheel',
      desc: '',
      args: [],
    );
  }

  /// `Service Order #{refnum}`
  String title_inspection(Object refnum) {
    return Intl.message(
      'Service Order #$refnum',
      name: 'title_inspection',
      desc: '',
      args: [refnum],
    );
  }

  /// `Wheel Inspection`
  String get w_inspection {
    return Intl.message(
      'Wheel Inspection',
      name: 'w_inspection',
      desc: '',
      args: [],
    );
  }

  /// `Types of brakes`
  String get types_brakes {
    return Intl.message(
      'Types of brakes',
      name: 'types_brakes',
      desc: '',
      args: [],
    );
  }

  /// `Brake Type: {type}`
  String types_brakes_ovr(Object type) {
    return Intl.message(
      'Brake Type: $type',
      name: 'types_brakes_ovr',
      desc: '',
      args: [type],
    );
  }

  /// `Not Defined`
  String get types_ovr_na {
    return Intl.message(
      'Not Defined',
      name: 'types_ovr_na',
      desc: '',
      args: [],
    );
  }

  /// `Brake Chamber Type`
  String get types_brakes_chamber {
    return Intl.message(
      'Brake Chamber Type',
      name: 'types_brakes_chamber',
      desc: '',
      args: [],
    );
  }

  /// `Brake Chamber Type: {type}`
  String types_brakes_chamber_ovr(Object type) {
    return Intl.message(
      'Brake Chamber Type: $type',
      name: 'types_brakes_chamber_ovr',
      desc: '',
      args: [type],
    );
  }

  /// `Not Defined`
  String get types_chamber_ovr_na {
    return Intl.message(
      'Not Defined',
      name: 'types_chamber_ovr_na',
      desc: '',
      args: [],
    );
  }

  /// `Type 24`
  String get types_brakes_chamber_t1 {
    return Intl.message(
      'Type 24',
      name: 'types_brakes_chamber_t1',
      desc: '',
      args: [],
    );
  }

  /// `Type 30`
  String get types_brakes_chamber_t2 {
    return Intl.message(
      'Type 30',
      name: 'types_brakes_chamber_t2',
      desc: '',
      args: [],
    );
  }

  /// `Brakes Checklist`
  String get brakes_Checklist {
    return Intl.message(
      'Brakes Checklist',
      name: 'brakes_Checklist',
      desc: '',
      args: [],
    );
  }

  /// `Wheel 1`
  String get wheel_1 {
    return Intl.message('Wheel 1', name: 'wheel_1', desc: '', args: []);
  }

  /// `Wheel 2`
  String get wheel_2 {
    return Intl.message('Wheel 2', name: 'wheel_2', desc: '', args: []);
  }

  /// `Wheel 3`
  String get wheel_3 {
    return Intl.message('Wheel 3', name: 'wheel_3', desc: '', args: []);
  }

  /// `Wheel 4`
  String get wheel_4 {
    return Intl.message('Wheel 4', name: 'wheel_4', desc: '', args: []);
  }

  /// `Wheel 5`
  String get wheel_5 {
    return Intl.message('Wheel 5', name: 'wheel_5', desc: '', args: []);
  }

  /// `Wheel 6`
  String get wheel_6 {
    return Intl.message('Wheel 6', name: 'wheel_6', desc: '', args: []);
  }

  /// `DISC BRAKE`
  String get brake_disc {
    return Intl.message('DISC BRAKE', name: 'brake_disc', desc: '', args: []);
  }

  /// `DRUM BRAKE`
  String get brake_drum {
    return Intl.message('DRUM BRAKE', name: 'brake_drum', desc: '', args: []);
  }

  /// `Slack Adjuster`
  String get check_slack_adjuster {
    return Intl.message(
      'Slack Adjuster',
      name: 'check_slack_adjuster',
      desc: '',
      args: [],
    );
  }

  /// `Brake Chamber`
  String get check_brake_chamber {
    return Intl.message(
      'Brake Chamber',
      name: 'check_brake_chamber',
      desc: '',
      args: [],
    );
  }

  /// `Brake Drum`
  String get check_brake_drum {
    return Intl.message(
      'Brake Drum',
      name: 'check_brake_drum',
      desc: '',
      args: [],
    );
  }

  /// `Brake Shoes`
  String get check_brake_shoes {
    return Intl.message(
      'Brake Shoes',
      name: 'check_brake_shoes',
      desc: '',
      args: [],
    );
  }

  /// `Wheel Seal`
  String get check_wheel_seal {
    return Intl.message(
      'Wheel Seal',
      name: 'check_wheel_seal',
      desc: '',
      args: [],
    );
  }

  /// `Wheel Bearings`
  String get check_wheel_bearings {
    return Intl.message(
      'Wheel Bearings',
      name: 'check_wheel_bearings',
      desc: '',
      args: [],
    );
  }

  /// `Shock Absorber`
  String get check_shock_absorber {
    return Intl.message(
      'Shock Absorber',
      name: 'check_shock_absorber',
      desc: '',
      args: [],
    );
  }

  /// `Brakes`
  String get title_ins_brakes {
    return Intl.message('Brakes', name: 'title_ins_brakes', desc: '', args: []);
  }

  /// `Apply Brakes While Moving`
  String get check_brakeWhileMoving {
    return Intl.message(
      'Apply Brakes While Moving',
      name: 'check_brakeWhileMoving',
      desc: '',
      args: [],
    );
  }

  /// `Seals`
  String get title_ins_seals {
    return Intl.message('Seals', name: 'title_ins_seals', desc: '', args: []);
  }

  /// `Transmission Seal`
  String get trans_seal {
    return Intl.message(
      'Transmission Seal',
      name: 'trans_seal',
      desc: '',
      args: [],
    );
  }

  /// `Steering Box`
  String get st_box {
    return Intl.message('Steering Box', name: 'st_box', desc: '', args: []);
  }

  /// `Rear Diferential Gasket`
  String get rear_d_g {
    return Intl.message(
      'Rear Diferential Gasket',
      name: 'rear_d_g',
      desc: '',
      args: [],
    );
  }

  /// `Front Diferential Gasket`
  String get front_d_g {
    return Intl.message(
      'Front Diferential Gasket',
      name: 'front_d_g',
      desc: '',
      args: [],
    );
  }

  /// `Pinion Seal`
  String get pinion_seal {
    return Intl.message('Pinion Seal', name: 'pinion_seal', desc: '', args: []);
  }

  /// `Output Diferential Seal`
  String get output_d_s {
    return Intl.message(
      'Output Diferential Seal',
      name: 'output_d_s',
      desc: '',
      args: [],
    );
  }

  /// `Input Diferential Seal`
  String get input_d_s {
    return Intl.message(
      'Input Diferential Seal',
      name: 'input_d_s',
      desc: '',
      args: [],
    );
  }

  /// `Power Diferential Gasket`
  String get power_d_g {
    return Intl.message(
      'Power Diferential Gasket',
      name: 'power_d_g',
      desc: '',
      args: [],
    );
  }

  /// `Seals & Bearings Checklist`
  String get checklist_seals_bearings {
    return Intl.message(
      'Seals & Bearings Checklist',
      name: 'checklist_seals_bearings',
      desc: '',
      args: [],
    );
  }

  /// `Seals Checklist`
  String get checklist_seals {
    return Intl.message(
      'Seals Checklist',
      name: 'checklist_seals',
      desc: '',
      args: [],
    );
  }

  /// `U Joints`
  String get title_ins_u_joints {
    return Intl.message(
      'U Joints',
      name: 'title_ins_u_joints',
      desc: '',
      args: [],
    );
  }

  /// `Steerign Column UJoint`
  String get st_column_Ujoint {
    return Intl.message(
      'Steerign Column UJoint',
      name: 'st_column_Ujoint',
      desc: '',
      args: [],
    );
  }

  /// `Transmission UJoint`
  String get trans_Ujoint {
    return Intl.message(
      'Transmission UJoint',
      name: 'trans_Ujoint',
      desc: '',
      args: [],
    );
  }

  /// `Slip Yoke (Front)`
  String get slipYokeF_Ujoint {
    return Intl.message(
      'Slip Yoke (Front)',
      name: 'slipYokeF_Ujoint',
      desc: '',
      args: [],
    );
  }

  /// `Slip Yoke (Rear)`
  String get slipYokeR_Ujoint {
    return Intl.message(
      'Slip Yoke (Rear)',
      name: 'slipYokeR_Ujoint',
      desc: '',
      args: [],
    );
  }

  /// `Input Diferential UJoint`
  String get inDif_Ujoint {
    return Intl.message(
      'Input Diferential UJoint',
      name: 'inDif_Ujoint',
      desc: '',
      args: [],
    );
  }

  /// `Output Diferential UJoint`
  String get outDif_Ujoint {
    return Intl.message(
      'Output Diferential UJoint',
      name: 'outDif_Ujoint',
      desc: '',
      args: [],
    );
  }

  /// `Pinnion UJoint`
  String get pinnion_Ujoint {
    return Intl.message(
      'Pinnion UJoint',
      name: 'pinnion_Ujoint',
      desc: '',
      args: [],
    );
  }

  /// `Center Bearing UJoint`
  String get centerB_Ujoint {
    return Intl.message(
      'Center Bearing UJoint',
      name: 'centerB_Ujoint',
      desc: '',
      args: [],
    );
  }

  /// `Center Bearing`
  String get center_bearing {
    return Intl.message(
      'Center Bearing',
      name: 'center_bearing',
      desc: '',
      args: [],
    );
  }

  /// `U Joints Checklist`
  String get checklist_Ujoint {
    return Intl.message(
      'U Joints Checklist',
      name: 'checklist_Ujoint',
      desc: '',
      args: [],
    );
  }

  /// `Fluids`
  String get title_ins_fluids {
    return Intl.message('Fluids', name: 'title_ins_fluids', desc: '', args: []);
  }

  /// `Oil Check`
  String get check_oil {
    return Intl.message('Oil Check', name: 'check_oil', desc: '', args: []);
  }

  /// `Antifreeze Level`
  String get antifreeze_level {
    return Intl.message(
      'Antifreeze Level',
      name: 'antifreeze_level',
      desc: '',
      args: [],
    );
  }

  /// `Antifreeze Condition`
  String get antifreeze_condition {
    return Intl.message(
      'Antifreeze Condition',
      name: 'antifreeze_condition',
      desc: '',
      args: [],
    );
  }

  /// `Power Steering Level`
  String get powerSt_level {
    return Intl.message(
      'Power Steering Level',
      name: 'powerSt_level',
      desc: '',
      args: [],
    );
  }

  /// `Hub Oil Level`
  String get hubOil_level {
    return Intl.message(
      'Hub Oil Level',
      name: 'hubOil_level',
      desc: '',
      args: [],
    );
  }

  /// `Transmission Oil Level`
  String get transOil_level {
    return Intl.message(
      'Transmission Oil Level',
      name: 'transOil_level',
      desc: '',
      args: [],
    );
  }

  /// `Transmission Oil Condition`
  String get transOil_condition {
    return Intl.message(
      'Transmission Oil Condition',
      name: 'transOil_condition',
      desc: '',
      args: [],
    );
  }

  /// `Front Diferential Oil Level`
  String get frontDifOil_level {
    return Intl.message(
      'Front Diferential Oil Level',
      name: 'frontDifOil_level',
      desc: '',
      args: [],
    );
  }

  /// `Front Diferential Oil Condition`
  String get frontDifOil_condition {
    return Intl.message(
      'Front Diferential Oil Condition',
      name: 'frontDifOil_condition',
      desc: '',
      args: [],
    );
  }

  /// `Rear Diferential Oil Level`
  String get rearDifOil_level {
    return Intl.message(
      'Rear Diferential Oil Level',
      name: 'rearDifOil_level',
      desc: '',
      args: [],
    );
  }

  /// `Rear Diferential Oil Condition`
  String get rearDifOil_condition {
    return Intl.message(
      'Rear Diferential Oil Condition',
      name: 'rearDifOil_condition',
      desc: '',
      args: [],
    );
  }

  /// `Fluids Checklist`
  String get checklist_fluids {
    return Intl.message(
      'Fluids Checklist',
      name: 'checklist_fluids',
      desc: '',
      args: [],
    );
  }

  /// `Shocks`
  String get title_ins_shocks {
    return Intl.message('Shocks', name: 'title_ins_shocks', desc: '', args: []);
  }

  /// `Sleeper Shock Absorber Check`
  String get checklist_sleeper_shock_absorber {
    return Intl.message(
      'Sleeper Shock Absorber Check',
      name: 'checklist_sleeper_shock_absorber',
      desc: '',
      args: [],
    );
  }

  /// `Sleeper Shock Absorber`
  String get check_SleeperShockAbsorber {
    return Intl.message(
      'Sleeper Shock Absorber',
      name: 'check_SleeperShockAbsorber',
      desc: '',
      args: [],
    );
  }

  /// `Shock Absorber`
  String get check_shock_absorber_scr {
    return Intl.message(
      'Shock Absorber',
      name: 'check_shock_absorber_scr',
      desc: '',
      args: [],
    );
  }

  /// `Shock Absorber Check`
  String get checklist_Shock_Absorber {
    return Intl.message(
      'Shock Absorber Check',
      name: 'checklist_Shock_Absorber',
      desc: '',
      args: [],
    );
  }

  /// `Airbags`
  String get title_ins_airbags {
    return Intl.message(
      'Airbags',
      name: 'title_ins_airbags',
      desc: '',
      args: [],
    );
  }

  /// `Sleeper Airbag`
  String get check_sleeper_airbag {
    return Intl.message(
      'Sleeper Airbag',
      name: 'check_sleeper_airbag',
      desc: '',
      args: [],
    );
  }

  /// `Airbag`
  String get check_airbag {
    return Intl.message('Airbag', name: 'check_airbag', desc: '', args: []);
  }

  /// `Airbag Check`
  String get airbag_checklist {
    return Intl.message(
      'Airbag Check',
      name: 'airbag_checklist',
      desc: '',
      args: [],
    );
  }

  /// `Sleeper Airbag Check`
  String get sleeper_airbag_check {
    return Intl.message(
      'Sleeper Airbag Check',
      name: 'sleeper_airbag_check',
      desc: '',
      args: [],
    );
  }

  /// `Steering & Suspension`
  String get title_ins_steering_and_suspension {
    return Intl.message(
      'Steering & Suspension',
      name: 'title_ins_steering_and_suspension',
      desc: '',
      args: [],
    );
  }

  /// `Steering & Suspension Checklist`
  String get ins_steering_and_suspension_check {
    return Intl.message(
      'Steering & Suspension Checklist',
      name: 'ins_steering_and_suspension_check',
      desc: '',
      args: [],
    );
  }

  /// `King Pings`
  String get check_king_ping {
    return Intl.message(
      'King Pings',
      name: 'check_king_ping',
      desc: '',
      args: [],
    );
  }

  /// `Drag Link`
  String get check_drag_link {
    return Intl.message(
      'Drag Link',
      name: 'check_drag_link',
      desc: '',
      args: [],
    );
  }

  /// `Upper Torque Arms Bushing`
  String get check_upper_torque {
    return Intl.message(
      'Upper Torque Arms Bushing',
      name: 'check_upper_torque',
      desc: '',
      args: [],
    );
  }

  /// `Stabilizer Bar Bushing`
  String get check_stabilizer_bar {
    return Intl.message(
      'Stabilizer Bar Bushing',
      name: 'check_stabilizer_bar',
      desc: '',
      args: [],
    );
  }

  /// `Lower Torque Arms Bushing`
  String get check_lower_torque {
    return Intl.message(
      'Lower Torque Arms Bushing',
      name: 'check_lower_torque',
      desc: '',
      args: [],
    );
  }

  /// `Front Spring Bushing`
  String get check_front_spring {
    return Intl.message(
      'Front Spring Bushing',
      name: 'check_front_spring',
      desc: '',
      args: [],
    );
  }

  /// `Tie Rood End`
  String get check_tie_rood {
    return Intl.message(
      'Tie Rood End',
      name: 'check_tie_rood',
      desc: '',
      args: [],
    );
  }

  /// `Rear Spring Bushing`
  String get check_rear_spring {
    return Intl.message(
      'Rear Spring Bushing',
      name: 'check_rear_spring',
      desc: '',
      args: [],
    );
  }

  /// `Mounts`
  String get title_ins_mounts {
    return Intl.message('Mounts', name: 'title_ins_mounts', desc: '', args: []);
  }

  /// `Mounts Checklist`
  String get title_ins_mounts_checklist {
    return Intl.message(
      'Mounts Checklist',
      name: 'title_ins_mounts_checklist',
      desc: '',
      args: [],
    );
  }

  /// `Radiator Mounts`
  String get check_radiator {
    return Intl.message(
      'Radiator Mounts',
      name: 'check_radiator',
      desc: '',
      args: [],
    );
  }

  /// `Hood Mounts`
  String get check_hood_mounts {
    return Intl.message(
      'Hood Mounts',
      name: 'check_hood_mounts',
      desc: '',
      args: [],
    );
  }

  /// `Hood Swivel / Hinge Bushings`
  String get check_hood_swivel {
    return Intl.message(
      'Hood Swivel / Hinge Bushings',
      name: 'check_hood_swivel',
      desc: '',
      args: [],
    );
  }

  /// `Cab Mount`
  String get check_cab_mount {
    return Intl.message(
      'Cab Mount',
      name: 'check_cab_mount',
      desc: '',
      args: [],
    );
  }

  /// `Sleeper Rod Bushing`
  String get check_sleeper_rod {
    return Intl.message(
      'Sleeper Rod Bushing',
      name: 'check_sleeper_rod',
      desc: '',
      args: [],
    );
  }

  /// `Fifth Wheel Bushing`
  String get check_fifth_wheel_bushing {
    return Intl.message(
      'Fifth Wheel Bushing',
      name: 'check_fifth_wheel_bushing',
      desc: '',
      args: [],
    );
  }

  /// `Front Motor Mounts`
  String get check_front_motor_mounts {
    return Intl.message(
      'Front Motor Mounts',
      name: 'check_front_motor_mounts',
      desc: '',
      args: [],
    );
  }

  /// `Rear Motor Mounts`
  String get check_rear_motor_mounts {
    return Intl.message(
      'Rear Motor Mounts',
      name: 'check_rear_motor_mounts',
      desc: '',
      args: [],
    );
  }

  /// `Air Brakes`
  String get title_ins_air_brakes {
    return Intl.message(
      'Air Brakes',
      name: 'title_ins_air_brakes',
      desc: '',
      args: [],
    );
  }

  /// `Air Brakes Checklist`
  String get title_ins_air_brakes_checklist {
    return Intl.message(
      'Air Brakes Checklist',
      name: 'title_ins_air_brakes_checklist',
      desc: '',
      args: [],
    );
  }

  /// `Low Air Warning Devices`
  String get check_low_air_wrn {
    return Intl.message(
      'Low Air Warning Devices',
      name: 'check_low_air_wrn',
      desc: '',
      args: [],
    );
  }

  /// `Air Pression Build Up`
  String get check_air_pression_bp {
    return Intl.message(
      'Air Pression Build Up',
      name: 'check_air_pression_bp',
      desc: '',
      args: [],
    );
  }

  /// `Tractor Protection Valve`
  String get check_tractor_prot_v {
    return Intl.message(
      'Tractor Protection Valve',
      name: 'check_tractor_prot_v',
      desc: '',
      args: [],
    );
  }

  /// `Tires`
  String get title_ins_tires {
    return Intl.message('Tires', name: 'title_ins_tires', desc: '', args: []);
  }

  /// `Thread`
  String get thread_tires {
    return Intl.message('Thread', name: 'thread_tires', desc: '', args: []);
  }

  /// `Tires`
  String get tires_tires {
    return Intl.message('Tires', name: 'tires_tires', desc: '', args: []);
  }

  /// `Lug`
  String get lug_tires {
    return Intl.message('Lug', name: 'lug_tires', desc: '', args: []);
  }

  /// `Tires Checklist`
  String get checklist_tires {
    return Intl.message(
      'Tires Checklist',
      name: 'checklist_tires',
      desc: '',
      args: [],
    );
  }

  /// `Exhaust`
  String get title_ins_exhaust {
    return Intl.message(
      'Exhaust',
      name: 'title_ins_exhaust',
      desc: '',
      args: [],
    );
  }

  /// `Muffler`
  String get muffler_exhaust {
    return Intl.message('Muffler', name: 'muffler_exhaust', desc: '', args: []);
  }

  /// `Clamps`
  String get clamps_exhaust {
    return Intl.message('Clamps', name: 'clamps_exhaust', desc: '', args: []);
  }

  /// `Elbows`
  String get elbows_exhaust {
    return Intl.message('Elbows', name: 'elbows_exhaust', desc: '', args: []);
  }

  /// `Flex Pipe`
  String get flexpipe_exhaust {
    return Intl.message(
      'Flex Pipe',
      name: 'flexpipe_exhaust',
      desc: '',
      args: [],
    );
  }

  /// `Exhaust Checklist`
  String get checklist_exhaust {
    return Intl.message(
      'Exhaust Checklist',
      name: 'checklist_exhaust',
      desc: '',
      args: [],
    );
  }

  /// `Safety`
  String get title_ins_safety {
    return Intl.message('Safety', name: 'title_ins_safety', desc: '', args: []);
  }

  /// `Windshield`
  String get windshield_safety {
    return Intl.message(
      'Windshield',
      name: 'windshield_safety',
      desc: '',
      args: [],
    );
  }

  /// `Wiper`
  String get wiper_safety {
    return Intl.message('Wiper', name: 'wiper_safety', desc: '', args: []);
  }

  /// `Numbers`
  String get numbers_safety {
    return Intl.message('Numbers', name: 'numbers_safety', desc: '', args: []);
  }

  /// `Lights`
  String get lights_safety {
    return Intl.message('Lights', name: 'lights_safety', desc: '', args: []);
  }

  /// `Reflector`
  String get reflector_safety {
    return Intl.message(
      'Reflector',
      name: 'reflector_safety',
      desc: '',
      args: [],
    );
  }

  /// `Horn`
  String get horn_safety {
    return Intl.message('Horn', name: 'horn_safety', desc: '', args: []);
  }

  /// `Mirrors`
  String get mirrors_safety {
    return Intl.message('Mirrors', name: 'mirrors_safety', desc: '', args: []);
  }

  /// `Cab Glasses`
  String get cabglasses_safety {
    return Intl.message(
      'Cab Glasses',
      name: 'cabglasses_safety',
      desc: '',
      args: [],
    );
  }

  /// `Decals`
  String get decals_safety {
    return Intl.message('Decals', name: 'decals_safety', desc: '', args: []);
  }

  /// `Fuel Tank`
  String get fueltank_safety {
    return Intl.message(
      'Fuel Tank',
      name: 'fueltank_safety',
      desc: '',
      args: [],
    );
  }

  /// `Parking Brake`
  String get pbrake_safety {
    return Intl.message(
      'Parking Brake',
      name: 'pbrake_safety',
      desc: '',
      args: [],
    );
  }

  /// `Cab Condition`
  String get cabcondition_safety {
    return Intl.message(
      'Cab Condition',
      name: 'cabcondition_safety',
      desc: '',
      args: [],
    );
  }

  /// `Gauges`
  String get gauses_safety {
    return Intl.message('Gauges', name: 'gauses_safety', desc: '', args: []);
  }

  /// `Foot Pedal`
  String get footpedal_safety {
    return Intl.message(
      'Foot Pedal',
      name: 'footpedal_safety',
      desc: '',
      args: [],
    );
  }

  /// `Extinguisher`
  String get extintor_safety {
    return Intl.message(
      'Extinguisher',
      name: 'extintor_safety',
      desc: '',
      args: [],
    );
  }

  /// `Safety Checklist`
  String get checklist_safety {
    return Intl.message(
      'Safety Checklist',
      name: 'checklist_safety',
      desc: '',
      args: [],
    );
  }

  /// `Electric`
  String get title_ins_electric {
    return Intl.message(
      'Electric',
      name: 'title_ins_electric',
      desc: '',
      args: [],
    );
  }

  /// `Electric Checklist`
  String get title_ins_electric_checklist {
    return Intl.message(
      'Electric Checklist',
      name: 'title_ins_electric_checklist',
      desc: '',
      args: [],
    );
  }

  /// `Alternator`
  String get check_alternator {
    return Intl.message(
      'Alternator',
      name: 'check_alternator',
      desc: '',
      args: [],
    );
  }

  /// `Starter`
  String get check_starter {
    return Intl.message('Starter', name: 'check_starter', desc: '', args: []);
  }

  /// `Batteries`
  String get check_batery {
    return Intl.message('Batteries', name: 'check_batery', desc: '', args: []);
  }

  /// `Profile`
  String get title_profile {
    return Intl.message('Profile', name: 'title_profile', desc: '', args: []);
  }

  /// `My Data`
  String get profile_my_data {
    return Intl.message('My Data', name: 'profile_my_data', desc: '', args: []);
  }

  /// `Name:`
  String get profile_name {
    return Intl.message('Name:', name: 'profile_name', desc: '', args: []);
  }

  /// `Lastname:`
  String get profile_lastname {
    return Intl.message(
      'Lastname:',
      name: 'profile_lastname',
      desc: '',
      args: [],
    );
  }

  /// `Email:`
  String get profile_email {
    return Intl.message('Email:', name: 'profile_email', desc: '', args: []);
  }

  /// `Role:`
  String get profile_role {
    return Intl.message('Role:', name: 'profile_role', desc: '', args: []);
  }

  /// `Update Data`
  String get profile_update_data {
    return Intl.message(
      'Update Data',
      name: 'profile_update_data',
      desc: '',
      args: [],
    );
  }

  /// `Wait...`
  String get profile_wait {
    return Intl.message('Wait...', name: 'profile_wait', desc: '', args: []);
  }

  /// `Overview`
  String get title_overview {
    return Intl.message('Overview', name: 'title_overview', desc: '', args: []);
  }

  /// `Check`
  String get check {
    return Intl.message('Check', name: 'check', desc: '', args: []);
  }

  /// `Checklist`
  String get checklist {
    return Intl.message('Checklist', name: 'checklist', desc: '', args: []);
  }

  /// `Next`
  String get btn_next {
    return Intl.message('Next', name: 'btn_next', desc: '', args: []);
  }

  /// `Back`
  String get btn_back {
    return Intl.message('Back', name: 'btn_back', desc: '', args: []);
  }

  /// `Already Checked`
  String get already_checked {
    return Intl.message(
      'Already Checked',
      name: 'already_checked',
      desc: '',
      args: [],
    );
  }

  /// `Current Estatus {estatus}`
  String current_estatus(Object estatus) {
    return Intl.message(
      'Current Estatus $estatus',
      name: 'current_estatus',
      desc: '',
      args: [estatus],
    );
  }

  /// `Labor Detail`
  String get title_labor_detail {
    return Intl.message(
      'Labor Detail',
      name: 'title_labor_detail',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Maker`
  String get vehicle_maker {
    return Intl.message(
      'Vehicle Maker',
      name: 'vehicle_maker',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Technician`
  String get technician {
    return Intl.message('Technician', name: 'technician', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Save / Update`
  String get save_update {
    return Intl.message(
      'Save / Update',
      name: 'save_update',
      desc: '',
      args: [],
    );
  }

  /// `Before / Parts`
  String get before_parts {
    return Intl.message(
      'Before / Parts',
      name: 'before_parts',
      desc: '',
      args: [],
    );
  }

  /// `Labor Finished`
  String get labor_finished {
    return Intl.message(
      'Labor Finished',
      name: 'labor_finished',
      desc: '',
      args: [],
    );
  }

  /// `Labor Detail`
  String get labor_detail {
    return Intl.message(
      'Labor Detail',
      name: 'labor_detail',
      desc: '',
      args: [],
    );
  }

  /// `Error uploading image`
  String get error_uploading_image {
    return Intl.message(
      'Error uploading image',
      name: 'error_uploading_image',
      desc: '',
      args: [],
    );
  }

  /// `Image uploaded successfully`
  String get image_uploaded_successfully {
    return Intl.message(
      'Image uploaded successfully',
      name: 'image_uploaded_successfully',
      desc: '',
      args: [],
    );
  }

  /// `No images to upload`
  String get no_images_to_upload {
    return Intl.message(
      'No images to upload',
      name: 'no_images_to_upload',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get labor_name {
    return Intl.message('Name', name: 'labor_name', desc: '', args: []);
  }

  /// `Required Fields`
  String get required_fields {
    return Intl.message(
      'Required Fields',
      name: 'required_fields',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all the data.`
  String get complete_fields {
    return Intl.message(
      'Please fill all the data.',
      name: 'complete_fields',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message('Accept', name: 'accept', desc: '', args: []);
  }

  /// `Service Orders`
  String get service_orders_title {
    return Intl.message(
      'Service Orders',
      name: 'service_orders_title',
      desc: '',
      args: [],
    );
  }

  /// `Ref. Num. {refnum}`
  String ref_num(Object refnum) {
    return Intl.message(
      'Ref. Num. $refnum',
      name: 'ref_num',
      desc: '',
      args: [refnum],
    );
  }

  /// `Discard changes?`
  String get discard_changes_title {
    return Intl.message(
      'Discard changes?',
      name: 'discard_changes_title',
      desc: '',
      args: [],
    );
  }

  /// `You have unsaved changes. Do you want to discard them?`
  String get discard_changes_content {
    return Intl.message(
      'You have unsaved changes. Do you want to discard them?',
      name: 'discard_changes_content',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel_button {
    return Intl.message('Cancel', name: 'cancel_button', desc: '', args: []);
  }

  /// `Discard`
  String get discard_button {
    return Intl.message('Discard', name: 'discard_button', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'MX'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
