import 'package:flutter/material.dart';
import 'package:wordles/data/domain/wordle.dart';

abstract class DynamicLinksDataSource {
  Future<Uri?> createDynamicLink(Wordle wordle);
  Future<void> retrieveDynamicLink(BuildContext context);
}
