abstract class DrawableMediator extends Mediator {
  
  public DrawableMediator(Removable source, Insertable dest) {
    super(source, dest);
  }
  
  abstract void draw();
  
}
