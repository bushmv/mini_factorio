class InsertableManipulatorDirectLeftFirst implements Insertable {
  private DirectTransporterPart dtp;
  
  public InsertableManipulatorDirectLeftFirst(DirectTransporterPart dtp) {
     this.dtp = dtp; 
  }
  
  public boolean canInsert() {
   return (dtp.state & 133169152) == 0 || (dtp.state & 2032) == 0 || (dtp.state & 32512) == 0 || (dtp.state & 2130706432) == 0;
  }
  
  public void insert(int res) {
    if ((dtp.state & 32512) == 0) {
      dtp.state += 2048;
      dtp.leftRes = dtp.leftRes + (res << 16);
    } else if ((dtp.state & 2032) == 0) {
      dtp.state += 128;
      dtp.leftRes = dtp.leftRes + (res << 8);
    } else if ((dtp.state & 2130706432) == 0) {
      dtp.state += 134217728;
      dtp.rightRes = dtp.rightRes + (res << 16);
    } else if ((dtp.state & 133169152) == 0) {
      dtp.state += 8388608;
      dtp.rightRes = dtp.rightRes + (res << 8);
    }
  }
}

class InsertableManipulatorDirectRightFirst implements Insertable {
  private DirectTransporterPart dtp;
  
  public InsertableManipulatorDirectRightFirst(DirectTransporterPart dtp) {
     this.dtp = dtp; 
  }
  
  public boolean canInsert() {
   return (dtp.state & 133169152) == 0 || (dtp.state & 2032) == 0 || (dtp.state & 32512) == 0 || (dtp.state & 2130706432) == 0;
  }
  
  public void insert(int res) {
    if ((dtp.state & 2130706432) == 0) {
      dtp.state += 134217728;
      dtp.rightRes = dtp.rightRes + (res << 16);
    } else if ((dtp.state & 133169152) == 0) {
      dtp.state += 8388608;
      dtp.rightRes = dtp.rightRes + (res << 8);
    } else if ((dtp.state & 32512) == 0) {
      dtp.state += 2048;
      dtp.leftRes = dtp.leftRes + (res << 16);
    } else if ((dtp.state & 2032) == 0) {
      dtp.state += 128;
      dtp.leftRes = dtp.leftRes + (res << 8);
    }  
  }
}
