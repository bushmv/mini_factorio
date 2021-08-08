class UDSplitter extends Splitter {
  
  public UDSplitter(int posX, int posY, TransporterPart previous, DirectTransporterPart first, DirectTransporterPart second, DrawableSplitterFlyweight df) {
    super(posX, posY, previous, first, second, df);
  }
  
  void drawSplitterPart() { df.drawUDSplitter(posX, posY); }
}
