import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_theme.dart';
import '../models/address.dart';
import '../providers/address_provider.dart';
import 'address_list_screen.dart';

class AddAddressFormScreen extends ConsumerStatefulWidget {
  final LatLng? initialPosition;
  final SavedAddress? editAddress;

  const AddAddressFormScreen({
    super.key,
    this.initialPosition,
    this.editAddress,
  });

  @override
  ConsumerState<AddAddressFormScreen> createState() =>
      _AddAddressFormScreenState();
}

class _AddAddressFormScreenState extends ConsumerState<AddAddressFormScreen> {
  final _houseController = TextEditingController();
  final _buildingController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  AddressLabel _selectedLabel = AddressLabel.home;

  @override
  void initState() {
    super.initState();
    if (widget.editAddress != null) {
      _nameController.text = widget.editAddress!.name;
      _selectedLabel = widget.editAddress!.label;
    }
  }

  @override
  void dispose() {
    _houseController.dispose();
    _buildingController.dispose();
    _landmarkController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _save() {
    final fullAddress = _houseController.text.trim().isEmpty
        ? (widget.editAddress?.fullAddress ?? 'Address')
        : '${_houseController.text}, ${_buildingController.text}. ${_landmarkController.text}';
    final name = _nameController.text.trim().isEmpty
        ? 'Receiver'
        : _nameController.text;
    final address = SavedAddress(
      id:
          widget.editAddress?.id ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      fullAddress: fullAddress,
      label: _selectedLabel,
      isSelected: true,
      position: widget.initialPosition,
    );
    if (widget.editAddress != null) {
      ref
          .read(addressListProvider.notifier)
          .removeAddress(widget.editAddress!.id);
    }
    ref.read(addressListProvider.notifier).addAddress(address);
    ref.read(mapPositionProvider.notifier).state = null;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const AddressListScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface600,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Add Address Details',
          style: AppTextStyles.titleLarge.copyWith(
            color: AppColors.text500,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 22),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  size: 24,
                  color: AppColors.text500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Address',
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.text500,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'House No. & Floor',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.text400,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _houseController,
                      decoration: const InputDecoration(
                        hintText: 'e.g., 4301 Tyler St',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Building & Block No. (Optional)',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.text400,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _buildingController,
                      decoration: const InputDecoration(
                        hintText: 'e.g., Block A, Tower 2',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Landmark & Area Name (Optional)',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.text400,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _landmarkController,
                      decoration: const InputDecoration(
                        hintText: 'e.g., Near Central Park',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Add Address Label',
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.text500,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _LabelChip(
                          label: 'Home',
                          selected: _selectedLabel == AddressLabel.home,
                          onTap: () => setState(
                            () => _selectedLabel = AddressLabel.home,
                          ),
                        ),
                        const SizedBox(width: 12),
                        _LabelChip(
                          label: 'Work',
                          selected: _selectedLabel == AddressLabel.work,
                          onTap: () => setState(
                            () => _selectedLabel = AddressLabel.work,
                          ),
                        ),
                        const SizedBox(width: 12),
                        _LabelChip(
                          label: 'Other',
                          selected: _selectedLabel == AddressLabel.other,
                          onTap: () => setState(
                            () => _selectedLabel = AddressLabel.other,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Receiver Details',
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.text500,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Receiver's Name",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.text400,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'John',
                        border: const OutlineInputBorder(),
                        suffixIcon: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.text500,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Icon(
                            Icons.person_outline,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Receiver's Phone Number",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.text400,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: '+91 98765 43210',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _save,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Save Address'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LabelChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _LabelChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: selected ? AppColors.green500 : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: selected ? AppColors.green500 : AppColors.borderBlack600,
              width: 1,
            ),
          ),
          child: Text(
            label,
            style: AppTextStyles.labelLarge.copyWith(
              color: selected ? Colors.white : AppColors.text500,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
