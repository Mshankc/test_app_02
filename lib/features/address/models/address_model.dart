import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') String? id, // Maps _id from API to this field
    required String name, // Label (Home, Work, Other)
    required String customerName,
    required String address1,
    String? address2,
    required String phone,
    String? email,
    String? city,
    List<double>? coordinates,
    String? pincode,
    String? state,
    String? country,
    String? additionalDirection,
    @Default(false) bool defaultAddress,
    @Default('Active') String status,
    @Default(false)
    bool isSelected, // UI state, not in API necessarily but useful
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
