import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/domain/usecases/user/user.dart';
import 'package:nutri_fit/presentation/ai/bloc/ai_page_cubit.dart';
import 'package:nutri_fit/presentation/ai/bloc/ai_page_state.dart';

class VirtualAssistantScreen extends StatelessWidget {
  final GetUserDataUseCase getUserDataUseCase;
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController =
      ScrollController(); // Добавляем ScrollController

  VirtualAssistantScreen({Key? key, required this.getUserDataUseCase})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VirtualAssistantCubit(getUserDataUseCase: getUserDataUseCase),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pink,
          title: const Text(
            'Virtual Assistant',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
        ),
        body: BlocConsumer<VirtualAssistantCubit, VirtualAssistantState>(
          listener: (context, state) {
            if (state is VirtualAssistantSuccess) {
              // Прокрутка вниз при успешном добавлении сообщения
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (_scrollController.hasClients) {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                }
              });
            }
          },
          builder: (context, state) {
            if (state is VirtualAssistantInitial) {
              context.read<VirtualAssistantCubit>().loadUserData();
              return const Center(child: CircularProgressIndicator());
            } else if (state is VirtualAssistantLoading) {
              return const Center(
                child: Text('Loading...'),
              );
            } else if (state is VirtualAssistantSuccess) {
              return Column(
                children: [
                  Expanded(child: _buildChatList(state)),
                  _buildMessageInputField(context),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            } else if (state is VirtualAssistantFailure) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  /// Builds the chat list UI
  Widget _buildChatList(VirtualAssistantSuccess state) {
    return ListView.builder(
      controller: _scrollController, // Привязываем контроллер прокрутки
      padding: const EdgeInsets.symmetric(vertical: 14),
      itemCount: state.messages.length,
      itemBuilder: (context, index) {
        final message = state.messages[index];
        final isBot = message['type'] == 'bot';
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
                isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              if (isBot)
                CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: const Icon(
                    Icons.support_agent,
                    color: Colors.white,
                    size: 24,
                  ),
                  radius: 24,
                ),
              if (isBot) const SizedBox(width: 10),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isBot ? Colors.red.shade100 : Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    message['text'] ?? 'No message',
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Builds the message input field with send button
  Widget _buildMessageInputField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(fontSize: 18),
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => _handleSendMessage(context),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  /// Handles the send message action
  Future<void> _handleSendMessage(BuildContext context) async {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      try {
        final cubit = context.read<VirtualAssistantCubit>();
        // Отправляем сообщение через существующий Cubit
        await cubit.sendMessage(message);
        _messageController.clear();
      } catch (error) {
        print("[SendMessage] Error: $error");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to send message: $error")),
        );
      }
    } else {
      print("[SendMessage] Ignored empty message.");
    }
  }
}
