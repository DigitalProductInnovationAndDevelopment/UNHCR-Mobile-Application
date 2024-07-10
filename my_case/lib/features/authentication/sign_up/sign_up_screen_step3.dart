import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/core/design_system/components/c_logo.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';
import 'package:my_case/core/design_system/components/c_text_field.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/data/local/country_list.dart';
import 'package:my_case/features/authentication/sign_up/sign_up_controller.dart';
import 'package:my_case/features/authentication/sign_up/sign_up_ui_model.dart';

class SignUpScreenStep3 extends ConsumerStatefulWidget {
  final SignUpUiModel signUpUiModel;
  const SignUpScreenStep3({
    super.key,
    required this.signUpUiModel,
  });

  @override
  ConsumerState<SignUpScreenStep3> createState() => _SignUpScreenStep2State();
}

class _SignUpScreenStep2State extends ConsumerState<SignUpScreenStep3> {
  String? _countryOfAssylumController;
  String? _nationalityController;
  final TextEditingController _provinceOfResidenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CScaffold(
      appBar: CAppBar(
        showSteps: true,
        totalSteps: 3,
        currentStep: 3,
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
            Text(
              "Country of Assylum",
              style: context.text16Bold,
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              width: double.infinity,
              child: DropdownButton<String>(
                isExpanded: true,
                underline: Container(),
                value: _countryOfAssylumController,
                onChanged: (String? newValue) {
                  setState(() {
                    _countryOfAssylumController = newValue!;
                  });
                },
                items: CountryList.countries.map<DropdownMenuItem<String>>((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Nationality",
              style: context.text16Bold,
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              width: double.infinity,
              child: DropdownButton<String>(
                isExpanded: true,
                underline: Container(),
                value: _nationalityController,
                onChanged: (String? newValue) {
                  setState(() {
                    _nationalityController = newValue!;
                  });
                },
                items: CountryList.countries.map<DropdownMenuItem<String>>((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 8),
            CTextField(
              hintText: "Province of Residence",
              title: "Province of Residence",
              controller: _provinceOfResidenceController,
            ),
            const Spacer(),
            CButton(
              text: "Sign Up",
              onTap: () {
                ref.read(signUpControllerProvider).signUp(
                      context: context,
                      signUpUiModel: widget.signUpUiModel.copyWith(
                        countryOfAssylum: _countryOfAssylumController,
                        nationality: _nationalityController,
                        provinceOfResidence: _provinceOfResidenceController.text,
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
