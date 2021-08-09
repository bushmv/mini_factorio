class DrawableManupulatorFlyweight {
  
  //DrawableTransporterPartFlyweight df;
  private int delta;
  
  public DrawableManupulatorFlyweight(int delta) {
    this.delta = delta;
  }
  
  void drawUDManipulator(float posX, float posY, int res, ManipulatorState state, int offset) {
    
    ellipse(posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2, CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN);
    strokeWeight(7);
    
    switch(state) {
      case WAIT_FOR_GET_ITEM_FROM_SOURCE:
      case MOVE_TO_DESTINATION: {
       line(posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2, posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2 - (delta - 8) * offset); break; 
      }
      case WAIT_FOR_PUT_TO_DESTINATION:
      case MOVE_TO_SOURCE: {
        line(posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2, posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2 + (delta - 8) * offset); break; 
      }
    }
    strokeWeight(2);
  }
  
  void drawDUManipulator(float posX, float posY, int res, ManipulatorState state, int offset) {
    
    ellipse(posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2, CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN);
    strokeWeight(7);
    
    switch(state) {
      case WAIT_FOR_GET_ITEM_FROM_SOURCE:
      case MOVE_TO_DESTINATION: {
       line(posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2, posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2 + (offset - 8) * delta); break; 
      }
      case WAIT_FOR_PUT_TO_DESTINATION:
      case MOVE_TO_SOURCE: {
        line(posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2, posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2 - (offset - 8) * delta); break;
      }
    }
    strokeWeight(2);
  }
  
  void drawLRManipulator(float posX, float posY, int res, ManipulatorState state, int offset) {
    
    ellipse(posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2, CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN);
    strokeWeight(7);
    
    switch(state) {
      case WAIT_FOR_GET_ITEM_FROM_SOURCE:
      case MOVE_TO_DESTINATION: {
       line(posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2, posX + CONSTANTS.BLOCK_LEN / 2 - (offset - 8) * delta, posY + CONSTANTS.BLOCK_LEN / 2 ); break; 
      }
      case WAIT_FOR_PUT_TO_DESTINATION:
      case MOVE_TO_SOURCE: {
        line(posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2, posX + CONSTANTS.BLOCK_LEN / 2  + (offset - 8) * delta, posY + CONSTANTS.BLOCK_LEN / 2); break;
      }
    }
    strokeWeight(2);
  }
  
  void drawRLManipulator(float posX, float posY, int res, ManipulatorState state, int offset) {
    
    ellipse(posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2, CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN);
    strokeWeight(7);
    
    switch(state) {
      case WAIT_FOR_GET_ITEM_FROM_SOURCE:
      case MOVE_TO_DESTINATION: {
       line(posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2, posX + CONSTANTS.BLOCK_LEN / 2 + (offset - 8) * delta, posY + CONSTANTS.BLOCK_LEN / 2 ); break; 
      }
      case WAIT_FOR_PUT_TO_DESTINATION:
      case MOVE_TO_SOURCE: {
        line(posX + CONSTANTS.BLOCK_LEN / 2, posY + CONSTANTS.BLOCK_LEN / 2, posX + CONSTANTS.BLOCK_LEN / 2 - (offset - 8) * delta, posY + CONSTANTS.BLOCK_LEN / 2 ); break;
      }
    }
    strokeWeight(2);
  }
  
  
  
}
