import 'package:flutter/material.dart';

double opacity = 1.0;

SnackBar snackMessage({
  required String title,
  required String description,
  required int primaryColor,
  required int secondaryColor,
  required String image,
}) {
  return SnackBar(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.floating,
    content: Center(
      child: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(microseconds: 300),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 400.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Color(primaryColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  )),
              child: Row(
                children: [
                  const SizedBox(
                    width: 48,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          description,
                          style: const TextStyle(fontSize: 12.0),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0)),
                child: Stack(
                  children: [
                    Image.asset(
                      image,
                      height: 70,
                      width: 58,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -12.0,
              left: 15,
              child: Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  color: Color(secondaryColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
