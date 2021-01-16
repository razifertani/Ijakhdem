import 'package:Ijakhdem/Core/Network/networkInfo.dart';
import 'package:Ijakhdem/Features/Home/Data/Datasource/Implementations/homeRemoteDatasourceImpl.dart';
import 'package:Ijakhdem/Features/Home/Data/Datasource/homeRemoteDatasource.dart';
import 'package:Ijakhdem/Features/Home/Data/Repositories/homeRepositoryImpl.dart';
import 'package:Ijakhdem/Features/Home/Domain/Repositories/homeRepository.dart';
import 'package:Ijakhdem/Features/Home/Domain/Usecases/logout.dart';
import 'package:Ijakhdem/Features/Home/Domain/Usecases/resetPassword.dart';
import 'package:Ijakhdem/Features/Home/Presentation/bloc/home_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Data/Datasource/Implementations/socialMediaService.dart';
import 'package:Ijakhdem/Features/Signin/Data/Datasource/Implementations/userRemoteDatasourceImpl.dart';
import 'package:Ijakhdem/Features/Signin/Data/Datasource/userRemoteDatasource.dart';
import 'package:Ijakhdem/Features/Signin/Data/Repositories/userRepositoryImpl.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Repositories/userRepository.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Usecases/forgotPassword.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Usecases/login.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Usecases/loginFacebook.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Usecases/loginGoogle.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Usecases/register.dart';
import 'package:Ijakhdem/Features/Signin/Presentation/bloc/login_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

void init() {
  //* ---------------------------------  Feature Sign in  --------------------------

  // ? Bloc
  sl.registerFactory(() => LoginBloc(
        login: sl(),
        loginGoogle: sl(),
        loginFacebook: sl(),
        register: sl(),
        forgotPassword: sl(),
      ));

  // ? Use cases
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => LoginGoogle(sl()));
  sl.registerLazySingleton(() => LoginFacebook(sl()));
  sl.registerLazySingleton(() => Register(sl()));
  sl.registerLazySingleton(() => ForgotPassword(sl()));

  // ? Repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // ? Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));

  //* ---------------------------------  Feature Home  --------------------------

  // ? Bloc
  sl.registerFactory(() => HomeBloc(
        logout: sl(),
        resetPassword: sl(),
      ));

  // ? Use cases
  sl.registerLazySingleton(() => Logout(sl()));
  sl.registerLazySingleton(() => ResetPassword(sl()));

  // ? Repository
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // ? Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(client: sl()));

  //*--------------------------------------- External  --------------------------------------

  sl.registerLazySingleton(() => SocialMediaService());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => SharedPreferences.getInstance());
}
