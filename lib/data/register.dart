import 'package:injector/injector.dart';
import 'package:wordles/data/datasources/dynamic_links_data_source.dart';
import 'package:wordles/data/datasources/wordles_data_source.dart';
import 'package:wordles/data/framework/firebase/firebase_dynamic_links_data_source.dart';
import 'package:wordles/data/framework/firebase/firebase_wordles_data_source.dart';
import 'package:wordles/data/repositories/dynamic_links_respository.dart';
import 'package:wordles/data/repositories/wordles_respository.dart';
import 'package:wordles/data/usecases/dynamic_links/create_dynamic_link_use_case.dart';
import 'package:wordles/data/usecases/dynamic_links/retrieve_dynamic_link_use_case.dart';
import 'package:wordles/data/usecases/wordles/create_wordle_use_case.dart';
import 'package:wordles/data/usecases/wordles/define_word_use_case.dart';
import 'package:wordles/data/usecases/wordles/get_wordle_use_case.dart';

class Register {
  static void regist() {
    final injector = Injector.appInstance;

    /* Wordles */
    injector.registerDependency<WordlesDataSource>(() => FirebaseWordlesDataSource());
    injector.registerDependency<WordlesRepository>(() => WordlesRepository(dataSource: injector.get()));

    injector.registerDependency<CreateWordleUseCase>(() => CreateWordleUseCase(repository: injector.get()));
    injector.registerDependency<GetWordleUseCase>(() => GetWordleUseCase(repository: injector.get()));
    injector.registerDependency<DefineWordUseCase>(() => DefineWordUseCase(repository: injector.get()));

    /* Dynamic Links */
    injector.registerDependency<DynamicLinksDataSource>(() => FirebaseDynamicLinksDataSource());
    injector.registerDependency<DynamicLinksRepository>(() => DynamicLinksRepository(dataSource: injector.get()));

    injector.registerDependency<CreateDynamicLinkUseCase>(() => CreateDynamicLinkUseCase(repository: injector.get()));
    injector
        .registerDependency<RetrieveDynamicLinkUseCase>(() => RetrieveDynamicLinkUseCase(repository: injector.get()));
  }
}
