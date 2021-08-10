class InsertableManipulatorAntiClockWise implements Insertable {
 
  private AntiClockWiseAngleTransporterPart atp;
  
   public InsertableManipulatorAntiClockWise(AntiClockWiseAngleTransporterPart atp) {
     this.atp = atp; 
  }
  
  public boolean canInsert() {
    return (atp.state & 2032) == 0 || (atp.state & 8323072) == 0 || (atp.state & 133169152) == 0 || (atp.state & 2130706432) == 0;
  }
  
  public void insert(int res) {
    if ((atp.state & 2130706432) == 0) {
      atp.state += 134217728;
      atp.rightRes = atp.rightRes + (res << 16);
    } else if ((atp.state & 133169152) == 0) {
      atp.state += 8388608;
      atp.rightRes = atp.rightRes + (res << 8);
    } else if ((atp.state & 2130706432) == 0) {
      atp.state += 524288;
      atp.rightRes = atp.rightRes + res;
    } else if ((atp.state & 2032) == 0) {
      atp.state += 128;
      atp.leftRes = atp.leftRes + (res << 8);
    } else {
     throw new RuntimeException("Can't insert item"); 
    }
  }
  
}

class InsertableManipulatorClockWise implements Insertable {
 
  private ClockWiseAngleTransporterPart atp;
  
   public InsertableManipulatorClockWise(ClockWiseAngleTransporterPart atp) {
     this.atp = atp; 
  }
  
  public boolean canInsert() {
    return (atp.state & 520192) == 0 || (atp.state & 32512) == 0 || (atp.state & 2032) == 0 || (atp.state & 2130706432) == 0;
  }
  
  public void insert(int res) {
    if ((atp.state & 520192) == 0) {
      atp.state += 32768;
      atp.leftRes = atp.leftRes + (res << 24);
    } else if ((atp.state & 32512) == 0) {
      atp.state += 2048;
      atp.leftRes = atp.leftRes + (res << 16);
    } else if ((atp.state & 2032) == 0) {
      atp.state += 128;
      atp.leftRes = atp.leftRes + (res << 8);
    } else if ((atp.state & 2130706432) == 0) {
      atp.state += 134217728;
      atp.rightRes = atp.rightRes + (res << 16);
    } else {
     throw new RuntimeException("Can't insert item"); 
    }
  }
  
}
