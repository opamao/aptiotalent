class ApiUrls {
  ApiUrls._();

  // Change base URL
  static const bool change = false;

  // Base URL Candidate
  static const baseUrlProdCandidate = "http://candidat.aptiotalent.com/api";
  static const baseUrlTestCandidate = "http://talent-user.sodalite-consulting.com/api";
  // Base URL Admin
  static const baseUrlProdAdmin = "http://recruteur.aptiotalent.com/api";
  static const baseUrlTestAdmin = "http://talent-admin.sodalite-consulting.com/api";

  // Pour obtenir la bonne base URL
  static String get baseUrlCandidate => change ? baseUrlProdCandidate : baseUrlTestCandidate;
  static String get baseUrlAdmin => change ? baseUrlProdAdmin : baseUrlTestAdmin;

  // Authentication
  static String get postLoginUrl => "$baseUrlCandidate/login";
  static String get postRegisterUrl => "$baseUrlCandidate/register";
  static String get postRetryLoginUrl => "$baseUrlCandidate/loginretry";

}