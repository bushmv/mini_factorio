abstract class AntiClockWiseAngleTransporterPart extends TransporterPart {
 
  public AntiClockWiseAngleTransporterPart(int posX, int posY, TransporterPart previous, int state, byte speed, DrawableTransporterPartFlyweight df) {
    super(posX, posY, previous, state, speed, df); 
  }
  
  
  public void updateCurrent() {
    if ((frameCount % speed) == 0) {
      
      //left
      
      if ((state & 128) == 128 && (leftFree || (state & 8) != 8)) {
           temp = (state & 112) >> 4;
           if (temp < 7) { state += 16; }
           else { state -= 232; leftRes = (leftRes & ~65280) + ((leftRes & 65280) >> 8); }
        }
        
        if ((state & 2048) == 2048 && (leftFree || (state & 136) != 136)) {
           temp = (state & 1792) >> 8;
           if (temp < 7) { state += 256; }
           else { state -= 3712; leftRes = (leftRes & ~16711680) + ((leftRes & 16711680) >> 8); }
        }
        
        //right
        
        if ((state & 524288) == 524288 && (rightFree || (state & 32768) != 32768)) {
           temp = (state & 458752) >> 16;
           if (temp < 7) { state += 65536; }
           else { state -= 950272; leftRes = leftRes + ((rightRes & 255) << 24); rightRes = (rightRes & ~255); } // -983 040 + 32 768
        }
        
        if ((state & 8388608) == 8388608 && (rightFree || (state & 557056) != 557056)) {
           temp = (state & 7340032) >> 20;
           if (temp < 7) { state += 1048576; }
           else { state -= 15204352; rightRes = (rightRes & ~65280) + ((rightRes & 65280) >> 8);} // 15 728 640 + 524 288
        }
        
        if ((state & 134217728) == 134217728 && (rightFree || (state & 8945664) != 8945664)) {
           temp = (state & 117440512) >> 24;
           if (temp < 7) { state += 16777216; }
           else { state -= 243269632; rightRes = (rightRes & ~16711680) + ((rightRes & 16711680) >> 8); }
        }
        
        if ((state & -2147483648) == -2147483648 && (rightFree || (state & 143163392) != 143163392)) {
           temp = (state & 1879048192) >> 28;
           if (temp < 7) { state += 268435456; }
           else {  state -= -268435456; state += 134217728; rightRes = (rightRes & ~ -16777216) + ((rightRes & -16777216) >> 8); } 
        }  
    }
    
    //left last one
    if (previous != null && (frameCount % previous.speed) == 0) {
      if ( (leftFree || leftFree()) && previous.hasLeftFirstItem() ) { 
         temp = previous.leftFirstItemState();
         if (temp < 7) { previous.moveFirstLeftItem(); }
         else { previous.removeFirstLeftItem(); insertLeftItemInEnd(); 
         leftRes = leftRes + (previous.firstLeftRes() << 16); previous.removeFirstLeftRes(); } 
      } 
    }
    
    //right last one
    if (previous != null && (frameCount % previous.speed) == 0) {
      if ( (rightFree || rightFree()) && previous.hasRightFirstItem() ) { 
         temp = previous.rightFirstItemState(); 
         if (temp < 7) { previous.moveFirstRightItem(); } 
         else { previous.removeFirstRightItem(); insertRightItemInEnd(); 
         rightRes = rightRes + (previous.firstRightRes() << 24); previous.removeFirstRightRes(); } 
      } 
    }
    
    if (previous != null) {
     previous.leftFree = leftFree || leftFree(); 
     previous.rightFree = rightFree || rightFree(); 
    }
  }
  

  public abstract void drawCurrentPart();
  public abstract void drawCurrentItems();
  
  public void removeFirstLeftItem() { this.state &= ~15; }
  public void removeFirstRightItem() {this.state &= ~61440; }
  
  public void moveFirstLeftItem() { this.state += 1; }
  public void moveFirstRightItem() { this.state += 4096; }
  
  public boolean hasLeftFirstItem() { return (this.state & 8) == 8; }
  public boolean hasRightFirstItem() { return (this.state & 32768) == 32768; }
  
  public int leftFirstItemState() { return this.state & 7; }
  public int rightFirstItemState() { return (this.state & 28672) >> 12; }
  
  public void insertLeftItemInEnd() { this.state += 2048; }
  public void insertRightItemInEnd() { this.state += -2147483648; }
  
  public boolean leftFree() { return (state & 2184) != 2184; }
  public boolean rightFree() { return (state & -2004320256) != -2004320256; }
  
  // res
  public int firstLeftRes() { return (leftRes & 255); }
  public int firstRightRes() { return (leftRes & -16777216) >> 24; }
  
  public void removeFirstLeftRes() { leftRes = leftRes & ~255; }
  public void removeFirstRightRes() { leftRes = leftRes & ~-16777216; }

}
