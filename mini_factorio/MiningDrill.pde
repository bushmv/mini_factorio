abstract class MiningDrill implements Removable {
 
  private boolean hasItem;
  private int speed;
  protected int posX;
  protected int posY;
  protected int delta;
  private int res;
  protected DrawableMiningDrillFlyweight df;
  
  public MiningDrill(int posX, int posY, int speed, int res, DrawableMiningDrillFlyweight df) {
    this.posX = posX;
    this.posY = posY;
    this.speed = speed;
    this.res = res;
    this.df = df;
  }
  
  public void update() {
    if (hasItem) return;
    if (delta == 0) {
      hasItem = true;
      delta = speed;
    } else {
     delta--; 
    }
  }
  
  int peek() { return res; }
  
  abstract void draw();
  
  public boolean canRemove() {
    return hasItem;
  }
  
  public int remove() {
   hasItem = false;
   return res;
  }
}

class UDMiningDrill extends MiningDrill {
  
  public UDMiningDrill(int posX, int posY, int speed, int res, DrawableMiningDrillFlyweight df) {
   super(posX, posY, speed, res, df); 
  }
  
  void draw() {
    df.drawUDMiningDrill(posX, posY);
  }
  
}

class DUMiningDrill extends MiningDrill {
  
  public DUMiningDrill(int posX, int posY, int speed, int res, DrawableMiningDrillFlyweight df) {
   super(posX, posY, speed, res, df); 
  }
  
  void draw() {
    df.drawDUMiningDrill(posX, posY);
  }
  
}
