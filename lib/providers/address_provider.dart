import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/address.dart';

final addressListProvider = StateNotifierProvider<AddressListNotifier, List<SavedAddress>>((ref) {
  return AddressListNotifier();
});

class AddressListNotifier extends StateNotifier<List<SavedAddress>> {
  AddressListNotifier()
      : super([
          const SavedAddress(
            id: '1',
            name: 'Jane Cooper',
            fullAddress: '6391 Elgin St. Celina, Delaware 10299',
            label: AddressLabel.home,
            isSelected: true,
          ),
          const SavedAddress(
            id: '2',
            name: 'John Doe',
            fullAddress: '1234 Maple Ave. Springfield, Illinois 62704',
            label: AddressLabel.work,
          ),
          const SavedAddress(
            id: '3',
            name: 'Alice Smith',
            fullAddress: '5678 Oak St. Lincoln, Nebraska 68508',
            label: AddressLabel.work,
          ),
          const SavedAddress(
            id: '4',
            name: 'Bob Johnson',
            fullAddress: '9101 Pine Blvd. Miami, Florida 33101',
            label: AddressLabel.other,
          ),
          const SavedAddress(
            id: '5',
            name: 'Emily Davis',
            fullAddress: '1122 Birch Rd. Seattle, Washington 98101',
            label: AddressLabel.other,
          ),
        ]);

  void selectAddress(String id) {
    state = state
        .map((a) => a.copyWith(isSelected: a.id == id))
        .toList();
  }

  void addAddress(SavedAddress address) {
    state = [
      ...state.map((a) => a.copyWith(isSelected: false)),
      address.copyWith(isSelected: true),
    ];
  }

  void removeAddress(String id) {
    state = state.where((a) => a.id != id).toList();
    if (state.isNotEmpty && state.every((a) => !a.isSelected)) {
      state = [
        state.first.copyWith(isSelected: true),
        ...state.skip(1),
      ];
    }
  }
}

final mapPositionProvider = StateProvider<LatLng?>((ref) => null);

final addressFormProvider = StateProvider<AddressFormData>((ref) => AddressFormData());

final searchQueryProvider = StateProvider<String>((ref) => '');
