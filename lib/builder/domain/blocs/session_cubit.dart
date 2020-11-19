import 'package:airscaper/builder/configuration/logger.dart';
import 'package:airscaper/builder/domain/session_storage.dart';
import 'package:airscaper/builder/injection.dart';
import 'package:airscaper/builder/model/session.dart';
import 'package:cubit/cubit.dart';

class SessionCubit extends Cubit<SessionState> {

  SessionCubit() : super(SessionState(loading: true));

  init() async {
    final SessionStorage storage = sl();
    final session = await storage.loadSession();
    if(session != null) {
      logger.i("Logged in : ${session.user.name}, email : ${session.user.email}");
      emit(SessionState(session: session));
    } else {
      logger.i("No user connected");
      emit(SessionState());
    }
  }

  connect(Session session) async {
    logger.i("Logged in : ${session.user.name}, email : ${session.user.email}");
    emit(SessionState(session: session));
  }
}

class SessionState {
  final Session session;
  final bool loading;

  SessionState({this.session, this.loading = false});

  bool get connected => session != null;
}