import 'package:flutter/foundation.dart';
import '../../data/repositories/ride_preference/ride_preference_repository.dart';
import '../../model/ride_pref/ride_pref.dart';

class RidePreferenceState extends ChangeNotifier {
  RidePreferenceState({required RidePreferencesRepository repository})
    : _repository = repository,
      history = repository.getHistory();

  final RidePreferencesRepository _repository;

  RidePreference? currentPreference; //currently selected preference, can be null if no preference is selected
  
  List<RidePreference> history;//history of all previously selected preferences

  int get maxAllowedSeats => 8;

  void selectPref(RidePreference preference) {
    if (currentPreference == preference) return;

    currentPreference = preference;
    _repository.addPreference(preference);
    history = _repository.getHistory();
    notifyListeners();
  }
}
