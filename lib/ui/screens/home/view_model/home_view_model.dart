import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required RidePreferenceState ridePreferenceState})
    : _ridePreferenceState = ridePreferenceState {
    _ridePreferenceState.addListener(_onPreferenceStateChanged);
  }

  final RidePreferenceState _ridePreferenceState;

  RidePreference? get currentPreference => _ridePreferenceState.currentPreference;

  List<RidePreference> get history =>
      _ridePreferenceState.history.reversed.toList();

  void selectPreference(RidePreference preferences) {
    _ridePreferenceState.selectPref(preferences);
  }

  void _onPreferenceStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    _ridePreferenceState.removeListener(_onPreferenceStateChanged);
    super.dispose();
  }
}