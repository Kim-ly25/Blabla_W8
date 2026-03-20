import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

import '../../../../model/ride/ride.dart';
import '../../../../utils/animations_util.dart' show AnimationUtils;
import '../../../theme/theme.dart';
import '../view_model/rides_selection_model.dart';
import 'ride_preference_modal.dart';
import 'rides_selection_header.dart';
import 'rides_selection_tile.dart';

class RidesSelectionContent extends StatelessWidget {
  const RidesSelectionContent({super.key, required this.viewModel});

  final RidesSelectionViewModel viewModel;

  void _onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void _onFilterPressed() {
  }

  void _onRideSelected(Ride ride) {
    // Later
  }

  Future<void> _onPreferencePressed(BuildContext context) async {
    final currentPreference = viewModel.selectedRidePreference;
    if (currentPreference == null) return;

    final newPreference = await Navigator.of(context).push<RidePreference>(
      AnimationUtils.createRightToLeftRoute(
        RidePreferenceModal(initialPreference: currentPreference),
      ),
    );

    if (newPreference != null) {
      viewModel.selectPreference(newPreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedPreference = viewModel.selectedRidePreference;
    final rides = viewModel.matchingRides;

    if (selectedPreference == null) {
      return Center(
        child: Text(
          'No selected preference.',
          style: BlaTextStyles.label.copyWith(color: BlaColors.textNormal),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(
        left: BlaSpacings.m,
        right: BlaSpacings.m,
        top: BlaSpacings.s,
      ),
      child: Column(
        children: [
          RideSelectionHeader(
            ridePreference: selectedPreference,
            onBackPressed: () => _onBackTap(context),
            onFilterPressed: _onFilterPressed,
            onPreferencePressed: () => _onPreferencePressed(context),
          ),
          SizedBox(height: 100),
          Expanded(
            child: ListView.builder(
              itemCount: rides.length,
              itemBuilder: (ctx, index) => RideSelectionTile(
                ride: rides[index],
                onPressed: () => _onRideSelected(rides[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
