import 'package:coinlist/app.dart';
import 'package:coinlist/repositories/crypto_api/api_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  // GetIt.I.registerSingleton(CryptoCompareApiRepository(dio: Dio()));\
  GetIt.I.registerLazySingleton(() => CryptoCompareApiRepository(dio: Dio()));
  runApp(const CryptoPortfolio());
}
