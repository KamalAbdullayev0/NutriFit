abstract class UserStateProfile {}

class UserInitial extends UserStateProfile {}

class UserLoading extends UserStateProfile {}

class UserDataLoaded extends UserStateProfile {
  final Map<String, dynamic> filteredUserData;
  UserDataLoaded(this.filteredUserData);
}

class UserSendingData extends UserStateProfile {}

class UserDataSentSuccessfully extends UserStateProfile {
  final String response; // Ответ от Swagger
  UserDataSentSuccessfully(this.response);
}

class UserError extends UserStateProfile {
  final String errorMessage;
  UserError(this.errorMessage);
}
