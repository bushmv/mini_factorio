// the mediator takes items from the source and passes them to the destination 
abstract class Mediator {
  
  Removable source;
  Insertable dest;
  
  public Mediator(Removable source, Insertable dest) {
    this.source = source;
    this.dest = dest;
  }
  
  abstract void update();
  
}
