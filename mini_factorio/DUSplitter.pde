class DUSplitter extends Splitter {
  
  public DUSplitter(int posX, int posY, TransporterPart previous, DirectTransporterPart first, DirectTransporterPart second, DrawableSplitterFlyweight df) {
    super(posX, posY, previous, first, second, df);
  }
  
  void drawSplitterPart() { df.drawDUSplitter(posX, posY); }
}
