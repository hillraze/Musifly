import 'package:musifly/utils/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TypewriterText extends StatefulWidget {
  const TypewriterText({
    Key? key,
    required this.text,
    this.isStreaming = false,
    this.typewrite = false,
    this.onTypewriting,
    this.onTypewritingEnd,
    this.useMarkdown = false,
    this.onTapText,
    this.onTapLink,
    this.imageBuilder,
    this.builders,
    this.styleSheet,
  }) : super(key: key);

  final String text;
  final bool isStreaming;
  final bool typewrite;
  final VoidCallback? onTypewriting;
  final VoidCallback? onTypewritingEnd;
  final bool useMarkdown;
  final onTapText;
  final onTapLink;
  final imageBuilder;
  final builders;
  final styleSheet;

  @override
  _TypewriterTextState createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    if (widget.typewrite) _startTyping();
  }

  void _startTyping() {
    Future.delayed(const Duration(milliseconds: 20), () {
      if (mounted) {
        if (index < widget.text.length) {
          setState(() {
            index = (index + 2).clamp(0, widget.text.length);
          });
          _startTyping();
        } else {
          widget.onTypewritingEnd?.call();
        }
        widget.onTypewriting?.call();
      }
    });
  }

  @override
  void didUpdateWidget(covariant TypewriterText oldWidget) {
    if (widget.isStreaming && (widget.text != oldWidget.text)) {
      widget.onTypewriting?.call();
    }
    if (widget.isStreaming == false && oldWidget.isStreaming) {
      widget.onTypewritingEnd?.call();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    String displayedText = widget.typewrite == true
        ? widget.text.substring(0, index)
        : widget.text;

    if (widget.useMarkdown) {
      return MarkdownBody(
        data: displayedText,
        shrinkWrap: true,
        selectable: true,
        onTapText: widget.onTapText,
        onTapLink: widget.onTapLink,
        imageBuilder: widget.imageBuilder,
        builders: widget.builders,
        styleSheet: widget.styleSheet,
      );
    }

    return Text(
      displayedText,
      style: TextStyles.s16,
    );
  }
}
