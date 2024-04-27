enum BlocStatus {
  update,
  notInitialized,
  inProgress,
  completed,
  failed,
  connectionFailed,
  unAutorized,
  logIn,
  deviceDeleted;

  bool get isComplated => this == BlocStatus.completed;
}
