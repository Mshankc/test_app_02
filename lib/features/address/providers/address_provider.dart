import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/address_model.dart';
import '../repositories/address_repository.dart';
import 'address_state.dart';

part 'address_provider.g.dart';

@riverpod
AddressRepository addressRepository(AddressRepositoryRef ref) {
  return AddressRepository();
}

@riverpod
class AddressNotifier extends _$AddressNotifier {
  @override
  AddressState build() {
    return const AddressState();
  }

  Future<void> loadAddresses() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final repository = ref.read(addressRepositoryProvider);
      final addresses = await repository.getAddresses();
      state = state.copyWith(addresses: addresses, isLoading: false);
    } catch (e) {
      print('🔴 AddressNotifier Load Error: $e');
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> addAddress(AddressModel address) async {
    try {
      final repository = ref.read(addressRepositoryProvider);
      await repository.saveAddress(address);

      state = state.copyWith(addresses: [...state.addresses, address]);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> updateAddress(AddressModel address) async {
    try {
      final repository = ref.read(addressRepositoryProvider);
      await repository.updateAddress(address);

      final updatedAddresses = state.addresses.map((a) {
        return a.id == address.id ? address : a;
      }).toList();

      state = state.copyWith(addresses: updatedAddresses);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> deleteAddress(String id) async {
    try {
      final repository = ref.read(addressRepositoryProvider);
      await repository.deleteAddress(id);

      final updatedAddresses = state.addresses
          .where((a) => a.id != id)
          .toList();
      state = state.copyWith(addresses: updatedAddresses);

      await loadAddresses();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void selectAddress(String id) {
    final updatedAddresses = state.addresses.map((address) {
      return address.copyWith(isSelected: address.id == id);
    }).toList();

    state = state.copyWith(addresses: updatedAddresses);
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }
}
