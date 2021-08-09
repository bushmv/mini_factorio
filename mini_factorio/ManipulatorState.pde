public enum ManipulatorState {
  
  WAIT_FOR_GET_ITEM_FROM_SOURCE,
  MOVE_TO_DESTINATION,
  WAIT_FOR_PUT_TO_DESTINATION,
  MOVE_TO_SOURCE;

   private ManipulatorState() {};
  
  ManipulatorState next(ManipulatorState current) {
    switch(current) {
      case WAIT_FOR_GET_ITEM_FROM_SOURCE: return MOVE_TO_DESTINATION;
      case MOVE_TO_DESTINATION: return WAIT_FOR_PUT_TO_DESTINATION;
      case WAIT_FOR_PUT_TO_DESTINATION: return MOVE_TO_SOURCE;
      case MOVE_TO_SOURCE: return WAIT_FOR_GET_ITEM_FROM_SOURCE;
      default: throw new RuntimeException("wrong type for ManipulatorState current: " + current);
    }
  
  }
}
