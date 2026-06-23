import 'package:flashcards_learning_app/blocs/topic_creation_bloc/topic_creation_bloc.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PopUpBodyWidget extends StatefulWidget {
  const PopUpBodyWidget({super.key});

  @override
  State<PopUpBodyWidget> createState() => _PopUpBodyWidgetState();
}

class _PopUpBodyWidgetState extends State<PopUpBodyWidget> {
  final TextEditingController _topicController = TextEditingController();

  @override
  void dispose() {
    _topicController.dispose();
    super.dispose();
  }

  void _showSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopicCreationBloc, TopicCreationState>(
      listener: (context, state) {
        final text = state.name;
        if (_topicController.text != text) {
          _topicController.value = TextEditingValue(
            text: text,
            selection: TextSelection.collapsed(offset: text.length),
          );
        }

        if (state.status == TopicCreationStatus.success) {
          Navigator.of(context).pop(true);
          return;
        }

        if (state.status == TopicCreationStatus.failure &&
            state.message != null) {
          _showSnack(state.message!);
          context.read<TopicCreationBloc>().add(
            const TopicCreationEvent.statusConsumed(),
          );
        }
      },
      builder: (context, state) {
        final l10n = l10nOf(context);
        final selectedColor = Color(state.selectedColorValue);
        final canCreate = state.name.trim().isNotEmpty && !state.isLoading;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(l10n.popUpBodyNewTopicTitle, style: AppConst.h1),
              ),
              SizedBox(height: 40),
              Text(l10n.popUpBodyNameLabel, style: AppConst.h2),
              Row(
                children: [
                  Expanded(
                    child: CustomTextfield(
                      controller: _topicController,
                      maxLength: 30,
                      onChanged: (value) {
                        context.read<TopicCreationBloc>().add(
                          TopicCreationEvent.nameChanged(name: value),
                        );
                      },
                    ),
                  ),
                ],
              ),
              if (state.topicSuggestions.isNotEmpty) ...[
                const SizedBox(height: 8),
                TopicsExpansionTile(
                  onTap: (String topicSuggestion) {
                    context.read<TopicCreationBloc>().add(
                      TopicCreationEvent.topicSuggestionSelected(
                        name: topicSuggestion,
                      ),
                    );
                  },
                  topicSuggestions: state.topicSuggestions,
                ),
              ],
              SizedBox(height: 40),
              Text(l10n.popUpBodyTopicColorLabel, style: AppConst.h2),
              ColorSelector(
                selectedColor: selectedColor,
                onColorChange: (colorValue, color) {
                  context.read<TopicCreationBloc>().add(
                    TopicCreationEvent.colorChanged(colorValue: colorValue),
                  );
                },
              ),
              SizedBox(height: 40),
              TextButton(
                onPressed: state.isLoading
                    ? null
                    : () {
                        context.read<TopicCreationBloc>().add(
                          const TopicCreationEvent.jsonImportRequested(),
                        );
                      },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/iconss/file_export.svg',
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                        AppConst.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        l10n.popUpBodyUploadJsonButton,
                        style: AppConst.text.copyWith(color: AppConst.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 350,
                  height: 55,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppConst.buttonBackground,
                      foregroundColor: AppConst.black,
                      disabledBackgroundColor: Color(0x40D7D7D7),
                      side: canCreate
                          ? BorderSide(color: AppConst.primary, width: 2)
                          : BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                    onPressed: canCreate
                        ? () {
                            context.read<TopicCreationBloc>().add(
                              const TopicCreationEvent.createSubmitted(),
                            );
                          }
                        : null,
                    child: state.isLoading
                        ? const SizedBox(
                            height: 40,
                            width: 40,
                            child: FlashcardsLoader(),
                          )
                        : Text(
                            l10n.popUpBodyCreateTopicButton,
                            style: AppConst.text,
                          ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
