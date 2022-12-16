class UserWork {
  final String id;
  final String position;
  final String company;
  final String workStartDate;

  const UserWork({
    required this.id,
    required this.position,
    required this.company,
    required this.workStartDate,
  });

  static toUserWork(Map<String, dynamic> data) {
    return UserWork(
      id: data["_id"] ?? "",
      position: data["position"] ?? "",
      company: data["company"] ?? "",
      workStartDate: data["workStartDate"] ?? "",
    );
  }
}
