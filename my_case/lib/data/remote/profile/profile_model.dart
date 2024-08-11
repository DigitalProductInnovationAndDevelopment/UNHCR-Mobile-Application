class ProfileModel {
  final int id;
  final String? name;
  final String? surname;
  final String? dateOfBirth;
  final String? placeOfBirth;
  final String? gender;
  final String? phoneNumber;
  final String? emailAddress;
  final String? provinceOfResidence;
  final String? countryOfAsylum;
  final String? unHCRIndividualId;
  final int? householdPersonCount;
  final bool? receiveMessagesFromUNHCR;
  final bool? receiveNotificationsFromUNHCR;
  final bool? receiveSurveysFromUNHCR;

  ProfileModel({
    required this.id,
    this.name,
    this.surname,
    this.dateOfBirth,
    this.placeOfBirth,
    this.gender,
    this.phoneNumber,
    this.emailAddress,
    this.provinceOfResidence,
    this.countryOfAsylum,
    this.unHCRIndividualId,
    this.householdPersonCount,
    this.receiveMessagesFromUNHCR,
    this.receiveNotificationsFromUNHCR,
    this.receiveSurveysFromUNHCR,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['ID'],
      name: json['Name'],
      surname: json['Surname'],
      dateOfBirth: json['DateOfBirth'],
      placeOfBirth: json['PlaceOfBirth'],
      gender: json['Gender'],
      phoneNumber: json['PhoneNumber'],
      emailAddress: json['EmailAddress'],
      provinceOfResidence: json['ProvinceOfResidence'],
      countryOfAsylum: json['CountryOfAsylum'],
      unHCRIndividualId: json['UnhcrIndividualId'],
      householdPersonCount: json['HouseholdPersonCount'],
      receiveMessagesFromUNHCR: json['ReceiveMessagesFromUnhcr'],
      receiveNotificationsFromUNHCR: json['ReceiveNotificationsFromUnhcr'],
      receiveSurveysFromUNHCR: json['ReceiveSurveysFromUnhcr'],
    );
  }
}
