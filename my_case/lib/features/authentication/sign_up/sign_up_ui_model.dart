class SignUpUiModel {
  final String? email;
  final String? password;
  final String? name;
  final String? surname;
  final String? dateOfBirth;
  final String? placeOfBirth;
  final String? gender;
  final String? phoneNumber;
  final String? address;
  final String? countryOfAssylum;
  final String? nationality;

  SignUpUiModel({
    this.email,
    this.password,
    this.name,
    this.surname,
    this.dateOfBirth,
    this.placeOfBirth,
    this.address,
    this.countryOfAssylum,
    this.gender,
    this.nationality,
    this.phoneNumber,
  });

  SignUpUiModel copyWith({
    String? email,
    String? password,
    String? name,
    String? surname,
    String? dateOfBirth,
    String? placeOfBirth,
    String? gender,
    String? phoneNumber,
    String? address,
    String? countryOfAssylum,
    String? nationality,
  }) {
    return SignUpUiModel(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      countryOfAssylum: countryOfAssylum ?? this.countryOfAssylum,
      nationality: nationality ?? this.nationality,
    );
  }
}
