import 'package:exar_copilot/constants/constants.dart';
import 'package:exar_copilot/provider/search_field_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key});

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchFieldProvider>(
      builder: (context, searchFieldProvider, child) => Container(
        width: screenWidth! / 6.315, //228
        height: screenWidth! / 36, //40
        margin: EdgeInsets.only(top: screenWidth! / 72), //20
        padding:
            EdgeInsets.only(left: screenWidth! / 96, right: screenWidth! / 180),
        decoration: ShapeDecoration(
          color: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('icons/search_icon.svg'),
                    SizedBox(width: screenWidth! / 96), //15
                  ],
                ),
              ],
            ),
            Expanded(
              child: TextFormField(
                scrollPadding: EdgeInsets.zero,
                style: textTheme.bodyLarge,
                initialValue: null,
                onChanged: (value) {
                  searchFieldProvider.searchPatient(value, context);
                },
                maxLines: 1,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Search',
                  isDense: true,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            Row(
              children: [
                SvgPicture.asset('icons/cmd_icon.svg'),
                SizedBox(width: screenWidth! / 360),
                SvgPicture.asset('icons/k_icon.svg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
