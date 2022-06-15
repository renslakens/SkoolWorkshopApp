class apis {
  static String baseUrl = 'http://192.168.1.40:3000';
  static String login = '/api/auth/login';
  static String usersEndpoint = '/user';
  static String fileUpload = '/api/';
  static String acceptedProfiles = '/api/Docent?isAccepted=1';

  static String acceptDocent = '/api/docent/';
  static String unAcceptedDocent = '/api/docent?isAccepted=0';


  static String deleteProfile = '/api/docent/';
  static String jobs = '/api/job/';
    static String getWorkshopDetail = '/api/job/';
    static String getOpdracht = '/api/job';
    static String profiles = '/api/docent?isAccepted=1';
}