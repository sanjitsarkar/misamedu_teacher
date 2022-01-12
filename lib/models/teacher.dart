class Teacher {
  List<dynamic> subjects, classes;

  late String fullName,
      degree,
      uid,
      homeAddress,
      phoneNumber,
      communicationAddress,
      verificationCode;
  late bool isVerified;

  Teacher({
    required this.fullName,
    required this.homeAddress,
    required this.phoneNumber,
    required this.communicationAddress,
    required this.classes,
    required this.subjects,
    required this.degree,
    this.isVerified = false,
    this.verificationCode = "",
  });

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      fullName: map["fullName"],
      phoneNumber: map["phoneNumber"],
      classes: map["classes"],
      degree: map["degree"],
      communicationAddress: map["communicationAddress"] ?? "",
      homeAddress: map["homeAddress"] ?? "",
      subjects: map["subjects"],
      isVerified: map["isVerified"],
    );
  }
}
