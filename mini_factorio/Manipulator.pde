abstract class Manipulator extends Mediator {
 
  protected ManipulatorState state;
  protected int res;
  protected int stateValue;
  protected int posX;
  protected int posY;
  protected DrawableManupulatorFlyweight df;
  
  private int speed;
  
  public Manipulator(int posX, int posY, Removable source, Insertable dest, int speed, DrawableManupulatorFlyweight df) {
    super(source, dest);
    this.posX = posX;
    this.posY = posY;
    this.speed = speed;
    this.state = ManipulatorState.WAIT_FOR_GET_ITEM_FROM_SOURCE;
    this.stateValue = speed;
    this.df = df;
  }
  
  public void update() {
    switch(state) {
      case WAIT_FOR_GET_ITEM_FROM_SOURCE:
        if (source.canRemove()) {
          res = source.remove();
          state = ManipulatorState.MOVE_TO_DESTINATION;
        } 
        break;
      case MOVE_TO_DESTINATION:
        if (stateValue == 0) {
          stateValue = speed;
          state = ManipulatorState.WAIT_FOR_PUT_TO_DESTINATION;
        } else {
          stateValue--;
        }
        break;
      case WAIT_FOR_PUT_TO_DESTINATION:
        if (dest.canInsert()) {
          dest.insert(res);
          state = ManipulatorState.MOVE_TO_SOURCE;
        } 
        break;
      case MOVE_TO_SOURCE:
        if (stateValue == 0) {
          stateValue = speed;
          state = ManipulatorState.WAIT_FOR_GET_ITEM_FROM_SOURCE;
        } else {
          stateValue--;
        }
    }
  }
  
  abstract void draw();
  
}
