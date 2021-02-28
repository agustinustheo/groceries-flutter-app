import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionBloc extends Bloc<SessionEvent,SessionState> {
  final SessionRepository repository;
  SessionBloc({@required this.repository}) : super(SessionInitialState());

  @override
  Stream<SessionState> mapEventToState(SessionEvent event) async*{
   if(event is SessionFetchData){
     yield SessionLoadingState();
     Session session = await repository.fetchSession();
     if(session.cookies == null){
       yield SessionFetchFailedState();
     }else{
       yield SessionFetchSuccessState(session: session);
     }
   }
  }
}

abstract class SessionState extends Equatable {
  const SessionState();
}

abstract class SessionEvent extends Equatable {
  const SessionEvent();
}

class SessionInitialState extends SessionState {
  @override
  List<Object> get props => [];
}

class SessionLoadingState extends SessionState {
  @override
  List<Object> get props => [];
}

class SessionFetchSuccessState extends SessionState {
  final Session session;

  SessionFetchSuccessState({
    @required this.session,
  });

  @override
  List<Object> get props => [session];
}

class SessionFetchFailedState extends SessionState {
  @override
  List<Object> get props => [];
}

class SessionFetchData extends SessionEvent {
  @override
  List<Object> get props => [];
}

