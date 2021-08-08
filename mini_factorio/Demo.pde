class Demo implements Instance {
  
  private DemoFragment demoFragment; 
  private DrawableTransporterPartFlyweight df;
  
  public Demo() {
    df = new SimpleDrawableTransporterPartFlyweight();
    
    // direct transporter part
    //demoFragment = new LeftToRightDirectTransporterDemo(df);
    //demoFragment = new RightToLeftDirectTransporterDemo(df);
    //demoFragment = new UpToDownDirectTransporterDemo(df); 
    //demoFragment = new DownToUpDirectTransporterDemo(df);
    
    // clockwise angle transporter part
    //demoFragment = new LDAngleTransporterPartDemo(df);
    //demoFragment = new ULAngleTransporterPartDemo(df);
    //demoFragment = new RUAngleTransporterPartDemo(df);
    //demoFragment = new DRAngleTransporterPartDemo(df);
    //demoFragment = new ClockWiseCirclerFragment(df);
    
    // anticlockwise angle transporter part
    //demoFragment = new DLAngleTransporterPartDemo(df);
    //demoFragment = new RDAngleTransporterPartDemo(df);
    //demoFragment = new URAngleTransporterPartDemo(df);
    //demoFragment = new LUAngleTransporterPartDemo(df); 
    
    // splitter demo
    demoFragment = new SplitterDemo(df);
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
    part5.update();
    part5.drawParts();
    part5.drawItems();
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
    part1.update();
    part1.drawParts();
    part1.drawItems();
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
    part5.update();
    part5.drawParts();
    part5.drawItems();
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
    part1.update();
    part1.drawParts();
    part1.drawItems();
  }
  
}

class LDAngleTransporterPartDemo implements DemoFragment {
  private TransporterPart part1;
  private TransporterPart part2;
  private TransporterPart part3;
  
  public LDAngleTransporterPartDemo(DrawableTransporterPartFlyweight df) {
    part1 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, null, 142639112, (byte) 1, df);
    part1.leftRes = 16777218; part1.rightRes = 66048;
    part2 = new LDAngleTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, part1, 0, (byte) 1, df);
    part3 = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, part2, 0, (byte) 1, df);
  }
  
  void redraw() {
    part3.update();
    part3.drawParts();
    part3.drawItems();
  }
  
}

class ULAngleTransporterPartDemo implements DemoFragment {
  private TransporterPart part1;
  private TransporterPart part2;
  private TransporterPart part3;
  
  public ULAngleTransporterPartDemo(DrawableTransporterPartFlyweight df) {
    part1 = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, null, 142639112, (byte) 1, df);
    part1.leftRes = 16777218; part1.rightRes = 66048;
    part2 = new ULAngleTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, part1, 0, (byte) 1, df);
    part3 = new RLDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 2, part2, 0, (byte) 1, df);
  }
  
  void redraw() {
    part3.update();
    part3.drawParts();
    part3.drawItems();
  }
  
}

class RUAngleTransporterPartDemo implements DemoFragment {
  private TransporterPart part1;
  private TransporterPart part2;
  private TransporterPart part3;
  
  public RUAngleTransporterPartDemo(DrawableTransporterPartFlyweight df) {
    part1 = new RLDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, null, 142639112, (byte) 1, df);
    part1.leftRes = 16777218; part1.rightRes = 66048;
    part2 = new RUAngleTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 2, part1, 0, (byte) 1, df);
    part3 = new DUDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, part2, 0, (byte) 1, df);
  }
  
  void redraw() {
    part3.update();
    part3.drawParts();
    part3.drawItems();
  }
  
}

class DRAngleTransporterPartDemo implements DemoFragment {
  private TransporterPart part1;
  private TransporterPart part2;
  private TransporterPart part3;
  
  public DRAngleTransporterPartDemo(DrawableTransporterPartFlyweight df) {
    part1 = new DUDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 2, null, 142639112, (byte) 1, df);
    part1.leftRes = 16777218; part1.rightRes = 66048;
    part2 = new DRAngleTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, part1, 0, (byte) 1, df);
    part3 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, part2, 0, (byte) 1, df);
  }
  
  void redraw() {
    part3.update();
    part3.drawParts();
    part3.drawItems();
  }
  
}

