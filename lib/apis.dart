class apis {
  static String baseUrl = 'http://145.49.7.132:3000';
  static String login = '/api/auth/login';
  static String getUsers = '/api/users';
  static String getUnAcUsers = '/api/user?isAccepted=0';
  static String usersEndpoint = '/user';
  static String fileUpload = '/api/';
  static String acceptedProfiles = '/api/user?isAccepted=1';
  static String deleteProfile = '/api/user/';
  static String jobs = '/api/job/';
}