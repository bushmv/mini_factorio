class ULAngleTransporterPart extends ClockWiseAngleTransporterPart {
  
  public ULAngleTransporterPart(int posX, int posY, TransporterPart previous, int state, byte speed, DrawableTransporterPartFlyweight df) {
    super(posX, posY, previous, state, speed, df); 
  }
  
  void drawPart() { df.drawULTransporterPart(posX, posY); }
  
  void drawItems() {
    
    // left
    if ((state & 8) == 8) {
      temp = state & 7;
      df.draw(posX - CONSTANTS.DELTA * temp, posY + CONSTANTS.BLOCK_LEN / 2, (this.leftRes & 255));
    } 
    
    if ((state & 128) == 128) {
      temp = (state & 112) >> 4;
      df.draw(posX + CONSTANTS.MATERIAL_LEN - CONSTANTS.DELTA * temp, posY + CONSTANTS.BLOCK_LEN / 2, (this.leftRes & 65280) >> 8);
    } 
    
    if ((state & 2048) == 2048) {
      temp = (state & 1792) >> 8;
      df.draw(posX + CONSTANTS.BLOCK_LEN / 2 - CONSTANTS.DELTA * temp, posY + CONSTANTS.BLOCK_LEN / 2, (this.leftRes & 16711680) >> 16); 
    } 
    
    if ((state & 32768) == 32768) {
      temp = (state & 28672) >> 12;
      df.draw(posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.MATERIAL_LEN + CONSTANTS.DELTA * temp, (this.leftRes & -16777216) >> 24);
    } 
    
    if ((state & 524288) == 524288) {
      temp = (state & 458752) >> 16;
      df.draw(posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.DELTA * temp, (rightRes & 255));
    } 
    
    //right
    if ((state & 8388608) == 8388608) {
      temp = (state & 7340032) >> 20;
      df.draw(posX - CONSTANTS.DELTA * temp, posY + CONSTANTS.MATERIAL_LEN, (this.rightRes & 65280) >> 8);
    } 
    
    if ((state & 134217728) == 134217728) {
      temp = (state & 117440512) >> 24;
      df.draw(posX + CONSTANTS.MATERIAL_LEN - CONSTANTS.DELTA * temp, posY + CONSTANTS.MATERIAL_LEN, (this.rightRes & 16711680) >> 16);
    } 
    
    if ((state & -2147483648) == -2147483648) {
      temp = (state & 1879048192) >> 28;
      df.draw(posX + CONSTANTS.MATERIAL_LEN, posY + CONSTANTS.DELTA * temp, (this.rightRes & -16777216) >> 24);
    } 
    
  }
  
}
