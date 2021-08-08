public interface DrawableSplitterFlyweight {
   void drawLRSplitter(float x, float y);
   void drawRLSplitter(float x, float y);
   void drawUDSplitter(float x, float y);
   void drawDUSplitter(float x, float y);
}


public class SimpleDrawableSplitterFlyweight implements DrawableSplitterFlyweight{
   void drawLRSplitter(float x, float y) {}
   void drawRLSplitter(float x, float y) {}
   void drawUDSplitter(float x, float y) {}
   void drawDUSplitter(float x, float y) {}
}
