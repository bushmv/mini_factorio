interface DrawableMiningDrillFlyweight {
  void drawUDMiningDrill(int posX, int posY);
  void drawDUMiningDrill(int posX, int posY);
  void drawLRMiningDrill(int posX, int posY);
  void drawRLMiningDrill(int posX, int posY);
}

class SimpleDrawableMiningDrillFlyweight implements DrawableMiningDrillFlyweight {
  
  void drawUDMiningDrill(int posX, int posY) {
    rect(posX, posY, CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN * 3); 
    line(posX + CONSTANTS.BLOCK_LEN * 1.5, posX + CONSTANTS.BLOCK_LEN * 0.5, posX + CONSTANTS.BLOCK_LEN * 1.5, posX + CONSTANTS.BLOCK_LEN * 2.5);
    line(posX + CONSTANTS.BLOCK_LEN * 1.5, posX + CONSTANTS.BLOCK_LEN * 2.5, posX + CONSTANTS.BLOCK_LEN, posY + CONSTANTS.BLOCK_LEN * 2);
    line(posX + CONSTANTS.BLOCK_LEN * 1.5, posX + CONSTANTS.BLOCK_LEN * 2.5, posX + CONSTANTS.BLOCK_LEN * 2, posY + CONSTANTS.BLOCK_LEN * 2);
  }
  
  void drawDUMiningDrill(int posX, int posY) {
    rect(posX, posY, CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN * 3); 
    line(posX + CONSTANTS.BLOCK_LEN * 1.5, posY + CONSTANTS.BLOCK_LEN * 0.5, posX + CONSTANTS.BLOCK_LEN * 1.5, posY + CONSTANTS.BLOCK_LEN * 2.5);
    line(posX + CONSTANTS.BLOCK_LEN * 1.5, posY + CONSTANTS.BLOCK_LEN * 0.5, posX + CONSTANTS.BLOCK_LEN, posY + CONSTANTS.BLOCK_LEN);
    line(posX + CONSTANTS.BLOCK_LEN * 1.5, posY + CONSTANTS.BLOCK_LEN * 0.5, posX + CONSTANTS.BLOCK_LEN * 2, posY + CONSTANTS.BLOCK_LEN);
  }
  
  void drawLRMiningDrill(int posX, int posY) {
    rect(posX, posY, CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN * 3); 
  }
  
  void drawRLMiningDrill(int posX, int posY) {
    rect(posX, posY, CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN * 3); 
  }
  
  
}
