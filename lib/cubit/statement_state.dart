part of 'statement_cubit.dart';

@immutable
abstract class StatementState {}

class StatementInitial extends StatementState {}

class StatementLoading extends StatementState {}

class StatementFailed extends StatementState {}

class StatementLoaded extends StatementState {
  final List<Statement> statements;

  StatementLoaded({required this.statements});
}
