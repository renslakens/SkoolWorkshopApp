class apis {
  static String baseUrl = 'http://145.49.24.197:3000';
  static String login = '/api/auth/login';
  static String usersEndpoint = '/user';
  static String fileUpload = '/api/';
  static String acceptedProfiles = '/api/Docent?isAccepted=1';

  static String acceptUser = '/api/auth/';
  static String deleteDocent = '/api/auth/';
  static String unAcceptedDocent = '/api/Docent?isAccepted=0';

  static String deleteProfile = '/api/auth/';
  static String jobs = '/api/job/';
    static String getWorkshopDetail = '/api/job/';
    static String getOpdracht = '/api/job';
    static String profiles = '/api/docent?isAccepted=1';
}