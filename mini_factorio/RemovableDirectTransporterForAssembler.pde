class RemovableDirectTransporterForAssembler implements PeekAllRemovable {
 
  int[] peekRes = new int[4];
  private DirectTransporterPart dtp;
  
  public RemovableDirectTransporterForAssembler(DirectTransporterPart dtp) {
     this.dtp = dtp; 
  }
  
  int[] peek() { updatePeekRes(); return peekRes; }
  
  private void updatePeekRes() {
    peekRes[0] = (dtp.leftRes & 65280) >> 8;
    peekRes[1] = (dtp.leftRes & 16711680) >> 16;
    peekRes[2] = (dtp.rightRes & 65280) >> 8;
    peekRes[3] = (dtp.rightRes & 16711680) >> 16;
  }
  
  void removeAt(int pos) {
    switch(pos) {
     case 0: dtp.leftRes &= ~65280; dtp.state &= ~240; break;
     case 1: dtp.leftRes &= ~16711680; dtp.state &= ~3840; break;
     case 2: dtp.rightRes &= ~65280; dtp.state &= ~15728640; break;
     case 3: dtp.rightRes &= ~65280; dtp.state &= ~251658240; break;
    }
  }
  
  boolean canRemove() { return (dtp.state & 142608512) != 0; }
  int remove() { throw new RuntimeException("call remove(int pos) instead of remove()"); }
}
