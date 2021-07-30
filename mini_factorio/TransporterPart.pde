abstract class TransporterPart {
 
  int state; // represents the presence of items on the TransporterPart
  TransporterPart previous;
  int posX;
  int posY;
  int temp; // a temporary variable 
  byte speed; 
  boolean leftFree;
  boolean rightFree;
  int leftRes; // represents the resources on the left side 
  int rightRes; // represents the resources on the right side 
  DrawableFlyweight df; // flyweight contains how each resource should be drawn 
 
  public TransporterPart(int posX, int posY, TransporterPart previous, int state, byte speed, DrawableFlyweightFactory factory) {
    this.posX = posX;
    this.posY = posY;
    this.previous = previous;
    this.state = state;
    this.speed = speed;
    this.leftFree = false;
    this.rightFree = false;
    this.df = factory.drawableFlyWeight();
  }
  
  void redraw() {
     update();
     draw();
     if (previous != null) previous.redraw();
  }
  
  
  public abstract void update();
  public abstract void draw();
  
  // direct and angle transporter parts contains different first element, therefore this methods
  // must be overrided in each of them
  
  public abstract boolean hasLeftFirstItem();
  public abstract boolean hasRightFirstItem();
  
  public abstract int leftFirstItemState();
  public abstract int rightFirstItemState();
  
  public abstract void removeFirstLeftItem();
  public abstract void removeFirstRightItem();
  
  public abstract void moveFirstLeftItem();
  public abstract void moveFirstRightItem();
  
  public abstract void insertLeftItemInEnd();
  public abstract void insertRightItemInEnd();
  
  public abstract boolean leftFree();
  public abstract boolean rightFree();
  
}
