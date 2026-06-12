import 'package:flutter/material.dart';

/// 재사용 가능한 확인 다이얼로그.
/// [show]를 통해 간편하게 호출하고 bool 결과를 받는다.
class ConfirmDialog extends StatelessWidget {
  final String title;
  final String? message;
  final String confirmText;
  final String cancelText;
  final bool isDestructive;
  final Color backgroundColor;
  final Color titleColor;
  final Color messageColor;
  final Color cancelTextColor;
  final Color confirmColor;
  final Color destructiveColor;

  const ConfirmDialog({
    super.key,
    required this.title,
    this.message,
    this.confirmText = '확인',
    this.cancelText = '취소',
    this.isDestructive = false,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.titleColor = const Color(0xFF24292E),
    this.messageColor = const Color(0xFF586069),
    this.cancelTextColor = const Color(0xFF6A737D),
    this.confirmColor = const Color(0xFF0366D6),
    this.destructiveColor = const Color(0xFFD32F2F),
  });

  /// 다이얼로그를 띄우고 확인 여부를 반환한다. 닫기(X)나 취소는 false.
  static Future<bool> show(
    BuildContext context, {
    required String title,
    String? message,
    String confirmText = '확인',
    String cancelText = '취소',
    bool isDestructive = false,
    Color backgroundColor = const Color(0xFFFFFFFF),
    Color titleColor = const Color(0xFF24292E),
    Color messageColor = const Color(0xFF586069),
    Color cancelTextColor = const Color(0xFF6A737D),
    Color confirmColor = const Color(0xFF0366D6),
    Color destructiveColor = const Color(0xFFD32F2F),
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => ConfirmDialog(
        title: title,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        isDestructive: isDestructive,
        backgroundColor: backgroundColor,
        titleColor: titleColor,
        messageColor: messageColor,
        cancelTextColor: cancelTextColor,
        confirmColor: confirmColor,
        destructiveColor: destructiveColor,
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 320),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (message != null) ...[
                const SizedBox(height: 10),
                Text(
                  message!,
                  style: TextStyle(
                    color: messageColor,
                    fontSize: 13,
                  ),
                ),
              ],
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: TextButton.styleFrom(
                      foregroundColor: cancelTextColor,
                    ),
                    child: Text(cancelText),
                  ),
                  const SizedBox(width: 4),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    style: TextButton.styleFrom(
                      foregroundColor: isDestructive
                          ? destructiveColor
                          : confirmColor,
                    ),
                    child: Text(
                      confirmText,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
