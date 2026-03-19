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
  ];
}

void main() {
  mainCommon(devProviders);
}
