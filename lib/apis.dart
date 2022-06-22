class apis {
  static String baseUrl = 'http://192.168.178.48:3000';
  static String login = '/api/auth/login';
  static String register = '/api/auth/register';
  static String acceptedProfiles = '/api/auth/?isAccepted=1';
  static String unAcceptedProfiles = '/api/auth?isAccepted=0';
  static String applyJob = '/api/job/moderate/';
  static String moderateJobs = '/api/job/moderate/';

  static String authRoute = '/api/auth/';
  static String jobRoute = '/api/job';
  static String locationRoute = '/api/location/';
  static String workshopRoute = '/api/workshop/';
  static String customerRoute = '/api/customer/';
}