import 'package:flutter/material.dart';

bool resultCodeSuccess(int status) {
  if (status >= 400 && status < 500) {
    return false;
  } else {
    return true;
  }
}

SnackBar setupSnackBar(String text) {
  return SnackBar(
    content: Row(children: [
      const Icon(
        Icons.error_outline,
        color: Colors.white,
        size: 21,
      ),
      Expanded(
          child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              )))
    ]),
    duration: const Duration(milliseconds: 4000),
    backgroundColor: Colors.red,
  );
}
