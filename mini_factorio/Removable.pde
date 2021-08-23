// interface "removable" is define that transporter part can remove own item  
public interface Removable {
  
  public boolean canRemove();
  public int remove();
  
}

interface PeekAllRemovable extends Removable {
  int[] peek();
  void removeAt(int position);
}
