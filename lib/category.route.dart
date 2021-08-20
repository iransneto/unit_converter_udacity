// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'category.widget.dart';
import 'unities.model.dart';

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatefulWidget {
  final String _title;
  final Color? color;

  const CategoryRoute(this._title, {required this.color});

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  Widget _buildCategoryWidgets(List<Category> categories) {
    return ListView.builder(
      itemBuilder: (context, index) => categories[index],
      itemCount: categories.length,
    );
  }

  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(
      10,
      (int index) {
        index++;
        return Unit(
          name: '$categoryName Unit $index',
          conversion: index.toDouble(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];

    for (int index = 0; index < CategoryRoute._categoryNames.length; index++) {
      categories.add(
        Category(
          icon: Icons.cake,
          name: CategoryRoute._categoryNames[index],
          color: CategoryRoute._baseColors[index],
          units: _retrieveUnitList(CategoryRoute._categoryNames[index]),
        ),
      );
    }

    final listView = Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: _buildCategoryWidgets(categories),
    );

    final appBar = AppBar(
      backgroundColor: widget.color,
      elevation: 0,
      title: Text(
        widget._title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: widget.color,
      appBar: appBar,
      body: listView,
    );
  }
}
