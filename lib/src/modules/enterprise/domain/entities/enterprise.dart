class EnterpriseModel {
  EnterpriseModel({
    this.enterprises,
  });

  List<Enterprise>? enterprises;

  factory EnterpriseModel.fromJson(Map<String, dynamic> json) =>
      EnterpriseModel(
        enterprises: json["enterprises"] == null
            ? null
            : List<Enterprise>.from(
                json["enterprises"].map((x) => Enterprise.fromJson(x))),
      );
}

class Enterprise {
  Enterprise({
    this.id,
    this.emailEnterprise,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.phone,
    this.ownEnterprise=false,
    this.enterpriseName,
    this.photo,
    this.description,
    this.city,
    this.country,
    this.value,
    this.sharePrice,
    this.enterpriseType,
  });

  int? id;
  String? emailEnterprise;
  String? facebook;
  String? twitter;
  String? linkedin;
  String? phone;
  bool ownEnterprise;
  String? enterpriseName;
  String? photo;
  String? description;
  String? city;
  String? country;
  dynamic value;
  double? sharePrice;
  EnterpriseType? enterpriseType;

  factory Enterprise.fromJson(Map<String, dynamic> json) => Enterprise(
        id: json["id"] == null ? null : json["id"],
        emailEnterprise:
            json["email_enterprise"] == null ? null : json["email_enterprise"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        twitter: json["twitter"] == null ? null : json["twitter"],
        linkedin: json["linkedin"] == null ? null : json["linkedin"],
        phone: json["phone"] == null ? null : json["phone"],
        ownEnterprise:
            json["own_enterprise"] == null ? null : json["own_enterprise"],
        enterpriseName:
            json["enterprise_name"] == null ? null : json["enterprise_name"],
        photo: json["photo"] == null ? null : json["photo"],
        description: json["description"] == null ? null : json["description"],
        city: json["city"] == null ? null : json["city"],
        country: json["country"] == null ? null : json["country"],
        value: json["value"] == null ? null : json["value"],
        sharePrice: json["share_price"] == null ? null : json["share_price"],
        enterpriseType: json["enterprise_type"] == null
            ? null
            : EnterpriseType.fromJson(json["enterprise_type"]),
      );
}

class EnterpriseType {
  EnterpriseType({
    this.id,
    this.enterpriseTypeName,
  });

  int? id;
  String? enterpriseTypeName;

  factory EnterpriseType.fromJson(Map<String, dynamic> json) => EnterpriseType(
        id: json["id"] == null ? null : json["id"],
        enterpriseTypeName: json["enterprise_type_name"] == null
            ? null
            : json["enterprise_type_name"],
      );
}
