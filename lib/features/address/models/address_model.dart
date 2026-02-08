import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String id,
    required String name,
    required String address,
    required String type,
    @Default(false) bool isSelected,
    String? houseNo,
    String? building,
    String? landmark,
    String? receiverName,
    String? receiverPhone,
    double? latitude,
    double? longitude,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
