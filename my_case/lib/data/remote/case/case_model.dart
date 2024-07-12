class CaseModel {
  final int? id;
  final String? description;
  final String? status;
  final String? date;
  final String? type;

  CaseModel({
    this.id,
    this.description,
    this.status,
    this.date,
    this.type,
  });

  factory CaseModel.fromJson(Map<String, dynamic> json) {
    return CaseModel(
      id: json['ID'],
      description: json['Description'],
      status: json['Status'],
      date: json['CreatedAt'],
      type: json['Coverage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'status': status,
      'date': date,
    };
  }
}
