interface DrawableAssembler {
  void drawAsm(int posX, int posY);
  void drawAsmProducing(int posX, int posY, int progress);
}

class SimpleDrawableAssembler implements DrawableAssembler {
  void drawAsm(int posX, int posY) { rect(posX, posY, CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN * 3); } 
  void drawAsmProducing(int posX, int posY, int progress) { 
    rect(posX, posY, CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN * 3); 
    ellipse(posX + CONSTANTS.BLOCK_LEN * 1.5, posY + CONSTANTS.BLOCK_LEN * 1.5, CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN); } 
}
