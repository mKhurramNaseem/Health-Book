import 'package:flutter/material.dart';

class MainPartSearchBar extends SliverToBoxAdapter {
  static const _padding = 20.0;
  static const _hint = 'Search Laboratory';
  MainPartSearchBar({super.key})
      : super(
          child: Padding(
            padding: const EdgeInsets.all(_padding),
            child: SearchBar(
              hintText: _hint,
              textInputAction: TextInputAction.done,
              onChanged: (value) {},
              onSubmitted: (value) {},
            ),
          ),
        );
}
