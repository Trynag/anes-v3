import 'package:anes/components/dialog_back.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isOut;
  final String? userName;
  final String? icon;

  const CustomAppBar({
    super.key,
    this.userName,
    required this.isOut,
    this.icon,
  });

  @override
  CustomAppBarState createState() => CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 550.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    if (!widget.isOut) {
                      return Navigator.pop(context);
                    }

                    validation(context, false);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: null,
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 28.0,
                      color: Color(constAgroColorGreen),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(
                            color: const Color(constAgroColorLightGreen),
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 17,
                        ),
                        height: 36,
                        child: Text(
                          widget.userName ?? 'ANES',
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          height: 52.0,
                          width: 52.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            border: Border.all(
                              width: 2.0,
                              color: const Color(constAgroColorLightGreen),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 3.0,
                              horizontal: 3.0,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 3.0,
                                left: 1.0,
                              ),
                              child: Image.asset(
                                widget.icon ?? constUrbanLogo,
                                // color: Colors.grey[400],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
