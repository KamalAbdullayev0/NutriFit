abstract class VirtualAssistantState {}

/// Initial State
class VirtualAssistantInitial extends VirtualAssistantState {}

/// Loading State
class VirtualAssistantLoading extends VirtualAssistantState {}

/// Success State
class VirtualAssistantSuccess extends VirtualAssistantState {
  final List<Map<String, String>> messages;
  final bool isLoading;
  final String? errorMessage;

  VirtualAssistantSuccess({
    required this.messages,
    this.isLoading = false,
    this.errorMessage,
  });

  /// Creates a new instance with updated properties
  VirtualAssistantSuccess copyWith({
    List<Map<String, String>>? messages,
    bool? isLoading,
    String? errorMessage,
  }) {
    return VirtualAssistantSuccess(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Failure State
class VirtualAssistantFailure extends VirtualAssistantState {
  final String errorMessage;

  VirtualAssistantFailure({required this.errorMessage});
}
