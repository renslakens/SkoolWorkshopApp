class apis {
  static String baseUrl = 'http://145.49.6.230:3000';
  static String login = '/api/auth/login';
  static String register = '/api/auth/register';
  static String usersEndpoint = '/user';
  static String fileUpload = '/api/';
  static String acceptedProfiles = '/api/user?isAccepted=1';

  static String acceptDocent = '/api/docent/';
  static String unAcceptedDocent = '/api/Docent?isAccepted=0';


  static String deleteProfile = '/api/user/';
  static String jobs = '/api/job/';
    static String getWorkshopDetail = '/api/job/';
    static String getOpdracht = '/api/job';
    static String profiles = '/api/user?isAccepted=1';
}