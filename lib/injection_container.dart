import 'package:Ijakhdem/Core/Network/networkInfo.dart';
import 'package:Ijakhdem/Features/Profile/Data/Datasource/profileRemoteDatasource.dart';
import 'package:Ijakhdem/Features/Profile/Data/Datasource/Implementations/profileRemoteDatasourceImpl.dart';
import 'package:Ijakhdem/Features/Profile/Data/Repositories/profileRepositoryImpl.dart';
import 'package:Ijakhdem/Features/Profile/Domain/Repositories/profileRepository.dart';
import 'package:Ijakhdem/Features/Profile/Domain/Usecases/editProfile.dart';
import 'package:Ijakhdem/Features/Profile/Domain/Usecases/logout.dart';
import 'package:Ijakhdem/Features/Profile/Domain/Usecases/resetPassword.dart';
import 'package:Ijakhdem/Features/Home/Presentation/bloc/home_bloc.dart';
import 'package:Ijakhdem/Features/Messages/Presentation/bloc/messages_bloc.dart';
import 'package:Ijakhdem/Features/MyJobs/Presentation/bloc/myJobs_bloc.dart';
import 'package:Ijakhdem/Features/PostJob/Presentation/bloc/postJob_bloc.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/bloc/profile_bloc.dart';
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
      // logout: sl(),
      // resetPassword: sl(),
      ));

  // ? Use cases
  // sl.registerLazySingleton(() => Logout(sl()));
  // sl.registerLazySingleton(() => ResetPassword(sl()));

  // // ? Repository
  // sl.registerLazySingleton<HomeRepository>(
  //     () => HomeRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // // ? Data sources
  // sl.registerLazySingleton<HomeRemoteDataSource>(
  //     () => HomeRemoteDataSourceImpl(client: sl()));

  //* ---------------------------------  Feature MyJobs  --------------------------

  // ? Bloc
  sl.registerFactory(() => MyJobsBloc());

  // ? Use cases
  // sl.registerLazySingleton(() => Logout(sl()));
  // sl.registerLazySingleton(() => ResetPassword(sl()));

  // ? Repository
  // sl.registerLazySingleton<HomeRepository>(
  //     () => HomeRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // ? Data sources
  // sl.registerLazySingleton<HomeRemoteDataSource>(
  //     () => HomeRemoteDataSourceImpl(client: sl()));

  //* ---------------------------------  Feature PostJobs  --------------------------

  // ? Bloc
  sl.registerFactory(() => PostJobBloc());

  // ? Use cases
  // sl.registerLazySingleton(() => Logout(sl()));
  // sl.registerLazySingleton(() => ResetPassword(sl()));

  // ? Repository
  // sl.registerLazySingleton<HomeRepository>(
  //     () => HomeRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // ? Data sources
  // sl.registerLazySingleton<HomeRemoteDataSource>(
  //     () => HomeRemoteDataSourceImpl(client: sl()));

  //* ---------------------------------  Feature Messages  --------------------------

  // ? Bloc
  sl.registerFactory(() => MessagesBloc());

  // ? Use cases
  // sl.registerLazySingleton(() => Logout(sl()));
  // sl.registerLazySingleton(() => ResetPassword(sl()));

  // ? Repository
  // sl.registerLazySingleton<HomeRepository>(
  //     () => HomeRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // ? Data sources
  // sl.registerLazySingleton<HomeRemoteDataSource>(
  //     () => HomeRemoteDataSourceImpl(client: sl()));

  //* ---------------------------------  Feature Profile  --------------------------

  // ? Bloc
  sl.registerFactory(() => ProfileBloc(
        editProfile: sl(),
        resetPassword: sl(),
        logout: sl(),
      ));

  // ? Use cases
  sl.registerLazySingleton(() => EditProfile(sl()));
  sl.registerLazySingleton(() => Logout(sl()));
  sl.registerLazySingleton(() => ResetPassword(sl()));

  // ? Repository
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // ? Data sources
  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(client: sl()));

  //*--------------------------------------- External  --------------------------------------

  sl.registerLazySingleton(() => SocialMediaService());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => SharedPreferences.getInstance());
}
