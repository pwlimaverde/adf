export 'sign_in_with_google_datasource/stub.dart'
    if (dart.library.js_util) 'sign_in_with_google_datasource/sign_in_with_google_web_datasource.dart'
    if (dart.library.io) 'sign_in_with_google_datasource/sign_in_with_google_android_datasource.dart';