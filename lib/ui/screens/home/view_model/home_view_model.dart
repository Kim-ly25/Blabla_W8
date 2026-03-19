import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/services/ride_prefs_service.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier{
  RidePreference? get currentPreference => RidePrefsService.selectedPreference;

  List<RidePreference> get history =>
      RidePrefsService.preferenceHistory.reversed.toList();

  void selectPreference(RidePreference preferences) {
    RidePrefsService.selectPreference(preferences);
    notifyListeners();
  }
}