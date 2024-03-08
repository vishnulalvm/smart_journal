import 'package:flutter/material.dart';
import 'package:smart_journal/schememodels/scheme_model.dart';


ValueNotifier<List<NewSchemeModel>>schemelistNotifier=ValueNotifier([]);

void createNewscheme (NewSchemeModel value){
  schemelistNotifier.value.add(value);

}