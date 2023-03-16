// ignore_for_file: file_names

//! Authentication Doc

//? Screens(3): PhoneLogin, OtpLogin, OnBoarding
//? Routers: LoginRouter('/login')


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
//?-----------------------------------------------------------------------------
        // todos: 
        // tag: commit: uic-phoneLogin
//?-----------------------------------------------------------------------------


//! OtpLogin
//?-----------------------------------------------------------------------------
        // topsheet Height:
        // AppBar: Text()--Icon()
        // Btn: height()--padding()
        // widgets: 
        // assets:
//?-----------------------------------------------------------------------------
        // blocs: 
        // listenWhen:
        // Listener: ErrorHandling()
        // buildWhen:
        // builder: Loading(): null(): view
//?-----------------------------------------------------------------------------
        // todos:
        // tag: 
//?-----------------------------------------------------------------------------


//! OnBoarding
//?-----------------------------------------------------------------------------
        // topsheet Height:
        // AppBar: Text()--Icon()
        // Btn: height()--padding()
        // widgets: 
        // assets:
//?-----------------------------------------------------------------------------
        // blocs: 
        // listenWhen:
        // Listener: ErrorHandling()
        // buildWhen:
        // builder: Loading(): null(): view
//?-----------------------------------------------------------------------------
        // todos:
        // tag: 
//?-----------------------------------------------------------------------------