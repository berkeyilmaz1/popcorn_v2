import 'package:async/async.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/border_radius_general.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';

final class SearchField extends StatefulWidget {
  const SearchField({
    required this.onChanged,
    required this.onClear,
    required this.controller,
    super.key,
  });
  final void Function(String value) onChanged;
  final VoidCallback onClear;
  final TextEditingController controller;

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late CancelableOperation<void> cancellableOperation;
  final _delayTime = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() {
    cancellableOperation = CancelableOperation.fromFuture(
      Future.delayed(_delayTime),
      onCancel: () {
        print('Canceled');
      },
    );
  }

  void _onItemChanged(String value) {
    cancellableOperation.cancel();
    _start();
    cancellableOperation.value.whenComplete(() {
      widget.onChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: TextField(
        controller: widget.controller,
        style: const TextStyle(color: ProductColors.white),
        onChanged: _onItemChanged,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: ProductColors.white,
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.clear,
              color: ProductColors.white,
            ),
            onPressed: widget.onClear,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingLabelStyle: const TextStyle(
            color: ProductColors.white,
          ),
          labelText: LocaleKeys.search_search.tr(),
          labelStyle: const TextStyle(
            color: ProductColors.white,
          ),
          fillColor: Colors.grey.withOpacity(0.5),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadiusGeneral.allLow(),
          ),
        ),
        cursorColor: ProductColors.purple,
      ),
    );
  }
}
