import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

bool isCubitAvailable<T extends Cubit>(BuildContext context) {
  try {
    context.read<T>();
    return true;
  } catch (e) {
    return false;
  }
}
