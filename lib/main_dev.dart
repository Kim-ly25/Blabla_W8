import 'package:blabla/ui/screens/home/view_model/home_view_model.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'data/repositories/location/location_repository.dart';
import 'data/repositories/location/location_repository_mock.dart';
import 'data/repositories/ride/ride_repository.dart';
import 'data/repositories/ride/ride_repository_mock.dart';
import 'data/repositories/ride_preference/ride_preference_repository.dart';
import 'data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'main_common.dart';

List<SingleChildWidget> get devProviders {
  return [
    // Locations repository
    Provider<LocationRepository>(create: (_) => LocationsRepositoryMock()),

    // Rides repository
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),

    // Ride preferences repository
    Provider<RidePreferencesRepository>(
      create: (_) => RidePreferenceRepositoryMock(),
    ),

    // Ride preference global state
    ChangeNotifierProvider<RidePreferenceState>(
      create: (context) => RidePreferenceState(
        repository: context.read<RidePreferencesRepository>(),
      ),
    ),
    ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(
        ridePreferenceState: context.read<RidePreferenceState>(),
      ),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
