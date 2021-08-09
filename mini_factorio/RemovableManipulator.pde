class RemovableManipulatorDirectLeftFirst implements Removable {
 
  private DirectTransporterPart dtp;
  
  public RemovableManipulatorDirectLeftFirst(DirectTransporterPart dtp) {
     this.dtp = dtp; 
  }
  
  public boolean canRemove() {
    return (dtp.state & 142608512) != 0;
  }
  
  public int remove() {
    if ((dtp.state & 128) == 128) {
       int res = (dtp.leftRes & 65280) >> 8;
       dtp.state = dtp.state & ~240;
       dtp.leftRes = (dtp.leftRes & ~65280);
       return res;
    } else if ((dtp.state & 2048) == 2048) {
       int res = (dtp.leftRes & 16711680) >> 16;
       dtp.state = dtp.state & ~3840;
       dtp.leftRes = (dtp.leftRes & ~16711680);
       return res;
    } else if ((dtp.state & 8388608) == 8388608) {
       int res = (dtp.rightRes & 65280) >> 8;
       dtp.state = dtp.state & ~15728640;
       dtp.rightRes = (dtp.rightRes & ~65280);
       return res;
    } else if ((dtp.state & 134217728) == 134217728) {
       int res = (dtp.rightRes & 16711680) >> 16;
       dtp.state = dtp.state & ~251658240;
       dtp.rightRes = (dtp.rightRes & ~65280);
       return res;
    }
    throw new RuntimeException("Can't remove item");
  }
}

class RemovableManipulatorDirectRightFirst implements Removable {
 
  private DirectTransporterPart dtp;
  
  public RemovableManipulatorDirectRightFirst(DirectTransporterPart dtp) {
     this.dtp = dtp; 
  }
  
  public boolean canRemove() {
    return (dtp.state & 142608512) != 0;
  }
  
  public int remove() {
    if ((dtp.state & 8388608) == 8388608) {
       int res = (dtp.rightRes & 65280) >> 8;
       dtp.state = dtp.state & ~15728640;
       dtp.rightRes = (dtp.rightRes & ~65280);
       return res;
    } else if ((dtp.state & 134217728) == 134217728) {
       int res = (dtp.rightRes & 16711680) >> 16;
       dtp.state = dtp.state & ~251658240;
       dtp.rightRes = (dtp.rightRes & ~65280);
       return res;
    } else if ((dtp.state & 128) == 128) {
       int res = (dtp.leftRes & 65280) >> 8;
       dtp.state = dtp.state & ~240;
       dtp.leftRes = (dtp.leftRes & ~65280);
       return res;
    } else if ((dtp.state & 2048) == 2048) {
       int res = (dtp.leftRes & 16711680) >> 16;
       dtp.state = dtp.state & ~3840;
       dtp.leftRes = (dtp.leftRes & ~16711680);
       return res;
    }  
    throw new RuntimeException("Can't remove item");
  }
}
