class Splitter {
 
  private final DirectTransporterPart first;
  private final DirectTransporterPart second;
  private final TransporterPart previous;
  private int posX;
  private int posY;
  private boolean trigger = true;  
  private DrawableSplitterFlyweight df;
  
  public Splitter(int posX, int posY, TransporterPart previous, DirectTransporterPart first, DirectTransporterPart second, DrawableSplitterFlyweight df) {
    this.posX = posX;
    this.posY = posY;
    this.first = first;
    this.second = second; 
    this.previous = previous;
    this.df = df;
  }
  
  void update() {
   
    if (previous == null) return;

    if (previous.hasLeftFirstItem() && (first.leftFree() || second.leftFree())) {
       if (previous.leftFirstItemState() < 7) {
         previous.moveFirstLeftItem();
       } else {
         int res = previous.firstLeftRes();
         previous.removeFirstLeftRes();
         previous.removeFirstLeftItem();
         if (trigger) {
             if (first.leftFree()) { // or first can insert item, or second cause first if statement contains "&& (first.leftFree() || second.leftFree())"
               first.insertLeftItemInEnd();
               first.leftRes = first.leftRes + (res << 24);
               trigger = !trigger;
             } else {
               second.insertLeftItemInEnd(); 
               second.leftRes = second.leftRes + (res << 24);
             }
         } else {
             if (second.leftFree()) {
               second.insertLeftItemInEnd();
               second.leftRes = second.leftRes + (res << 24);
               trigger = !trigger;
             } else {
               first.insertLeftItemInEnd(); 
               first.leftRes = first.leftRes + (res << 24);
             }
         }
       }
    }
    
    if (previous.hasRightFirstItem() && (first.rightFree() || second.rightFree())) {
       if (previous.rightFirstItemState() < 7) {
         previous.moveFirstRightItem();
       } else {
         int res = previous.firstRightRes();
         previous.removeFirstRightRes();
         previous.removeFirstRightItem(); 
         if (trigger) {
             if (first.rightFree()) {
               first.insertRightItemInEnd();
               first.rightRes = first.rightRes + (res << 24);
               trigger = !trigger;
             } else {
               second.insertRightItemInEnd(); 
               second.rightRes = second.rightRes + (res << 24);
             }
         } else {
             if (second.rightFree()) {
               second.insertRightItemInEnd();
               second.rightRes = second.rightRes + (res << 24);
               trigger = !trigger;
             } else {
               first.insertRightItemInEnd(); 
               first.rightRes = first.rightRes + (res << 24);
             }
         }
       }
    }

    
    
    if (previous != null) {
       previous.leftFree = first.leftFree || first.leftFree() || second.leftFree || second.leftFree(); 
       previous.rightFree = first.rightFree || first.rightFree() || second.rightFree || second.rightFree(); 
       previous.update();
    }
  }
  
  void drawSplitterPart() {
    df.drawLRSplitter(posX, posY);
    previous.drawParts();
  }
  
  void draw() {
   if (previous != null) { previous.drawItems(); }
  }
  
}
