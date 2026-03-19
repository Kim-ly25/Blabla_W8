import '../../../model/ride_pref/ride_pref.dart';
import 'ride_preference_repository.dart';

class RidePreferenceRepositoryMock implements RidePreferencesRepository {
  final List<RidePreference> _history = [];

  @override
  List<RidePreference> getHistory() {
    return _history;
  }

  @override
  void addPreference(RidePreference preference) {
    _history.insert(0, preference);
  }
}