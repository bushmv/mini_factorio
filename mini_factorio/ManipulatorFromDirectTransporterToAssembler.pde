abstract class ManipulatorFromDirectTransporterToAssembler extends Mediator {
 
  protected ManipulatorState state;
  protected int res;
  protected int stateValue;
  protected int posX;
  protected int posY;
  protected DrawableManupulatorFlyweight df;
  
  private RemovableDirectTransporterForAssembler rfaSource;
  private Assembler asmDest;
  
  private int speed;
  
  public ManipulatorFromDirectTransporterToAssembler(int posX, int posY, Removable source, Assembler dest, int speed, DrawableManupulatorFlyweight df) {
    super(source, dest);
    this.posX = posX;
    this.posY = posY;
    this.speed = speed;
    this.state = ManipulatorState.WAIT_FOR_GET_ITEM_FROM_SOURCE;
    this.stateValue = speed;
    this.df = df;
    this.rfaSource = (RemovableDirectTransporterForAssembler) source;
    this.asmDest = (Assembler) dest;
  }
  
  public void update() {
    switch(state) {
      case WAIT_FOR_GET_ITEM_FROM_SOURCE:
        if (source.canRemove()) {
          int[] peekAll = rfaSource.peek();
          for (int i = 0; i < peekAll.length; i++) {
            if ((asmDest.canInsertRes(peekAll[i]))) {
              res = peekAll[i];
              rfaSource.removeAt(i);
              state = ManipulatorState.MOVE_TO_DESTINATION;
              break;
            }
          }
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
          if (asmDest.canInsertRes(res)) {
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

class UDManipulatorFromDirectTransporterToAssembler extends ManipulatorFromDirectTransporterToAssembler {
  
  public UDManipulatorFromDirectTransporterToAssembler(int posX, int posY, Removable source, Assembler dest, int speed, DrawableManupulatorFlyweight df) {
    super(posX, posY, source, dest, speed, df);
  }
  
 void draw() {
  df.drawUDManipulator(posX, posY, res, state, stateValue);
 }
}

class DUManipulatorFromDirectTransporterToAssembler extends ManipulatorFromDirectTransporterToAssembler {
  
  public DUManipulatorFromDirectTransporterToAssembler(int posX, int posY, Removable source, Assembler dest, int speed, DrawableManupulatorFlyweight df) {
    super(posX, posY, source, dest, speed, df);
  }
  
 void draw() {
  df.drawDUManipulator(posX, posY, res, state, stateValue);
 }
}

class LRManipulatorFromDirectTransporterToAssembler extends ManipulatorFromDirectTransporterToAssembler {
  
  public LRManipulatorFromDirectTransporterToAssembler(int posX, int posY, Removable source, Assembler dest, int speed, DrawableManupulatorFlyweight df) {
    super(posX, posY, source, dest, speed, df);
  }
  
 void draw() {
  df.drawLRManipulator(posX, posY, res, state, stateValue);
 }
}

class RLManipulatorFromDirectTransporterToAssembler extends ManipulatorFromDirectTransporterToAssembler {
  
  public RLManipulatorFromDirectTransporterToAssembler(int posX, int posY, Removable source, Assembler dest, int speed, DrawableManupulatorFlyweight df) {
    super(posX, posY, source, dest, speed, df);
  }
  
 void draw() {
  df.drawRLManipulator(posX, posY, res, state, stateValue);
 }
}
