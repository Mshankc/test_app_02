import '../models/address_model.dart';

class AddressRepository {
  Future<List<AddressModel>> getAddresses() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      const AddressModel(
        id: '1',
        name: 'Jane Cooper',
        address: '6391 Elgin St. Celina, Delaware 10299',
        type: 'home',
        isSelected: true,
      ),
      const AddressModel(
        id: '2',
        name: 'John Doe',
        address: '1234 Maple Ave, Springfield, Illinois 62704',
        type: 'work',
        isSelected: false,
      ),
      const AddressModel(
        id: '3',
        name: 'Alice Smith',
        address: '5678 Oak St, Lincoln, Nebraska 68508',
        type: 'other',
        isSelected: false,
      ),
      const AddressModel(
        id: '4',
        name: 'Bob Johnson',
        address: '9101 Pine Blvd, Miami, Florida 33101',
        type: 'home',
        isSelected: false,
      ),
      const AddressModel(
        id: '5',
        name: 'Emily Davis',
        address: '1122 Birch Rd, Seattle, Washington 98101',
        type: 'work',
        isSelected: false,
      ),
    ];
  }

  Future<void> saveAddress(AddressModel address) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> updateAddress(AddressModel address) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> deleteAddress(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }
}
