class SimpleMediator extends Mediator {
 
  public SimpleMediator(Removable source, Insertable dest) {
    super(source, dest);
  }
  
  void update() {
    if (source.canRemove() && dest.canInsert()) {
      int res = source.remove();
      dest.insert(res);
    }
  }
  
}
