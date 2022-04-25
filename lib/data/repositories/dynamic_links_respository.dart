import 'package:flutter/material.dart';
import 'package:wordles/data/datasources/dynamic_links_data_source.dart';
import 'package:wordles/data/domain/wordle.dart';

class DynamicLinksRepository {
  final DynamicLinksDataSource dataSource;

  DynamicLinksRepository({required this.dataSource});

  Future<Uri?> createDynamicLink(Wordle wordle) {
    return dataSource.createDynamicLink(wordle);
  }

  Future<void> retrieveDynamicLink(BuildContext context) {
    return dataSource.retrieveDynamicLink(context);
  }
}
