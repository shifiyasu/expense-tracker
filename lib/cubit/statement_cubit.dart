import 'package:bloc/bloc.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:meta/meta.dart';

part 'statement_state.dart';

class StatementCubit extends Cubit<StatementState> {
  StatementCubit() : super(StatementInitial());

  void addStatement(Statement statement) {
    emit(StatementLoading());

    emit(StatementLoaded(statements: [statement]));
  }
}
