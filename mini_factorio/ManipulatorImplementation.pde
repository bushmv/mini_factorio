class UDManipulator extends Manipulator {
  
  public UDManipulator(int posX, int posY, Removable source, Insertable dest, int speed, DrawableManupulatorFlyweight df) {
    super(posX, posY, source, dest, speed, df);
  }
  
  void draw() {
    df.drawUDManipulator(posX, posY, res, state, stateValue);
  }
}

class DUManipulator extends Manipulator {
  
  public DUManipulator(int posX, int posY, Removable source, Insertable dest, int speed, DrawableManupulatorFlyweight df) {
    super(posX, posY, source, dest, speed, df);
  }
  
  void draw() {
    df.drawDUManipulator(posX, posY, res, state, stateValue);
  }
}

class LRManipulator extends Manipulator {
  
  public LRManipulator(int posX, int posY, Removable source, Insertable dest, int speed, DrawableManupulatorFlyweight df) {
    super(posX, posY, source, dest, speed, df);
  }
  
  void draw() {
    df.drawLRManipulator(posX, posY, res, state, stateValue);
  }
}

class RLManipulator extends Manipulator {
  
  public RLManipulator(int posX, int posY, Removable source, Insertable dest, int speed, DrawableManupulatorFlyweight df) {
    super(posX, posY, source, dest, speed, df);
  }
  
  void draw() {
    df.drawRLManipulator(posX, posY, res, state, stateValue);
  }
}
