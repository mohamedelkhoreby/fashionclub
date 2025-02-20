class AppStrings {
  // Splash Screen
  static const appName = "Fashion Club";

  // Onboarding Screen
  static const boardingTitle1 = "Welcome to Fashion Club";
  static const boardingTitle2 = "Never Miss a Beat";
  static const boardingTitle3 = "Your Fashion Journey";
  static const boardingBody1 =
      "Our mission is to make your style stand out, save you money, and care for the planet 🌍.";
  static const boardingBody2 =
      "Stay updated on your orders, explore our exclusive items, and attend special events effortlessly.";
  static const boardingBody3 =
      "Select your items, choose a rental period, and connect with us via phone, WhatsApp, or email.";
  static const bottomContinue = "CONTINUE";
  static const bottomEnter = "ENTER";
  static const bottomSkip = "SKIP";

  // Login & Sign-In
  static const username = "Username";
  static const password = "Password";
  static const usernameError = "Please enter a valid username.";
  static const passwordError = "Please enter your password.";
  static const login = "Log In";
  static const forgetPassword = "Forgot Password?";
  static const registerText = "Sign Up";
  static const loading = "Loading...";
  static const retryAgain = "Retry";
  static const ok = "OK";
  static const emailHint = "Email Address";
  static const invalidEmail = "Invalid email format.";
  static const resetPassword = "Reset Password";
  static const success = "Success!";
  static const userNameInvalid = "Invalid username.";
  static const mobileNumberInvalid = "Invalid mobile number.";
  static const passwordInvalid = "Invalid password.";
  static const alreadyHaveAccount = "Already have an account?";
  static const register = "Sign Up";
  static const mobileNumber = "Mobile Number";

  // Home Screen
  static const homeTitle = "Welcome Back to Fashion Club";
  static const menu = "Menu";

  // Menu & Likes Screen
  static const menuTitle = "Menu";
  static const likeTitle = "Your Favorites";
  static const likeEmpty = "No items yet! Start adding your favorites now. 😪";
  static const price = "EGP";

  // Rent Screen
  static const rentTitle = "Rent Your Style";

  // About Screen
  static const aboutUsTitle = "About Us";
  static const titleConcept = "Our Concept";
  static const description_1 =
      "Our goal is to enhance your style, save you money, and protect the planet 🌍.";
  static const body1 =
      "Choose your items, set the rental period, and reach out to us through the app.";
  static const body2 = "Receive your items via pickup or doorstep delivery.";
  static const body3 =
      "Payment and deposit instructions will be shared post-booking.";
  static const body4 =
      "Return items on time or opt for courier service pick-up 🚴🏼‍♀.";
  static const titleVision = "Our Vision";
  static const visionBody =
      "Fashion Club is your go-to destination for transforming your look with premium brands and expert fashion advice—without breaking the bank or harming the planet ✨.";
  static const contactUs = "Contact Us";
  static const faq = "FAQ";

  // Privacy Policy
  static const privacyTitle = "Privacy Policy";
  static const informationTitle = "Information Collection and Use";
  static const logDataTitle = "Log Data";
  static const serviceTitle = "Service Providers";
  static const securityTitle = "Your Security";
  static const changePrivacyTitle = "Policy Updates";
  static const contactUsTitle = "Reach Out to Us";
  // body
  static const privacyBody =
      "MG built the Fashion Club app as a Commercial app. This SERVICE is provided by Fashion Club and is intended for use as is. This page informs visitors about our policies regarding the collection, use, and disclosure of personal information for those who use our Service. By using our Service, you agree to the collection and use of information as outlined in this policy.";
  static const informationBody =
      "To enhance your experience, we may request certain personally identifiable information, such as your name, email address, and phone number. This information will only be used to improve our Service and will not be shared except as described here.";
  static const logDataBody =
      "When you encounter an error while using our app, we may collect diagnostic data such as your IP address, device details, and usage statistics. This information is used to improve our Service.";
  static const serviceBody =
      "We may employ third-party services to support our Service, analyze usage, or perform related tasks. These third parties are bound to protect your information and use it solely for the purposes we specify.";
  static const securityBody =
      "Your trust is important to us, and we take all reasonable measures to protect your personal information. However, no method of data transmission or storage is completely secure, so we cannot guarantee absolute protection.";
  static const changePrivacyBody =
      "Our Privacy Policy may change periodically. Please review this page for updates. Changes are effective immediately upon posting. This policy was last updated on 2023-6-20.";
  static const contactUsBody =
      "If you have questions or feedback regarding our Privacy Policy, feel free to contact us.";

  // Rent Item Details
  static const priceDetails = "Price Details";
  static const moreDetails = "More Information";
  static const brandDetails = "Brand Name";
  static const sizeDetails = "Available Sizes";
  static const codeForRentDetails = "Rental Code";
  static const remember = "Remember Your Rental Code!";
  static const noRouteFound = "Route Not Found";
  static const discount30 = "30% OFF";
  static const discount40 = "40% OFF";
  static const time24 = "Per Day (24h)";
  static const time48 = "Per 2 Days (48h)";
  static const timeWeek = "Weekly Rental";

  // Error Handling
  static const badRequestError = "Bad Request";
  static const noContent = "No Content Available";
  static const forbiddenError = "Access Denied";
  static const unauthorizedError = "Unauthorized Access";
  static const notFoundError = "Not Found";
  static const conflictError = "Conflict Detected";
  static const internalServerError = "Internal Server Error";
  static const unknownError = "Unknown Error Occurred";
  static const timeoutError = "Request Timed Out";
  static const defaultError = "An Unexpected Error Occurred";
  static const cacheError = "Cache Error";
  static const noInternetError = "No Internet Connection";
}

class ResponseMessage {
 //state
  static const String success = "success";
  static const noRouteFound = "no route found";
  static const loading = "loading...";
  static const retryAgain = "Retry";
  static const ok = "ok";
  //show view
  static const clinicShowView = "let's start with the patient information";
  static const hospitalShowView = "SOON";

  // error handler
  static const String badRequestError =
      "The request was invalid. Please try again.";
  static const String noContent = "No content available.";
  static const String forbiddenError = "Access to this resource is forbidden.";
  static const String unauthorizedError = "You are not authorized.";
  static const String notFoundError = "The requested resource was not found.";
  static const String conflictError = "A conflict occurred. Please try again.";
  static const String internalServerError =
      "An internal server error occurred. Please try later";
  static const String unknownError =
      "An unknown error occurred. Please try again";
  static const String receiveTimeout =
      "The server is taking longer than expected to respond. Please wait a moment and try again.";
  static const String connectTimeout =
      "We’re having trouble connecting to our servers. Please try again.";
  static const String timeoutError =
      "The request timed out. Please check your connection.";
  static const String defaultError = "Please try again another time";
  static const String cacheError = "Failed to retrieve data from cache.";
  static const String noInternetError =
      "No internet connection. Please check your network.";
}
