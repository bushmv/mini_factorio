class RLSplitter extends Splitter {
  
  public RLSplitter(int posX, int posY, TransporterPart previous, DirectTransporterPart first, DirectTransporterPart second, DrawableSplitterFlyweight df) {
    super(posX, posY, previous, first, second, df);
  }
  
  void drawSplitterPart() { df.drawRLSplitter(posX, posY); }
}
