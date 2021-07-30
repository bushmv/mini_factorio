// represents a single resource on transporter part
abstract class Res {
  int resId;
  String description;
  public Res(int resId, String description) {
    this.resId = resId;
    this.description = description;
  }
  
  abstract public void draw(float x, float y);
  
}
