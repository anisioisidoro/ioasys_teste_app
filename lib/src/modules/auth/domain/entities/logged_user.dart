
class LoggedUserModel {
  LoggedUserModel({
    this.success=false,
    this.errors,
    this.accessToken,
    this.uid,
    this.client,
  });

  bool success;
  List<String>? errors;
  String? accessToken;
  String? uid;
  String? client;

  factory LoggedUserModel.fromJsonError(Map<String, dynamic> json) => LoggedUserModel(
        success: json["success"] == null ? false : json["success"],
        errors: json["errors"] == null
            ? null
            : List<String>.from(json["errors"].map((x) => x)),
      );

      factory LoggedUserModel.fromJsonSucess(Map<String, dynamic> json) => LoggedUserModel(
        success: true,
        errors: json["errors"] == null ? null: List<String>.from(json["errors"].map((x) => x)),
        accessToken: json["access-token"] == null ? null : json["access-token"],
        uid: json["uid"] == null ? null : json["uid"],
        client: json["client"] == null ? null : json["client"],
      );
}
