// import 'package:flutter/material.dart';
//
// class SelectCurrenciesListModel extends ChangeNotifier {
//
// }
//
// class SelectCurrenciesListModelProvider extends InheritedNotifier {
//   final SelectCurrenciesListModel model;
//
//   const SelectCurrenciesListModelProvider({
//     required this.model,
//     Key? key,
//     required Widget child,
//   }) : super(key: key, child: child);
//
//   static of(BuildContext context) {
//     final SelectCurrenciesListModelProvider? result =
//         context.dependOnInheritedWidgetOfExactType<SelectCurrenciesListModelProvider>();
//     assert(result != null, 'No  found in context');
//     return result!;
//   }
//
//   @override
//   bool updateShouldNotify(old) {
//     return true;
//   }
// }
