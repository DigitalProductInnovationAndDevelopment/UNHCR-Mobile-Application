import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/core/design_system/components/c_logo.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';
import 'package:my_case/core/design_system/components/c_text_field.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/features/authentication/sign_up/sign_up_ui_model.dart';

class SignUpScreenStep2 extends ConsumerStatefulWidget {
  final SignUpUiModel signUpUiModel;
  const SignUpScreenStep2({
    super.key,
    required this.signUpUiModel,
  });

  @override
  ConsumerState<SignUpScreenStep2> createState() => _SignUpScreenStep2State();
}

class _SignUpScreenStep2State extends ConsumerState<SignUpScreenStep2> {
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _placeOfBirthController = TextEditingController();
  String? _genderController;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CScaffold(
      appBar: CAppBar(
        showSteps: true,
        totalSteps: 3,
        currentStep: 2,
        leading: const CLogo(
          size: 150,
          heroTag: "logo",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ).then((value) {
                  if (value != null) {
                    _dateOfBirthController.text = value.toString().split(" ")[0];
                  }
                });
              },
              child: CTextField(
                hintText: "Date of Birth",
                title: "Date of Birth",
                controller: _dateOfBirthController,
                isDisabled: true,
              ),
            ),
            const SizedBox(height: 8),
            CTextField(
              hintText: "Place of Birth",
              title: "Place of Birth",
              controller: _placeOfBirthController,
            ),
            const SizedBox(height: 16),
            Text(
              "Gender",
              style: context.text16Bold,
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: CColors.primaryColor.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              width: double.infinity,
              child: DropdownButton<String>(
                isExpanded: true,
                underline: Container(),
                value: _genderController,
                onChanged: (String? newValue) {
                  setState(() {
                    _genderController = newValue!;
                  });
                },
                items: [
                  DropdownMenuItem(
                    child: Text("Male"),
                    value: "MALE",
                  ),
                  DropdownMenuItem(
                    child: Text("Female"),
                    value: "FEMALE",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            CTextField(
              hintText: "Phone Number",
              title: "Phone Number",
              controller: _phoneNumberController,
            ),
            const SizedBox(height: 8),
            CTextField(
              hintText: "Address",
              title: "Address",
              controller: _addressController,
            ),
            const Spacer(),
            CButton(
              text: "Continue",
              onTap: () {
                GoRouter.of(context).push(
                  NavigationEnums.signUpScreenStep3.routeName,
                  extra: widget.signUpUiModel.copyWith(
                    dateOfBirth: _dateOfBirthController.text,
                    placeOfBirth: _placeOfBirthController.text,
                    gender: _genderController,
                    phoneNumber: _phoneNumberController.text,
                    address: _addressController.text,
                  ),
                );
              },
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
