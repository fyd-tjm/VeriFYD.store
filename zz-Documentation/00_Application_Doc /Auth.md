## Authentication Doc
>>>>>>>>>>>>>>>>>>>>>>>>>>

 `Screens`(3): PhoneLogin, OtpLogin, OnBoarding
 `Routers`: LoginRouter(2screens)
 `Routing`: '/login', '/login/otp', '/boarding'
 `tag`: uic-Auth
----------------------------------------------------------

# PhoneLogin ('/login')
>>>>>>>>>>>>>>>>>>>>>>>>>>
*  Ui
        `topsheet Height`: 380.h
        `AppBar`: Text()--Icon()
        `Btn`: height(60.h)--padding(20.w, 20.h)
             loading: const SpinKitWave(color: fydBblue, size: 20.0)         
        `widgets`: fydTextFormField
        `assets`: verifydStore_bg.png, verifyStore_logoWithName
>>>>>>>>>>>>>>>>>>>>>>>>>>
*
        `blocs`: PhoneLoginBloc
        `listenWhen`: (context.router.currentUrl == '/login') 
        `Listener`: ErrorHandling()
                => 'invalid Phone Number',
                => 'invalid Otp Entered',
                => 'session Expired: try again',
                => 'user is disabled',
                => 'too Many Requests: try later',
                => 'server Error: try again',
                => 'something went wrong: try again',
        `buildWhen`: (context.router.currentUrl == '/login')
        `builder`: Loading(): null(): view
        `events`: sendOtp(phoneNumber)
>>>>>>>>>>>>>>>>>>>>>>>>>>
*
        `todos`: =>auto-retrival 
               =>sms..captcha-removal
        `commit`: uic-phoneLogin
----------------------------------------------------------



# OtpLogin ('/login/otp')
//?-----------------------------------------------------------------------------
        topsheet Height:
        AppBar: Text()--Icon()
        Btn: height()--padding()
        widgets: fydAppBar(), OtpField()
        assets: verifydStore_bg.png, verifyStore_logoWithName
//?-----------------------------------------------------------------------------
        blocs: phoneLogin
        listenWhen:
        if (context.router.currentUrl == '/login/otp') { return true; } return false;
        Listener: same as above
        buildWhen: 
        builder: Loading(): null(): view
        Events: confirmOtp(otp)
//?-----------------------------------------------------------------------------
        todos:
        commit: uic-OtpLogin
//?-----------------------------------------------------------------------------


//! OnBoarding
//?-----------------------------------------------------------------------------
        routing: /boarding
        topsheet Height: 380.h
        AppBar: Text()--Icon()
        Btn: height(60.h)--padding(20.w, 40.h)
        widgets: fydTextFormField()
        assets: verifydStore_bg.png, verifyStore_logoWithName
//?-----------------------------------------------------------------------------
        blocs: onboarding-Cubit + NetworkCubit
        listenWhen:
        Listener: ErrorHandling()
        buildWhen:
        builder: Loading(): null(): view
//?-----------------------------------------------------------------------------
        todos: ui Designing
        commit: uic-onBoarding
//?-----------------------------------------------------------------------------