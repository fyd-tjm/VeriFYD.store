// ignore_for_file: file_names

//! Authentication Doc


//? Screens(3): PhoneLogin, OtpLogin, OnBoarding
//? Routers: LoginRouter('/login')
//? tag: uic-Auth


//! PhoneLogin
   //?-----------------------------------------------------------------------------
        // Routing Name: /login
        // topsheet Height: 380.h
        // AppBar: Text()--Icon()
        // Btn: height(60.h)--padding(20.w, 20.h)
        //      loading: const SpinKitWave(color: fydBblue, size: 20.0)         
        // widgets: fydTextFormField
        // assets: verifydStore_bg.png, verifyStore_logoWithName
        // colors: 
    //?-----------------------------------------------------------------------------
        // blocs: PhoneLoginBloc

        // listenWhen: 
        // if (context.router.currentUrl == '/login') { return true; } return false;

        // Listener: ErrorHandling()
            // whenOrNull(
            //   invalidPhoneNumber: () => 'invalid Phone Number',
            //   invalidOtpEntered: () => 'invalid Otp Entered',
            //   sessionExpired: () =>
            //       'session Expired: try again',
            //   userDisabled: () => 'user is disabled',
            //   tooManyRequests: () =>
            //       'too Many Requests: try later',
            //   serverError: () => 'server Error: try again',
            //   unknownError: () => 'something went wrong: try again',
            // )

        // buildWhen:
        //   if (context.router.currentUrl == '/login') { return true; } return false;
        
        // builder: Loading(): null(): view
        // events: sendOtp(phoneNumber)
   //?-----------------------------------------------------------------------------
        // todos: 
        // tag: commit: uic-phoneLogin
   //?-----------------------------------------------------------------------------


//! OtpLogin
//?-----------------------------------------------------------------------------
        // routing: /login/otp
        // topsheet Height:
        // AppBar: Text()--Icon()
        // Btn: height()--padding()
        // widgets: fydAppBar(), OtpField()
        // assets: verifydStore_bg.png, verifyStore_logoWithName
//?-----------------------------------------------------------------------------
        // blocs: phoneLogin
        // listenWhen:
        // if (context.router.currentUrl == '/login/otp') { return true; } return false;
        // Listener: same as above
        // buildWhen: 
        // builder: Loading(): null(): view
        // Events: confirmOtp(otp)
//?-----------------------------------------------------------------------------
        // todos:
        // tag: uic-OtpLogin
//?-----------------------------------------------------------------------------


//! OnBoarding
//?-----------------------------------------------------------------------------
        // routing: /boarding
        // topsheet Height: 380.h
        // AppBar: Text()--Icon()
        // Btn: height(60.h)--padding(20.w, 40.h)
        // widgets: fydTextFormField()
        // assets: verifydStore_bg.png, verifyStore_logoWithName
//?-----------------------------------------------------------------------------
        // blocs: onboarding-Cubit + NetworkCubit
        // listenWhen:
        // Listener: ErrorHandling()
        // buildWhen:
        // builder: Loading(): null(): view
//?-----------------------------------------------------------------------------
        // todos: ui Designing
        // tag: uic-onBoarding
//?-----------------------------------------------------------------------------