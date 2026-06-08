import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_bloc.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_event.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_state.dart';
import 'package:mitho_deals/features/deals/presentation/widgets/add_deal_image_picker.dart';
import 'package:mitho_deals/features/deals/presentation/widgets/add_deal_time_picker.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class AddDealScreen extends StatefulWidget {
  const AddDealScreen({super.key});

  @override
  State<AddDealScreen> createState() => _AddDealScreenState();
}

class _AddDealScreenState extends State<AddDealScreen> {
  final _formKey = GlobalKey<FormState>();
  final _foodNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _originalPriceController = TextEditingController();
  final _discountedPriceController = TextEditingController();
  final _portionsController = TextEditingController();

  File? _selectedImage;
  DateTime? _pickupStartTime;
  DateTime? _pickupEndTime;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _selectedImage = File(picked.path));
    }
  }

  Future<void> _selectDateTime(bool isStart) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 7)),
    );
    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;

    final dateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() {
      if (isStart) {
        _pickupStartTime = dateTime;
      } else {
        _pickupEndTime = dateTime;
      }
    });
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedImage == null) {
      AppSnackBar.showInfo(context, 'Please select an image');
      return;
    }
    if (_pickupStartTime == null || _pickupEndTime == null) {
      AppSnackBar.showInfo(context, 'Please set pickup times');
      return;
    }

    final deal = DealEntity(
      id: '',
      vendorId: '',
      foodName: _foodNameController.text,
      description: _descriptionController.text,
      originalPrice: double.parse(_originalPriceController.text),
      discountedPrice: double.parse(_discountedPriceController.text),
      availablePortions: int.parse(_portionsController.text),
      pickupStartTime: _pickupStartTime!,
      pickupEndTime: _pickupEndTime!,
      imageUrl: '',
      isAvailable: true,
      vendorName: '',
      vendorAddress: '',
      latitude: 0.0,
      longitude: 0.0,
    );

    context.read<DealsBloc>().add(DealsEvent.addDeal(
      deal: deal,
      imageFile: _selectedImage,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DealsBloc, DealsState>(
      listener: (context, state) {
        state.whenOrNull(
          addDealSuccess: () {
            AppSnackBar.showSuccess(context, 'Deal posted successfully!');
            Navigator.pop(context);
          },
          addDealError: (message) => AppSnackBar.showError(context, 'Error: $message'),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          title: const AppText.title('Add New Deal', fontSize: 18),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddDealImagePicker(selectedImage: _selectedImage, onTap: _pickImage),
                SizedBox(height: 24.h),
                AppTextField(
                  controller: _foodNameController,
                  label: 'Food Name',
                  hint: 'e.g., Momo Platter',
                  variant: AppTextFieldVariant.form,
                  validator: (v) => v!.isEmpty ? 'Required' : null,
                ),
                SizedBox(height: 16.h),
                AppTextField(
                  controller: _descriptionController,
                  label: 'Description',
                  hint: 'Describe the food...',
                  variant: AppTextFieldVariant.form,
                  maxLines: 3,
                  validator: (v) => v!.isEmpty ? 'Required' : null,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: _originalPriceController,
                        label: 'Original Price',
                        hint: 'Rs. 500',
                        variant: AppTextFieldVariant.form,
                        keyboardType: TextInputType.number,
                        validator: (v) => v!.isEmpty ? 'Required' : null,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: AppTextField(
                        controller: _discountedPriceController,
                        label: 'Discounted Price',
                        hint: 'Rs. 250',
                        variant: AppTextFieldVariant.form,
                        keyboardType: TextInputType.number,
                        validator: (v) => v!.isEmpty ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                AppTextField(
                  controller: _portionsController,
                  label: 'Available Portions',
                  hint: '5',
                  variant: AppTextFieldVariant.form,
                  keyboardType: TextInputType.number,
                  validator: (v) => v!.isEmpty ? 'Required' : null,
                ),
                SizedBox(height: 24.h),
                AppText.title('Pickup Time Window', fontSize: 16.sp),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      child: AddDealTimePicker(
                        label: 'Start',
                        time: _pickupStartTime,
                        onTap: () => _selectDateTime(true),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: AddDealTimePicker(
                        label: 'End',
                        time: _pickupEndTime,
                        onTap: () => _selectDateTime(false),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                AppButton(
                  label: 'Post Deal',
                  size: AppButtonSize.large,
                  onPressed: _submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
