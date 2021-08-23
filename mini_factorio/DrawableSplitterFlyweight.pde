public interface DrawableSplitterFlyweight {
   void drawLRSplitter(float x, float y);
   void drawRLSplitter(float x, float y);
   void drawUDSplitter(float x, float y);
   void drawDUSplitter(float x, float y);
}


public class SimpleDrawableSplitterFlyweight implements DrawableSplitterFlyweight{
   void drawLRSplitter(float x, float y) { strokeWeight(3); rect(x, y, CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 2); strokeWeight(1); }
   void drawRLSplitter(float x, float y) { strokeWeight(3); rect(x, y, CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 2); strokeWeight(1); }
   void drawUDSplitter(float x, float y) { strokeWeight(3); rect(x, y, CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN); strokeWeight(1); }
   void drawDUSplitter(float x, float y) { strokeWeight(3); rect(x, y, CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN); strokeWeight(1); }
}
