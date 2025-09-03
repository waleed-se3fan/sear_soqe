import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sear_soqe/core/routes/router_names.dart';

Future<void> showExitPanel(BuildContext context) async {
  final shouldExit = await showGeneralDialog<bool>(
    context: context,
    barrierDismissible: false,
    barrierLabel: "Exit",
    barrierColor: Colors.black.withOpacity(0.3), // dim background
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (context, anim1, anim2) {
      return const SizedBox.shrink();
    },
    transitionBuilder: (context, anim, _, child) {
      final curvedValue = Curves.easeOutBack.transform(anim.value);

      return Transform.scale(
        scale: curvedValue,
        child: Opacity(
          opacity: anim.value,
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25 * anim.value),
                    blurRadius: 30 * anim.value,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.4),
                        width: 1.2,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.exclamationmark_triangle_fill,
                          size: 64,
                          color: Colors.redAccent,
                        ),
                        const SizedBox(height: 18),
                        Text(
                          "هل أنت متأكد؟",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "هل تريد الغاء إضافة السيارة؟",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 28),
                        Row(
                          children: [
                            Expanded(
                              child: CupertinoButton(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.grey.shade200,
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text(
                                  "العودة",
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: CupertinoButton.filled(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                borderRadius: BorderRadius.circular(14),
                                onPressed: () =>
                                    context.go(RouterNames.bottomNavBar),
                                child: const Text(
                                  "نعم ! الغاء",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );

  if (shouldExit == true) {
    SystemNavigator.pop();
  }
}
