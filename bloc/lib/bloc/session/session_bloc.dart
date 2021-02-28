import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionBloc extends Bloc<SessionEvent,SessionState> {
  final SessionRepository repository;
  SessionBloc({@required this.repository}) : super(InitialState());

  @override
  Stream<SessionState> mapEventToState(SessionEvent event) async*{
   if(event is FetchData){
     yield LoadingState();
     Session session = await repository.fetchSession();
     if(session.cookies.isEmpty){
       yield FetchFailedState();
     }else{
       yield FetchSuccessState(session: session);
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

class InitialState extends SessionState {
  @override
  List<Object> get props => [];
}

class LoadingState extends SessionState {
  @override
  List<Object> get props => [];
}

class FetchSuccessState extends SessionState {
  final Session session;

  FetchSuccessState({
    @required this.session,
  });

  @override
  List<Object> get props => [session];
}

class FetchFailedState extends SessionState {
  @override
  List<Object> get props => [];
}

class FetchData extends SessionEvent {
  @override
  List<Object> get props => [];
}

