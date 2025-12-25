import 'dart:io';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/address_edit_bottom_sheet.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/birth_date_section.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/date_picker_bottom_sheet.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/edit_profile_button.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/image_picker_bottom_sheet.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/profile_avatar.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cure_team_2/features/auth/presentation/widgets/phone_number_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _selectedImage;
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

  String _address = '129, El-Nasr Street, Cairo';
  int _selectedDay = 29;
  int _selectedMonth = 7;
  int _selectedYear = 2024;

  static const List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  int _getDaysInMonth(int month, int year) {
    return DateTime(year, month + 1, 0).day;
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

  // Bottom sheet handlers
  void _showImagePicker() {
    ImagePickerBottomSheet.show(
      context: context,
      onCameraTap: _pickImageFromCamera,
      onGalleryTap: _pickImageFromGallery,
    );
  }

  void _showAddressEditor() {
    AddressEditBottomSheet.show(
      context: context,
      initialAddress: _address,
      onSave: (newAddress) {
        setState(() => _address = newAddress);
      },
    );
  }

  void _showDayPicker() {
    DatePickerBottomSheet.show(
      context: context,
      type: DatePickerType.day,
      initialValue: _selectedDay,
      daysInMonth: _getDaysInMonth(_selectedMonth, _selectedYear),
      onSelected: (day) {
        setState(() => _selectedDay = day);
      },
    );
  }

  void _showMonthPicker() {
    DatePickerBottomSheet.show(
      context: context,
      type: DatePickerType.month,
      initialValue: _selectedMonth,
      onSelected: (month) {
        setState(() {
          _selectedMonth = month;
          final daysInMonth = _getDaysInMonth(_selectedMonth, _selectedYear);
          if (_selectedDay > daysInMonth) {
            _selectedDay = daysInMonth;
          }
        });
      },
    );
  }

  void _showYearPicker() {
    DatePickerBottomSheet.show(
      context: context,
      type: DatePickerType.year,
      initialValue: _selectedYear,
      onSelected: (year) {
        setState(() {
          _selectedYear = year;
          final daysInMonth = _getDaysInMonth(_selectedMonth, _selectedYear);
          if (_selectedDay > daysInMonth) {
            _selectedDay = daysInMonth;
          }
        });
      },
    );
  }

  void _onEditProfilePressed() {
    debugPrint('Name: ${_nameController.text}');
    debugPrint('Email: ${_emailController.text}');
    debugPrint('Phone: ${_phoneController.text}');
    debugPrint('Address: $_address');
    debugPrint('Birthday: $_selectedDay/$_selectedMonth/$_selectedYear');
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
              ProfileAvatar(
                selectedImage: _selectedImage,
                name: _nameController.text,
                address: _address,
                onCameraTap: _showImagePicker,
                onAddressTap: _showAddressEditor,
              ),
              24.verticalSpace,
              ProfileTextField(
                controller: _nameController,
                label: '',
                prefixIcon: Icons.person_rounded,
              ),
              16.verticalSpace,
              ProfileTextField(
                controller: _emailController,
                label: '',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              16.verticalSpace,
              PhoneNumberField(controller: _phoneController),
              24.verticalSpace,
              BirthDateSection(
                selectedDay: _selectedDay,
                monthName: _months[_selectedMonth - 1],
                selectedYear: _selectedYear,
                onDayTap: _showDayPicker,
                onMonthTap: _showMonthPicker,
                onYearTap: _showYearPicker,
              ),
              60.verticalSpace,
              EditProfileButton(
                onPressed: _onEditProfilePressed,
                text: 'Edit Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
