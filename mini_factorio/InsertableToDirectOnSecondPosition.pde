// put items to direct transporter part on right side
class InsertableToDirectOnRightSecondPosition implements Insertable {
   
  DirectTransporterPart dtp;
  
  public InsertableToDirectOnRightSecondPosition(DirectTransporterPart dtp) {
    this.dtp = dtp;
  }
  
   public boolean canInsert() { return (dtp.state & 133169152) == 0; }
   public void insert(int res) { dtp.state += 8388608; dtp.rightRes = dtp.rightRes + (res << 8); }
   
}

class InsertableToDirectOnLeftSecondPosition implements Insertable {
   
  DirectTransporterPart dtp;
  
  public InsertableToDirectOnLeftSecondPosition(DirectTransporterPart dtp) {
    this.dtp = dtp;
  }
  
   public boolean canInsert() { return (dtp.state & 2032) == 0; }
   public void insert(int res) { dtp.state += 128; dtp.leftRes = dtp.leftRes + (res << 8); }
   
}
