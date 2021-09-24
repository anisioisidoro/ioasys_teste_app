class EnterpriseException implements Exception{
  final String message;

  EnterpriseException(this.message);

  @override
  String toString() => "$EnterpriseException(message: $message)";
}