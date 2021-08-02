abstract class ClockWiseAngleTransporterPart extends TransporterPart {
 
  public ClockWiseAngleTransporterPart(int posX, int posY, TransporterPart previous, int state, byte speed, DrawableTransporterPartFlyweight df) {
    super(posX, posY, previous, state, speed, df); 
  }
  
  public void update() {
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
        
        if ((state & 32768) == 32768 && (leftFree || (state & 2184) != 2184)) {
           temp = (state & 28672) >> 12;
           if (temp < 7) { state += 4096; }
           else { state -= 59392; leftRes = (leftRes & ~ -16777216) + ((leftRes & -16777216) >> 8); }
        }
        
        if ((state & 524288) == 524288 && (leftFree || (state & 34952) != 34952)) {
           temp = (state & 458752) >> 16;
           if (temp < 7) { state += 65536; }
           else { state -= 950272; leftRes += (rightRes & 255) << 24; rightRes = (rightRes & ~255);  } 
        }
        
        //right
        
        if ((state & 134217728) == 134217728 && (rightFree || (state & 8388608) != 8388608)) {
           temp = (state & 117440512) >> 24;
           if (temp < 7) { state += 16777216; }
           else { state -= 243269632; rightRes = (rightRes & ~16711680) + ((rightRes & 16711680) >> 8); }
        }
        
        if ((state & -2147483648) == -2147483648 && (rightFree || (state & 142606336) != 142606336)) {
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
         else { previous.removeFirstLeftItem(); insertLeftItemInEnd(); rightRes = rightRes + previous.firstLeftRes(); previous.removeFirstLeftRes(); } 
         
      } 
    }
    
    //right last one
    if (previous != null && (frameCount % previous.speed) == 0) {
      if ( (rightFree || rightFree()) && previous.hasRightFirstItem() ) { 
         temp = previous.rightFirstItemState(); 
         if (temp < 7) { previous.moveFirstRightItem(); } 
         else { previous.removeFirstRightItem(); insertRightItemInEnd(); rightRes = rightRes + (previous.firstRightRes() << 24); previous.removeFirstRightRes(); } 
      } 
    }
    
    if (previous != null) {
     previous.leftFree = leftFree || leftFree(); 
     previous.rightFree = rightFree || rightFree(); 
    }
  }
  
  
  public abstract void draw();
  
  public void removeFirstLeftItem() { this.state -= 15; }
  public void removeFirstRightItem() {this.state -= 15728640; }
  
  public void moveFirstLeftItem() { this.state += 1; }
  public void moveFirstRightItem() { this.state += 1048576; }
  
  public boolean hasLeftFirstItem() { return (this.state & 8) == 8; }
  public boolean hasRightFirstItem() { return (this.state & 8388608) == 8388608; }
  
  public int leftFirstItemState() { return this.state & 7; }
  public int rightFirstItemState() { return (this.state & 7340032) >> 20; }
  
  public void insertLeftItemInEnd() { this.state += 524288; }
  public void insertRightItemInEnd() { this.state += -2147483648; }
  
  public boolean leftFree() { return (state & 559240) != 559240; }
  public boolean rightFree() { return (state & -2004877312) != -2004877312; }
  
  
  //res
  public int firstLeftRes() { return (leftRes & 255); }
  public int firstRightRes() { return (rightRes & 65280) >> 8; }
  
  public void removeFirstLeftRes() { leftRes = leftRes & ~255; }
  public void removeFirstRightRes() { rightRes = rightRes & ~65280; }

}
