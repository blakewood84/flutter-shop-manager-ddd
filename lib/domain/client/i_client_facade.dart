abstract class IClientFacade {
  
  const IClientFacade();
  
  Future<void> update();
  Future<void> delete();
  Future<void> addWaiver();
  Future<void> addSession();
}