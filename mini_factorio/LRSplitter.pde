class LRSplitter extends Splitter {
  
  public LRSplitter(int posX, int posY, TransporterPart previous, DirectTransporterPart first, DirectTransporterPart second, DrawableSplitterFlyweight df) {
    super(posX, posY, previous, first, second, df);
  }
  
  void drawSplitterPart() { df.drawLRSplitter(posX, posY); }
}
