import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:nutri_fit/domain/usecases/user/user.dart';
import 'package:nutri_fit/presentation/ai/bloc/ai_page_state.dart';

class VirtualAssistantCubit extends Cubit<VirtualAssistantState> {
  final GetUserDataUseCase getUserDataUseCase;
  final Dio _dio;
  String? _userId;

  VirtualAssistantCubit({required this.getUserDataUseCase})
      : _dio = Dio(BaseOptions(
          baseUrl:
              "http://46.101.119.129:5000", // Replace with your Swagger URL
          headers: {"Content-Type": "application/json"},
        )),
        super(VirtualAssistantInitial()) {
    _initialize();
  }

  /// Initialize the cubit by loading user data
  void _initialize() {
    print("[Cubit Initialized] VirtualAssistantCubit created.");
    loadUserData();
  }

  /// Load user data from Firebase
  Future<void> loadUserData() async {
    print("[LOAD USER DATA] Loading user data...");
    emit(VirtualAssistantLoading());

    final result = await getUserDataUseCase();

    result.fold(
      (failure) {
        print("[LOAD USER DATA] Failed: $failure");
        emit(VirtualAssistantFailure(
          errorMessage: 'Failed to load user data: $failure',
        ));
      },
      (userEntity) {
        print("[LOAD USER DATA] Success: $userEntity");
        _userId = userEntity.uid;
        _emitSuccessStateWithInitialMessage();
      },
    );
  }

  /// Send user message and get bot response
  Future<void> sendMessage(String question) async {
    print("[SEND MESSAGE] Received question: '$question'");

    if (question.trim().isEmpty) {
      print("[SEND MESSAGE] Question is empty. Aborting.");
      return;
    }

    if (_userId == null) {
      print("[SEND MESSAGE] User ID is null. Reloading user data...");
      await loadUserData();

      if (_userId == null) {
        emit(VirtualAssistantFailure(
          errorMessage: "User ID not available. Please try again later.",
        ));
        return;
      }
    }

    emit(VirtualAssistantLoading()); // Состояние сброса перед отправкой

    try {
      print("[SEND MESSAGE] Sending request to the server...");
      final response = await _dio.post(
        "/question_answer",
        data: jsonEncode({"question": question, "user_id": _userId}),
      );

      final botResponse = response.data['response'] ?? "No response received.";
      print("[SEND MESSAGE] Received response: '$botResponse'");

      // Проверяем текущее состояние перед добавлением сообщений
      final messages = state is VirtualAssistantSuccess
          ? (state as VirtualAssistantSuccess).messages
          : [];

      emit(VirtualAssistantSuccess(
        messages: [
          ...messages, // Добавляем существующие сообщения
          {"type": "user", "text": question},
          {"type": "bot", "text": botResponse},
        ],
        isLoading: false,
      ));
    } catch (error) {
      print("[SEND MESSAGE] Error occurred: $error");
      emit(VirtualAssistantFailure(
        errorMessage: "An error occurred while processing your request.",
      ));
    }
  }

  /// Emit a success state with the initial bot message
  void _emitSuccessStateWithInitialMessage() {
    emit(VirtualAssistantSuccess(
      messages: [
        {
          "type": "bot",
          "text":
              "Hello! I am your virtual assistant. How can I help you today?",
        },
      ],
      isLoading: false,
    ));
  }

  /// Add a new message to the chat
  void _addMessage({
    required String type,
    required String text,
    required bool isLoading,
  }) {
    if (state is VirtualAssistantSuccess) {
      final currentState = state as VirtualAssistantSuccess;
      emit(currentState.copyWith(
        messages: [
          ...currentState.messages,
          {"type": type, "text": text},
        ],
        isLoading: isLoading,
      ));
    } else {
      print("[ADD MESSAGE] State is not success. Cannot add message.");
    }
  }
}
