class Demo implements Instance {
  
  private DemoFragment demoFragment; 
  private DrawableTransporterPartFlyweight df;
  
  public Demo() {
    df = new SimpleDrawableTransporterPartFlyweight();
    
    //demoFragment = new LeftToRightDirectTransporterDemo(df);
    //demoFragment = new RightToLeftDirectTransporterDemo(df);
    //demoFragment = new UpToDownDirectTransporterDemo(df);
    demoFragment = new DownToUpDirectTransporterDemo(df);
  }
  
  public void run() {
    demoFragment.redraw();
  } 
  
}

interface DemoFragment {
  void redraw();
}

class LeftToRightDirectTransporterDemo implements DemoFragment {
  
  private TransporterPart part1;
  private TransporterPart part2;
  private TransporterPart part3;
  private TransporterPart part4;
  private TransporterPart part5;
  
  public LeftToRightDirectTransporterDemo(DrawableTransporterPartFlyweight df) {
    part1 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, null, 134774912, (byte) 1, df);
    part1.leftRes = 16777472; part1.rightRes = 131074;
    part2 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, part1, 8947712, (byte) 1, df);
    part2.leftRes = 33619968; part2.rightRes = 513;
    part3 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN, part2, -2004842368, (byte) 1, df);
    part3.leftRes = 50529024; part3.rightRes = 16843008;
    part4 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 4, CONSTANTS.BLOCK_LEN, part3, 0, (byte) 1, df);
    part5 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 5, CONSTANTS.BLOCK_LEN, part4, 0, (byte) 1, df);
  }
  
  void redraw() {
    part5.redraw();
  }
  
}

class RightToLeftDirectTransporterDemo implements DemoFragment {
  
  private TransporterPart part1;
  private TransporterPart part2;
  private TransporterPart part3;
  private TransporterPart part4;
  private TransporterPart part5;
  
  public RightToLeftDirectTransporterDemo(DrawableTransporterPartFlyweight df) {
    
    part5 = new RLDirectTransporterPart(CONSTANTS.BLOCK_LEN * 5, CONSTANTS.BLOCK_LEN, null, 134774912, (byte) 1, df);
    part5.leftRes = 16777472; part5.rightRes = 131074;
    part4 = new RLDirectTransporterPart(CONSTANTS.BLOCK_LEN * 4, CONSTANTS.BLOCK_LEN, part5, 8947712, (byte) 1, df);
    part4.leftRes = 33619968; part4.rightRes = 513;
    part3 = new RLDirectTransporterPart(CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN, part4, -2004842368, (byte) 1, df);
    part3.leftRes = 50529024; part3.rightRes = 16843008;
    part2 = new RLDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, part3, 0, (byte) 1, df);
    part1 = new RLDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, part2, 0, (byte) 1, df);
  }
  
  void redraw() {
    part1.redraw();
  }
  
}

class UpToDownDirectTransporterDemo implements DemoFragment {
  
  private TransporterPart part1;
  private TransporterPart part2;
  private TransporterPart part3;
  private TransporterPart part4;
  private TransporterPart part5;
  
  public UpToDownDirectTransporterDemo(DrawableTransporterPartFlyweight df) {
    part1 = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, null, 134774912, (byte) 1, df);
    part1.leftRes = 16777472; part1.rightRes = 131074;
    part2 = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 2, part1, 8947712, (byte) 1, df);
    part2.leftRes = 33619968; part2.rightRes = 513;
    part3 = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 3, part2, -2004842368, (byte) 1, df);
    part3.leftRes = 50529024; part3.rightRes = 16843008;
    part4 = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 4, part3, 0, (byte) 1, df);
    part5 = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 5, part4, 0, (byte) 1, df);
  }
  
  void redraw() {
    part5.redraw();
  }
  
}

class DownToUpDirectTransporterDemo implements DemoFragment {
  
  private TransporterPart part1;
  private TransporterPart part2;
  private TransporterPart part3;
  private TransporterPart part4;
  private TransporterPart part5;
  
  public DownToUpDirectTransporterDemo(DrawableTransporterPartFlyweight df) {
    
    part5 = new DUDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 5, null, 134774912, (byte) 1, df);
    part5.leftRes = 16777472; part5.rightRes = 131074;
    part4 = new DUDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 4, part5, 8947712, (byte) 1, df);
    part4.leftRes = 33619968; part4.rightRes = 513;
    part3 = new DUDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 3, part4, -2004842368, (byte) 1, df);
    part3.leftRes = 50529024; part3.rightRes = 16843008;
    part2 = new DUDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 2, part3, 0, (byte) 1, df);
    part1 = new DUDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, part2, 0, (byte) 1, df);
  }
  
  void redraw() {
    part1.redraw();
  }
  
}
