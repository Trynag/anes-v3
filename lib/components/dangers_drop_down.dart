import 'package:anes/models/dangers_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/strings.dart';
import '../data/http_service.dart';

// ignore: must_be_immutable
class DropDownDangers extends StatefulWidget {
  late List<DangerClass> dangerOptions;
  late TextEditingController dangerController;
  late dynamic dangerSelected;
  final void Function(DangerClass?) onDangerSelectedChanged;

  DropDownDangers({
    super.key,
    required this.dangerOptions,
    required this.dangerSelected,
    required this.dangerController,
    required this.onDangerSelectedChanged,
  });

  @override
  DropDownDangersState createState() => DropDownDangersState();
}

class DropDownDangersState extends State<DropDownDangers> {
  final HttpService httpService = HttpService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(constAgroColorLightGreen),
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                color: Color(constAgroColorLightGreen),
              ),
              child: const Padding(
                padding: EdgeInsets.all(3),
                child: Icon(
                  Icons.warning_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            const Gap(8),
            Expanded(
              child: DropdownButton<DangerClass>(
                value: widget.dangerSelected,
                items: widget.dangerOptions
                    .map(
                      (item) => DropdownMenuItem<DangerClass>(
                        value: item,
                        child: Text(
                          item.name,
                          style: TextStyle(
                            color: widget.dangerSelected == item
                                ? Colors.black
                                : const Color(constSecondaryColorText),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (opt) {
                  widget.onDangerSelectedChanged(opt);
                },
                hint: const Text(
                  'Tipo de peligro',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(constSecondaryColorText),
                  ),
                ),
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 40,
                  color: Color(constAgroColorLightGreen),
                ),
                elevation: 16,
                style: const TextStyle(color: Color(constSecondaryColorText)),
                underline: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
