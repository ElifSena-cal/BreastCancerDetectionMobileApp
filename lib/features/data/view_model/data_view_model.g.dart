// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataViewModel on _DataViewModelBase, Store {
  late final _$dataAtom =
      Atom(name: '_DataViewModelBase.data', context: context);

  @override
  Data? get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(Data? value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$predictAsyncAction =
      AsyncAction('_DataViewModelBase.predict', context: context);

  @override
  Future<String> predict(Map<String, double> data) {
    return _$predictAsyncAction.run(() => super.predict(data));
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
