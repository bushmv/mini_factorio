class LRDirectTransporterPart extends DirectTransporterPart {
 
  public LRDirectTransporterPart(int posX, int posY, TransporterPart previous, int state, byte speed, DrawableTransporterPartFlyweight df) {
    super(posX, posY, previous, state, speed, df); 
  }
  
  void drawCurrentPart() { df.drawLRTransporterPart(posX, posY); }
  
  void drawCurrentItems() {
    
    // left
    if ((state & 8) == 8) {
      temp = (state & 7);
      df.draw(posX + CONSTANTS.MATERIAL_LEN * 3 + temp * CONSTANTS.DELTA, posY + CONSTANTS.MATERIAL_LEN, (this.leftRes & 255));
    }
    
    if ((state & 128) == 128) {
      temp = (state & 112) >> 4;
      df.draw(posX + CONSTANTS.MATERIAL_LEN * 2 + temp * CONSTANTS.DELTA, posY + CONSTANTS.MATERIAL_LEN, (this.leftRes & 65280) >> 8);
    }
    
    if ((state & 2048) == 2048) {
      temp = (state & 1792) >> 8;
      df.draw(posX + CONSTANTS.MATERIAL_LEN + temp * CONSTANTS.DELTA, posY + CONSTANTS.MATERIAL_LEN, (this.leftRes & 16711680) >> 16); 
    }
    
    if ((state & 32768) == 32768) {
      temp = (state & 28672) >> 12;
      df.draw(posX + temp * CONSTANTS.DELTA, posY + CONSTANTS.MATERIAL_LEN, (this.leftRes & -16777216) >> 24);
    } 
    
    //right
    if ((state & 524288) == 524288) {
      temp = (state & 458752) >> 16;
      df.draw(posX + CONSTANTS.MATERIAL_LEN * 3 + temp * CONSTANTS.DELTA, posY + CONSTANTS.BLOCK_LEN / 2, (this.rightRes & 255));
    }
    
    if ((state & 8388608) == 8388608) {
      temp = (state & 7340032) >> 20;
      df.draw(posX + CONSTANTS.MATERIAL_LEN * 2 + temp * CONSTANTS.DELTA, posY + CONSTANTS.BLOCK_LEN / 2, (this.rightRes & 65280) >> 8);
    }
    
     if ((state & 134217728) == 134217728) {
      temp = (state & 117440512) >> 24;
      df.draw(posX + CONSTANTS.MATERIAL_LEN + temp * CONSTANTS.DELTA, posY + CONSTANTS.BLOCK_LEN / 2, (this.rightRes & 16711680) >> 16);
    }
    
    if ((state & -2147483648) == -2147483648) {
      temp = (state & 1879048192) >> 28;
      df.draw(posX + temp * CONSTANTS.DELTA, posY + CONSTANTS.BLOCK_LEN / 2, (this.rightRes & -16777216) >> 24);
    } 
    
  }
  
}
