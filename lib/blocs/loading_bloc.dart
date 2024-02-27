import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum LoadingStatus { initial, loading, loaded }

class LoadingBloc extends Cubit<LoadingStatus> {
  LoadingBloc() : super(LoadingStatus.initial);

  void showLoading(BuildContext context) {
    showCustomLoader(context);
    emit(LoadingStatus.loading);
  }

  void hideLoading(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/'));
    emit(LoadingStatus.loaded);
  }
}

void showCustomLoader(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: 80,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text(
                'Loading...',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
