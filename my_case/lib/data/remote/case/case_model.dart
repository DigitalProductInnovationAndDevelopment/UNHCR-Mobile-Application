class CaseModel {
  final String? id;
  final String? description;
  final String? status;
  final String? date;

  CaseModel({
    this.id,
    this.description,
    this.status,
    this.date,
  });

  factory CaseModel.fromJson(Map<String, dynamic> json) {
    return CaseModel(
      id: json['id'],
      description: json['description'],
      status: json['status'],
      date: json['date'],
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
