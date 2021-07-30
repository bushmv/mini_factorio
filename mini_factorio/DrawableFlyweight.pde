// contains all the resources and how they should be rendered in one place 
public class DrawableFlyweight {
 
  private ArrayList<Res> resources;
  
  public DrawableFlyweight() {
   resources = new ArrayList<Res>();
  }
  
  public void draw(float x, float y, int resType) {
    println(resType);
    resources.get(resType - 1).draw(x, y);
  }
  
}
