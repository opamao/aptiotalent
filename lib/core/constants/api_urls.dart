class ApiUrls {
  ApiUrls._();

  //change base url
  static const bool change = false;

  // Base Url
  static const baseUrlProd = "http://aptiotalent.sodalite-consulting.com/api";
  static const baseUrlTest = "http://192.168.1.4:2704/api";

  // Pour obtenir la bonne base URL
  static String get baseUrl => change ? baseUrlProd : baseUrlTest;

  // Authentification
  static String get postLoginUrl => "$baseUrl/login";
  static String get postRegisterUrl => "$baseUrl/register";
  static String get postRetryLoginUrl => "$baseUrl/loginretry";

}