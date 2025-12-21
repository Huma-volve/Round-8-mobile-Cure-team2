import 'dart:io';
import 'package:cure_team_2/features/auth/presentation/widgets/phone_number_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _selectedImage;
  String _address = '129, El-Nasr Street, Cairo';

  final ImagePicker _picker = ImagePicker();

  final TextEditingController _nameController = TextEditingController(
    text: 'Seif Mohamed',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'Seifmohamed@gmail.com',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '01********',
  );

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );
      if (image != null) {
        setState(() => _selectedImage = File(image.path));
      }
    } catch (e) {
      debugPrint('Error picking image from camera: $e');
      _showErrorSnackBar('Could not open camera');
    }
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (image != null) {
        setState(() => _selectedImage = File(image.path));
      }
    } catch (e) {
      debugPrint('Error picking image from gallery: $e');
      _showErrorSnackBar('Could not open gallery');
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _showImagePickerBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder:
          (bottomSheetContext) => SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.camera_alt,
                      color: Color(0xFF145DB8),
                    ),
                    title: const Text('Take a photo'),
                    onTap: () {
                      Navigator.pop(bottomSheetContext);
                      _pickImageFromCamera();
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.photo_library,
                      color: Color(0xFF145DB8),
                    ),
                    title: const Text('Choose from gallery'),
                    onTap: () {
                      Navigator.pop(bottomSheetContext);
                      _pickImageFromGallery();
                    },
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void _editAddress() {
    final controller = TextEditingController(text: _address);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder:
          (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16.w,
              right: 16.w,
              top: 16.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Edit Address', style: AppTextStyles.georgiaSubheading),
                16.verticalSpace,
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Enter your address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(color: Color(0xFF145DB8)),
                    ),
                  ),
                ),
                16.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF145DB8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: () {
                      setState(() => _address = controller.text);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                16.verticalSpace,
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ProfileAvatar(
                selectedImage: _selectedImage,
                onCameraTap: _showImagePickerBottomSheet,
                address: _address,
                onAddressTap: _editAddress,
              ),
              24.verticalSpace,

              _ProfileTextField(
                controller: _nameController,
                label: '',
                prefixIcon: Icons.person_rounded,
              ),
              16.verticalSpace,

              _ProfileTextField(
                controller: _emailController,
                label: '',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              16.verticalSpace,

              PhoneNumberField(controller: _phoneController),

              24.verticalSpace,
              const _BirthDateSection(),
              60.verticalSpace,
              const _EditProfileButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData prefixIcon;
  final TextInputType keyboardType;

  const _ProfileTextField({
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Color(0xFF05162C), fontSize: 14),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFF99A2AB)),
        prefixIcon: Icon(prefixIcon, color: const Color(0xFF99A2AB)),
        filled: true,
        fillColor: const Color(0xFFF5F6F7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Color(0xFF145DB8)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  final File? selectedImage;
  final VoidCallback onCameraTap;
  final String address;
  final VoidCallback onAddressTap;

  const _ProfileAvatar({
    required this.selectedImage,
    required this.onCameraTap,
    required this.address,
    required this.onAddressTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 48.r,
              backgroundImage:
                  selectedImage != null
                      ? FileImage(selectedImage!)
                      : const AssetImage('assets/images/profile_image.jpg')
                          as ImageProvider,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: onCameraTap,
                child: Container(
                  width: 24.w,
                  height: 23.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [Color(0xFF145DB8), Color(0xFFFFFFFF)],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      decoration: BoxDecoration(
                        color: const Color(0xE5FFFFFF),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        size: 13,
                        color: Color(0xFF145DB8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        12.verticalSpace,
        Text('Seif Mohamed', style: AppTextStyles.georgiaSubheading),
        4.verticalSpace,
        GestureDetector(
          onTap: onAddressTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Icon.png',
                width: 9.3.w,
                height: 13.5.h,
                fit: BoxFit.contain,
                color: const Color(0xFF6D7379),
              ),
              4.horizontalSpace,
              Text(address, style: AppTextStyles.montserratSmallCaption),
              4.horizontalSpace,
              Icon(
                Icons.keyboard_arrow_down,
                color: const Color(0xFF99a2ab),
                size: 20.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BirthDateSection extends StatelessWidget {
  const _BirthDateSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select your birthday',
          style: AppTextStyles.montserratButton.copyWith(
            color: const Color(0xFF05162C),
          ),
        ),
        12.verticalSpace,
        const Row(
          children: [
            _DateBox(label: '29'),
            SizedBox(width: 12),
            _DateBox(label: 'July'),
            SizedBox(width: 12),
            _DateBox(label: '2024'),
          ],
        ),
      ],
    );
  }
}

class _DateBox extends StatelessWidget {
  final String label;

  const _DateBox({required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
        height: 44.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6F7),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: AppTextStyles.montserratButton),
            4.horizontalSpace,
            const Icon(Icons.keyboard_arrow_down_rounded),
          ],
        ),
      ),
    );
  }
}

class _EditProfileButton extends StatelessWidget {
  const _EditProfileButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF145db8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: () {},
        child: Text(
          'Edit Profile',
          style: AppTextStyles.montserratButton.copyWith(
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
