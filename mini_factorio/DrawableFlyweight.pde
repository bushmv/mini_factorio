// contains all the resources and how they should be rendered in one place 

public interface DrawableTransporterPartFlyweight {
 
  void draw(float x, float y, int resType);
  void drawLRTransporterPart(float x, float y);
  void drawRLTransporterPart(float x, float y);
  void drawUDTransporterPart(float x, float y);
  void drawDUTransporterPart(float x, float y);
  
}

public class SimpleDrawableTransporterPartFlyweight implements DrawableTransporterPartFlyweight {
 
  private ArrayList<Res> resources;
  
  public SimpleDrawableTransporterPartFlyweight() {
    resources = new ArrayList<Res>();
    resources.add(new Res(1, "res 1") { public void draw(float x, float y) { rect(x, y, CONSTANTS.MATERIAL_LEN, CONSTANTS.MATERIAL_LEN); }});
    resources.add(new Res(2, "res 2") { public void draw(float x, float y) { ellipse(x + CONSTANTS.MATERIAL_LEN / 2, y + CONSTANTS.MATERIAL_LEN / 2, CONSTANTS.MATERIAL_LEN, CONSTANTS.MATERIAL_LEN); }});
    resources.add(new Res(3, "res 3") { public void draw(float x, float y) { 
     ellipse(x + CONSTANTS.MATERIAL_LEN / 4, y + CONSTANTS.MATERIAL_LEN / 4, CONSTANTS.MATERIAL_LEN / 2, CONSTANTS.MATERIAL_LEN / 2); 
     ellipse(x + CONSTANTS.MATERIAL_LEN / 4 + CONSTANTS.MATERIAL_LEN / 2, y + CONSTANTS.MATERIAL_LEN / 4 + CONSTANTS.MATERIAL_LEN / 2, CONSTANTS.MATERIAL_LEN / 2, CONSTANTS.MATERIAL_LEN / 2); }});
  }
  
  
  public void draw(float x, float y, int resType) {
    resources.get(resType - 1).draw(x, y);
  }
  
  void drawLRTransporterPart(float x, float y) {
    rect(x, y, CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN);
  }
  void drawRLTransporterPart(float x, float y) {
    rect(x, y, CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN);
  }
  void drawUDTransporterPart(float x, float y) {
    rect(x, y, CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN);
  }
  void drawDUTransporterPart(float x, float y) {
    rect(x, y, CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN);
  }
  
}
