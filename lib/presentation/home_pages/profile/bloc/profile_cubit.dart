// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nutri_fit/presentation/home_pages/profile/bloc/profile_state.dart';

// class ProfileCubit extends Cubit<ProfileState> {


//   ProfileCubit(this.fetchProfileStats) : super(ProfileLoading());

//   Future<void> loadProfile() async {
//     try {
//       final stats = await fetchProfileStats();
//       emit(ProfileLoaded());
//     } catch (e) {
//       emit(ProfileError('Failed to load profile data.'));
//     }
//   }
// }