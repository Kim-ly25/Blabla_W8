import 'package:flutter/foundation.dart';

import '../../../../data/repositories/ride/ride_repository.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../states/ride_preference_state.dart';

class RidesSelectionViewModel extends ChangeNotifier {
  RidesSelectionViewModel({
    required RidePreferenceState ridePreferenceState,
    required RideRepository rideRepository,
  }) : _ridePreferenceState = ridePreferenceState,
       _rideRepository = rideRepository {
    _ridePreferenceState.addListener(_onPreferenceStateChanged);
  }

  final RidePreferenceState _ridePreferenceState;
  final RideRepository _rideRepository;

  RidePreference? get selectedRidePreference =>
      _ridePreferenceState.currentPreference;

  List<RidePreference> get preferenceHistory => _ridePreferenceState.history;

  List<Ride> get matchingRides {
    final preference = selectedRidePreference;
    if (preference == null) return const [];

    return _rideRepository
        .getRidesFor()
        .where(
          (ride) =>
              ride.departureLocation == preference.departure &&
              ride.arrivalLocation == preference.arrival &&
              ride.availableSeats >= preference.requestedSeats,
        )
        .toList();
  }

  void selectPreference(RidePreference preference) {
    _ridePreferenceState.selectPref(preference);
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
