// interface "insertable" is define that transporter part can insert new item
interface Insertable {
  
   public boolean canInsert();
   public void insert(int res);

}

interface CheckBeforeInsertable extends Insertable {
  boolean canInsertRes(int res);
}