class ClockWiseCirclerFragment implements DemoFragment {
  private TransporterPart part1;
  private TransporterPart part2;
  private TransporterPart part3;
  private TransporterPart part4;
  
  public ClockWiseCirclerFragment(DrawableTransporterPartFlyweight df) {
    part1 = new LDAngleTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, null, -2146959360, (byte) 1, df);
    part1.leftRes = 0; part1.rightRes = 50331649;
    part2 = new ULAngleTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, part1, 0, (byte) 1, df);
    part3 = new RUAngleTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 2, part2, 0, (byte) 1, df);
    part4 = new DRAngleTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, part3, 0, (byte) 1, df);
    part1.previous = part4;
    part1.isStop = true;
  }
  
  void redraw() {
    part4.update();
    part4.drawParts();
    part4.drawItems();
  }
}
  
class DLAngleTransporterPartDemo implements DemoFragment {
  private TransporterPart part1;
  private TransporterPart part2;
  private TransporterPart part3;
  
  public DLAngleTransporterPartDemo(DrawableTransporterPartFlyweight df) {
    part1 = new DUDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, null, -2147450880, (byte) 1, df);
    part1.leftRes = 16777216; part1.rightRes = 33554432;
    part2 = new DLAngleTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, part1, 0, (byte) 1, df);
    part3 = new RLDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, part2, 0, (byte) 1, df);
  }
  
  void redraw() {
    part3.update();
    part3.drawParts();
    part3.drawItems();
  }
  
}

class RDAngleTransporterPartDemo implements DemoFragment {
  private TransporterPart part1;
  private TransporterPart part2;
  private TransporterPart part3;
  
  public RDAngleTransporterPartDemo(DrawableTransporterPartFlyweight df) {
    part1 = new RLDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, null, -2147450880, (byte) 1, df);
    part1.leftRes = 16777216; part1.rightRes = 33554432;
    part2 = new RDAngleTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, part1, 0, (byte) 1, df);
    part3 = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 2, part2, 0, (byte) 1, df);
  }
  
  void redraw() {
    part3.update();
    part3.drawParts();
    part3.drawItems();
  }
  
}

class URAngleTransporterPartDemo implements DemoFragment {
  private TransporterPart part1;
  private TransporterPart part2;
  private TransporterPart part3;
  
  public URAngleTransporterPartDemo(DrawableTransporterPartFlyweight df) {
    part1 = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, null, -2147450880, (byte) 1, df);
    part1.leftRes = 16777216; part1.rightRes = 33554432;
    part2 = new URAngleTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 2, part1, 0, (byte) 1, df);
    part3 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, part2, 0, (byte) 1, df);
  }
  
  void redraw() {
    part3.update();
    part3.drawParts();
    part3.drawItems();
  }
  
}

class LUAngleTransporterPartDemo implements DemoFragment {
  private TransporterPart part1;
  private TransporterPart part2;
  private TransporterPart part3;
  
  public LUAngleTransporterPartDemo(DrawableTransporterPartFlyweight df) {
    part1 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 2, null, -2147450880, (byte) 1, df);
    part1.leftRes = 16777216; part1.rightRes = 33554432;
    part2 = new LUAngleTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, part1, 0, (byte) 1, df);
    part3 = new DUDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, part2, 0, (byte) 1, df);
  }
  
  void redraw() {
    part3.update();
    part3.drawParts();
    part3.drawItems();
  }
  
}

class SplitterDemo implements DemoFragment {
 
  TransporterPart pr;
  DirectTransporterPart f;
  DirectTransporterPart s;
  Splitter sp;
  
  public SplitterDemo(DrawableTransporterPartFlyweight df) {
    pr = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, null, -2139092984, (byte) 1, df);
    pr.leftRes = 131073; pr.rightRes = 33554688;
    f = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, null, 0, (byte) 1, df);
    s = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, null, 0, (byte) 1, df);
    sp = new LRSplitter(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, pr, f, s, new SimpleDrawableSplitterFlyweight());
  }
  
  void redraw() {
    f.drawParts();
    s.drawParts();
    sp.drawPreviousParts();
    
    f.update();
    s.update();
    sp.update();
    
    f.drawItems();
    s.drawItems();
    sp.drawPreviousItems();
    
  }
}
