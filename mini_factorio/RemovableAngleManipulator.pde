class RemovableManipulatorAntiClockwise implements Removable {
  private AntiClockWiseAngleTransporterPart atp;
  
  public RemovableManipulatorAntiClockwise(AntiClockWiseAngleTransporterPart atp) {
     this.atp = atp; 
  }
  
  public boolean canRemove() {
    return (atp.state & 143130752) != 0;
  }
  
  public int remove() {
     if ((atp.state & 524288) == 524288) {
      int res = atp.rightRes & 255;
      atp.state = atp.state & ~983040;
      atp.rightRes = atp.rightRes & ~255;
      return res;
    } else if ((atp.state & 8388608) == 8388608) {
      int res = (atp.rightRes & 65280) >> 8;
      atp.state = atp.state & ~15728640;
      atp.rightRes = atp.rightRes & ~65280;
      return res;
    } else if ((atp.state & 134217728) == 134217728) {
      int res = (atp.rightRes & 16711680) >> 16;
      atp.state = atp.state & ~251658240;
      atp.rightRes = atp.rightRes & ~16711680;
      return res;
    } if ((atp.state & 128) == 128) {
      int res = (atp.leftRes & 65280) >> 8;
      atp.state = atp.state & ~240;
      atp.leftRes = atp.leftRes & ~65280;
      return res;
    } 
    throw new RuntimeException("Can't remove item");
  }
}

class RemovableManipulatorClockwise implements Removable {
  private ClockWiseAngleTransporterPart atp;
  
  public RemovableManipulatorClockwise(ClockWiseAngleTransporterPart atp) {
     this.atp = atp; 
  }
  
  public boolean canRemove() {
    return (atp.state & 134252672) != 0;
  }
  
  public int remove() {
     if ((atp.state & 32768) == 32768) {
      int res = (atp.leftRes & -16777216) >> 24;
      atp.state = atp.state & ~61440;
      atp.leftRes = atp.leftRes & ~-16777216;
      return res;
    } else if ((atp.state & 2048) == 2048) {
      int res = (atp.leftRes & 16711680) >> 16;
      atp.state = atp.state & ~3840;
      atp.leftRes = atp.leftRes & ~16711680;
      return res;
    } else if ((atp.state & 128) == 128) {
      int res = (atp.leftRes & 65280) >> 8;
      atp.state = atp.state & ~240;
      atp.leftRes = atp.leftRes & ~65280;
      return res;
    } else if ((atp.state & 134217728) == 134217728) {
      int res = (atp.rightRes & 16711680) >> 16;
      atp.state = atp.state & ~251658240;
      atp.rightRes = atp.rightRes & ~16711680;
      return res;
    } 
    throw new RuntimeException("Can't remove item");
  }
}
