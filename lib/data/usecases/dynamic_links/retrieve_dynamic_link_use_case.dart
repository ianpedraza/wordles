import 'package:flutter/material.dart';
import 'package:wordles/data/repositories/dynamic_links_respository.dart';

class RetrieveDynamicLinkUseCase {
  final DynamicLinksRepository repository;

  RetrieveDynamicLinkUseCase({required this.repository});

  Future<void> retrieveDynamicLink(BuildContext context) {
    return repository.retrieveDynamicLink(context);
  }
}
