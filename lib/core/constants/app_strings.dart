class AppStrings {
  // App
  static const String appName         = 'PrepIQ';
  static const String appTagline      = 'Ace every interview with AI';

  // Onboarding
  static const String onboarding1Title    = 'Practice Like It\'s Real';
  static const String onboarding1Subtitle = 'AI powered mock interviews that feel like the real thing';

  static const String onboarding2Title    = 'Speak Your Answers';
  static const String onboarding2Subtitle = 'Just talk naturally, our AI listens and evaluates every word';

  static const String onboarding3Title    = 'Know Where You Stand';
  static const String onboarding3Subtitle = 'Get instant scores, feedback and tips to improve fast';

  // Buttons
  static const String getStarted         = 'Get Started';
  static const String next               = 'Next';
  static const String skip               = 'Skip';
  static const String continueText       = 'Continue';
  static const String done               = 'Done';

  // Auth
  static const String login              = 'Login';
  static const String register           = 'Register';
  static const String email              = 'Email';
  static const String password           = 'Password';
  static const String fullName           = 'Full Name';
  static const String forgotPassword     = 'Forgot Password?';
  static const String noAccount          = 'Don\'t have an account? ';
  static const String haveAccount        = 'Already have an account? ';
  static const String signUp             = 'Sign Up';
  static const String signIn             = 'Sign In';

  // Home
  static const String welcomeBack        = 'Welcome Back';
  static const String selectRole         = 'Select Job Role';
  static const String selectIndustry     = 'Select Industry';
  static const String generateInterview  = 'Generate Interview';
  static const String recentInterviews   = 'Recent Interviews';
  static const String viewAll            = 'View All';
  static const String resources          = 'Resources';
  static const String tips               = 'Tips';
  static const String questions          = 'Questions';

  // Interview
  static const String interviewStarting  = 'Interview Starting';
  static const String question           = 'Question';
  static const String of                 = 'of';
  static const String tapToSpeak         = 'Tap to Speak';
  static const String listening          = 'Listening...';
  static const String tapToStop          = 'Tap to Stop';
  static const String nextQuestion       = 'Next Question';
  static const String submitAnswer       = 'Submit Answer';
  static const String analyzing          = 'Analyzing your answer...';
  static const String timeLeft           = 'Time Left';

  // Results
  static const String interviewComplete  = 'Interview Complete';
  static const String yourScore          = 'Your Score';
  static const String strengths          = 'Strengths';
  static const String improvements       = 'Areas to Improve';
  static const String suggestions        = 'Suggestions';
  static const String tryAgain           = 'Try Again';
  static const String shareResult        = 'Share Result';
  static const String viewDetails        = 'View Details';

  // History
  static const String interviewHistory   = 'Interview History';
  static const String noHistory          = 'No interviews yet';
  static const String noHistorySubtitle  = 'Start your first interview to see results here';

  // Profile
  static const String profile            = 'Profile';
  static const String editProfile        = 'Edit Profile';
  static const String totalInterviews    = 'Total Interviews';
  static const String averageScore       = 'Average Score';
  static const String bestScore          = 'Best Score';
  static const String logout             = 'Logout';
  static const String settings           = 'Settings';

  // Errors
  static const String somethingWrong     = 'Something went wrong';
  static const String noInternet         = 'No internet connection';
  static const String tryAgainError      = 'Please try again';
  static const String emailInvalid       = 'Please enter a valid email';
  static const String passwordShort      = 'Password must be at least 6 characters';
  static const String fieldRequired      = 'This field is required';

  // Job Roles
 // Industries
static const List<String> industries = [
  'Technology',
  'Finance',
  'Healthcare',
  'Education',
  'E-Commerce',
  'Startup',
  'Government',
  'Telecom',
];

// Roles by industry
static const Map<String, List<String>> rolesByIndustry = {
  'Technology': [
    'Flutter Developer',
    'Python Developer',
    'AWS Cloud Engineer',
    'Frontend Developer',
    'Backend Developer',
    'Full Stack Developer',
    'Data Scientist',
    'DevOps Engineer',
    'UI UX Designer',
    'Product Manager',
  ],
  'Finance': [
    'Financial Analyst',
    'Risk Manager',
    'Investment Banker',
    'Accountant',
    'Compliance Officer',
    'Data Analyst',
    'Fintech Developer',
    'Business Analyst',
  ],
  'Healthcare': [
    'Healthcare Administrator',
    'Medical Data Analyst',
    'Health IT Specialist',
    'Clinical Project Manager',
    'Medical Software Developer',
    'Healthcare Consultant',
  ],
  'Education': [
    'Teacher',
    'Curriculum Developer',
    'Education Administrator',
    'E-Learning Developer',
    'Academic Counselor',
    'Training Specialist',
  ],
  'E-Commerce': [
    'E-Commerce Manager',
    'Digital Marketing Specialist',
    'Product Manager',
    'Supply Chain Manager',
    'UX Designer',
    'Full Stack Developer',
    'SEO Specialist',
    'Business Analyst',
  ],
  'Startup': [
    'Full Stack Developer',
    'Product Manager',
    'Growth Hacker',
    'UI UX Designer',
    'Business Development',
    'Marketing Manager',
    'Flutter Developer',
    'Data Analyst',
  ],
  'Government': [
    'Policy Analyst',
    'Public Administrator',
    'IT Officer',
    'Project Manager',
    'Data Analyst',
    'Compliance Officer',
    'Communications Officer',
  ],
  'Telecom': [
    'Network Engineer',
    'Telecom Analyst',
    'RF Engineer',
    'Software Developer',
    'Project Manager',
    'Business Analyst',
    'Customer Experience Manager',
  ],
};
}