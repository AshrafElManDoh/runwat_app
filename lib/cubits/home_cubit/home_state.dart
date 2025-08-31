part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeVideo extends HomeState {}
final class HomeLoading extends HomeState {}
