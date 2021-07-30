// base class that represents directTransporterPart:
// - from left to right
// - from right to left
// - from up to down
// - from down to up

abstract class DirectTransporterPart extends TransporterPart {
 
  public DirectTransporterPart(int posX, int posY, TransporterPart previous, int state, byte speed, DrawableTransporterPartFlyweight df) {
    super(posX, posY, previous, state, speed, df); 
  }
  
  void update() {
   
    if ((frameCount % speed) == 0) {
      
        // left first 3
        
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
        
        // right first 3
        if ((state & 8388608) == 8388608 && (rightFree || ((state & 524288) != 524288))) {       
           temp = (state & 7340032) >> 20;
           if (temp < 7) { state += 1048576; }
           else { state -= 15204352; rightRes = (rightRes & ~65280) + ((rightRes & 65280) >> 8); }
        }
        
        if ((state & 134217728) == 134217728 && (rightFree || (state & 8912896) != 8912896)) {
           temp = (state & 117440512) >> 24;
           if (temp < 7) { state += 16777216;  }
           else { state -= 243269632; rightRes = (rightRes & ~16711680) + ((rightRes & 16711680) >> 8); }
        }

        if ((state & -2147483648) == -2147483648 && (rightFree || (state & 143130624) != 143130624)) {
           temp = (state & 1879048192) >>> 28;
           if (temp < 7) { state += 268435456; }
           else { state -= -268435456; state += 134217728; rightRes = (rightRes & ~ -16777216) + ((rightRes & -16777216) >> 8); }
        }
    } 
    
    // left last one
    if (previous != null && (frameCount % previous.speed) == 0) { 
      if ( (leftFree || (state & 34952) != 34952) && previous.hasLeftFirstItem() ) { 
         temp = previous.leftFirstItemState();
         if (temp < 7) { previous.moveFirstLeftItem();}
         else { previous.removeFirstLeftItem(); insertLeftItemInEnd(); 
         leftRes = (leftRes & ~ -16777216) + ((previous.leftRes & 255) << 24); previous.leftRes = previous.leftRes & ~255; }
      } 
    }
    
    //right last one
    if (previous != null && (frameCount % previous.speed) == 0) { 
      if ( (rightFree || (state & -2004353024) != -2004353024) && previous.hasRightFirstItem() ) {
         temp = previous.rightFirstItemState(); 
         if (temp < 7) { previous.moveFirstRightItem();  } 
         else { previous.removeFirstRightItem(); insertRightItemInEnd();
         rightRes = (rightRes & ~ -16777216) + ((previous.rightRes & 255) << 24); previous.rightRes = previous.rightRes & ~255; }
      } 
    }
    
    if (previous != null) {
     previous.leftFree = leftFree || leftFree();
     previous.rightFree = rightFree || rightFree();
    }
    
  }
  
  public abstract void draw();
  
  public void removeFirstLeftItem() { this.state -= 15; }
  public void removeFirstRightItem() {this.state -= 983040; }
  
  public void moveFirstLeftItem() { this.state += 1; }
  public void moveFirstRightItem() { this.state += 65536; }
  
  public boolean hasLeftFirstItem() { return (this.state & 8) == 8; }
  public boolean hasRightFirstItem() { return (this.state & 524288) == 524288; }
  
  public int leftFirstItemState() { return this.state & 7; }
  public int rightFirstItemState() { return (this.state & 458752) >> 16; }
  
  public void insertLeftItemInEnd() { this.state += 32768; }
  public void insertRightItemInEnd() { this.state += -2147483648; }
  
  public boolean leftFree() { return (state & 34952) != 34952; }
  public boolean rightFree() { return (state & -2004353024) != -2004353024; }
  
}
