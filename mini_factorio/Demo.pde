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
    demoFragment = new ClockWiseCirclerFragment(df);
    
    // anticlockwise angle transporter part
    //demoFragment = new DLAngleTransporterPartDemo(df);
    //demoFragment = new RDAngleTransporterPartDemo(df);
    //demoFragment = new URAngleTransporterPartDemo(df);
    //demoFragment = new LUAngleTransporterPartDemo(df); 
    
    // splitter demo
    demoFragment = new SplitterDemo(df);
    
    //mediator demo 
    //demoFragment = new MediatorToRightSideDemo(df);
    //demoFragment = new MediatorToLeftSideDemo(df);
    
    //manipulator demo
    //demoFragment = new UDManipulatorDemo(df);
    //demoFragment = new DUManipulatorDemo(df); 
    //demoFragment = new LRManipulatorDemo(df); 
    //demoFragment = new RLManipulatorDemo(df);
    
    //manipulator with angle transporter parts
    //demoFragment = new URtoRDManipulatorDemo(df); 
    //demoFragment = new LRtoDRManipulatorDemo(df);
    
    // miningDrill
    //demoFragment = new MiningDrillDemo(df); 
    
    //underground transporter part demo 
    //demoFragment = new UndergroundTransporterPartDemo(df);
    
    //assembler demo
    //demoFragment = new AssemblerDemo(df);
    
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
    part1 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, null, -2004318072, (byte) 1, df); //134774912
    part1.leftRes = 33686018; part1.rightRes = 16843009;
    //part1.leftRes = 16777472; part1.rightRes = 131074;
    part2 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, part1, 0, (byte) 1, df); // 8947712
    //part2.leftRes = 33619968; part2.rightRes = 513;
    part3 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN, part2, 0, (byte) 1, df); // -2004842368
    //part3.leftRes = 50529024; part3.rightRes = 16843008;
    part4 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 4, CONSTANTS.BLOCK_LEN, part3, 0, (byte) 1, df);
    part5 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 5, CONSTANTS.BLOCK_LEN, part4, 0, (byte) 1, df);
  }
  
  void redraw() {
    part5.drawParts();
    part5.update();
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
    part1 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, null, -2004318072, (byte) 1, df);
    part1.leftRes = 33686018; part1.rightRes = 16843009;
    part2 = new LDAngleTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, part1, -2004318072, (byte) 1, df);
    part2.leftRes = 33686018; part2.rightRes = 16843010;
    part3 = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, part2, -2004318072, (byte) 1, df);
    part3.leftRes = 33686018; part3.rightRes = 16843009;
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
  DirectTransporterPart t1;
  DirectTransporterPart t2;
  DirectTransporterPart t3;
  DirectTransporterPart f;
  DirectTransporterPart s;
  DirectTransporterPart af;
  DirectTransporterPart as;
  Splitter sp;
  
  public SplitterDemo(DrawableTransporterPartFlyweight df) {
    t1 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, null, -2004318072, (byte) 1, df);
    t1.leftRes = 33686018; t1.rightRes = 16843009;
    t2 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, t1, -2004318072, (byte) 1, df);
    t2.leftRes = 33686018; t2.rightRes = 16843009;
    
    t3 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN, t2, 0, (byte) 1, df);
    
    f = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 4, CONSTANTS.BLOCK_LEN, null, 0, (byte) 1, df);
    s = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 4, CONSTANTS.BLOCK_LEN * 2, null, 0, (byte) 1, df);
    sp = new LRSplitter(CONSTANTS.BLOCK_LEN * 4, CONSTANTS.BLOCK_LEN, t3, f, s, new SimpleDrawableSplitterFlyweight());
    
    af = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 5, CONSTANTS.BLOCK_LEN, f, 0, (byte) 1, df);
    as = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 5, CONSTANTS.BLOCK_LEN * 2, s, 0, (byte) 1, df);
  }
  
  void redraw() {
    sp.drawPreviousParts();
    af.drawParts();
    as.drawParts();
    t3.drawParts();
    sp.drawSplitterPart();
   
    af.update();
    as.update();
    sp.update();
    
    af.drawItems();
    as.drawItems();
    t2.drawItems();
    sp.drawPreviousItems();
    
  }
}

class MediatorToRightSideDemo implements DemoFragment {
    
    DirectTransporterPart p1;
    DirectTransporterPart p2;
    DirectTransporterPart p3;
    DirectTransporterPart p4;
    DirectTransporterPart r;
    Mediator m;
    
    public MediatorToRightSideDemo(DrawableTransporterPartFlyweight df) {
      p1 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, null, 0, (byte) 1, df);
      p2 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, p1, 0, (byte) 1, df);
      p3 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN, p2, 0, (byte) 1, df);
      p4 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 4, CONSTANTS.BLOCK_LEN, p3, 0, (byte) 1, df);
      r = new DUDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, null, -2004318072, (byte) 1, df);
      r.leftRes = 16843009; r.rightRes = 16843009;
      m = new SimpleMediator(new RemovableFirstItemsLeftFirst(r), new InsertableToDirectOnRightSecondPosition(p2));
    }
    
    void redraw() {
      p4.drawParts();
      r.drawParts();
     
      p4.update();
      r.update();
      m.update();
      

      p4.drawItems();
      r.drawItems();
    }
}

class MediatorToLeftSideDemo implements DemoFragment {
    
    DirectTransporterPart p1;
    DirectTransporterPart p2;
    DirectTransporterPart p3;
    DirectTransporterPart p4;
    DirectTransporterPart r;
    Mediator m;
    
    public MediatorToLeftSideDemo(DrawableTransporterPartFlyweight df) {
      p1 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 2, null, 0, (byte) 1, df);
      p2 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, p1, 0, (byte) 1, df);
      p3 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN * 2, p2, 0, (byte) 1, df);
      p4 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 4, CONSTANTS.BLOCK_LEN * 2, p3, 0, (byte) 1, df);
      r = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, null, -2004318072, (byte) 1, df);
      r.leftRes = 16843009; r.rightRes = 16843009;
      m = new SimpleMediator(new RemovableFirstItemsRightFirst(r), new InsertableToDirectOnLeftSecondPosition(p2));
    }
    
    void redraw() {
      p4.drawParts();
      r.drawParts();
     
      p4.update();
      r.update();
      m.update();
      

      p4.drawItems();
      r.drawItems();
      

    }
}

class UDManipulatorDemo implements DemoFragment {
  DirectTransporterPart from;
  DirectTransporterPart to;
  Manipulator m;
  public UDManipulatorDemo(DrawableTransporterPartFlyweight df) {
    from = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, null, -2004318072, (byte) 1, df);
    from.leftRes = 16843009; from.rightRes = 33686018;
    to = new RLDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 3, null, 0, (byte) 1, df);
    m = new UDManipulator(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, 
              new RemovableManipulatorDirectLeftFirst(from), new InsertableManipulatorDirectRightFirst(to), 16, new DrawableManupulatorFlyweight(CONSTANTS.BLOCK_LEN * 2 / 16));
  }
  
  void redraw() {
    from.drawParts();
    to.drawParts();
    
    from.update();
    to.update();
    m.update();
    
    from.drawItems();
    to.drawItems();
    m.draw();
  }
}

class DUManipulatorDemo implements DemoFragment {
  DirectTransporterPart from;
  DirectTransporterPart to;
  Manipulator m;
  public DUManipulatorDemo(DrawableTransporterPartFlyweight df) {
    from = new RLDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 3, null, -2004318072, (byte) 1, df);
    from.leftRes = 16843009; from.rightRes = 33686018;
    to = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN, null, 0, (byte) 1, df);
    m = new DUManipulator(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, 
              new RemovableManipulatorDirectRightFirst(from), new InsertableManipulatorDirectLeftFirst(to), 16, new DrawableManupulatorFlyweight(CONSTANTS.BLOCK_LEN * 2 / 16));
  }
  
  void redraw() {
    from.drawParts();
    to.drawParts();
    
    from.update();
    to.update();
    m.update();
    
    from.drawItems();
    to.drawItems();
    m.draw();
  }
}

class LRManipulatorDemo implements DemoFragment {
  DirectTransporterPart r1;
  DirectTransporterPart r2;
  
  DirectTransporterPart l1;
  DirectTransporterPart l2;
  
  Manipulator m;
  public LRManipulatorDemo(DrawableTransporterPartFlyweight df) {
    l1 = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, null, -2004318072, (byte) 1, df);
    l1.leftRes = 16843009; l1.rightRes = 16843009;
    l2 = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 2, l1, 0, (byte) 1, df);
    
    r1 = new DUDirectTransporterPart(CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN * 2, null, 0, (byte) 1, df);
    r2 = new DUDirectTransporterPart(CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN, r1, 0, (byte) 1, df);
    //r1.leftRes = 16843009; r1.rightRes = 16843009;

    
    m = new LRManipulator(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, 
              new RemovableManipulatorDirectRightFirst(l2), new InsertableManipulatorDirectRightFirst(r1), 16, new DrawableManupulatorFlyweight(CONSTANTS.BLOCK_LEN * 2 / 16));
  }
  
  void redraw() {
    l2.drawParts();
    r2.drawParts();
    
    l2.update();
    r2.update();
    m.update();
    
    l2.drawItems();
    r2.drawItems();
    m.draw();
  }
}

class RLManipulatorDemo implements DemoFragment {
  DirectTransporterPart from;
  DirectTransporterPart to;
  Manipulator m;
  public RLManipulatorDemo(DrawableTransporterPartFlyweight df) {
    from = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN * 4, CONSTANTS.BLOCK_LEN * 2, null, -2004318072, (byte) 1, df);
    from.leftRes = 16843009; from.rightRes = 33686018;
    to = new DUDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, null, 0, (byte) 1, df);
    m = new RLManipulator(CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN * 2, 
              new RemovableManipulatorDirectRightFirst(from), new InsertableManipulatorDirectLeftFirst(to), 16, new DrawableManupulatorFlyweight(CONSTANTS.BLOCK_LEN * 2 / 16));
  }
  
  void redraw() {
    from.drawParts();
    to.drawParts();
    
    from.update();
    to.update();
    //m.update();
    
    from.drawItems();
    to.drawItems();
    m.draw();
  }
}

class URtoRDManipulatorDemo implements DemoFragment {
  AntiClockWiseAngleTransporterPart from;
  AntiClockWiseAngleTransporterPart to;
  Manipulator m;
  public URtoRDManipulatorDemo(DrawableTransporterPartFlyweight df) {
    from = new URAngleTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, null, -2004318072, (byte) 1, df);
    from.leftRes = 16843009; from.rightRes = 33686018;
    to = new RDAngleTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 4, null, 0, (byte) 1, df);
    m = new UDManipulator(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 3, 
              new RemovableManipulatorAntiClockwise(from), new InsertableManipulatorAntiClockWise(to), 16, new DrawableManupulatorFlyweight(CONSTANTS.BLOCK_LEN * 2 / 16));
  }
  
  void redraw() {
    from.drawParts();
    to.drawParts();
    
    from.update();
    to.update();
    m.update();
    
    from.drawItems();
    to.drawItems();
    m.draw();
  }
}

class LRtoDRManipulatorDemo implements DemoFragment {
  ClockWiseAngleTransporterPart from;
  ClockWiseAngleTransporterPart to;
  Manipulator m;
  public LRtoDRManipulatorDemo(DrawableTransporterPartFlyweight df) {
    from = new ULAngleTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, null, -2004318072, (byte) 1, df);
    from.leftRes = 16843009; from.rightRes = 33686018;
    to = new DRAngleTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 4, null, 0, (byte) 1, df);
    m = new UDManipulator(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 3, 
              new RemovableManipulatorClockwise(from), new InsertableManipulatorClockWise(to), 16, new DrawableManupulatorFlyweight(CONSTANTS.BLOCK_LEN * 2 / 16));
  }
  
  void redraw() {
    from.drawParts();
    to.drawParts();
    
    from.update();
    to.update();
    m.update();
    
    from.drawItems();
    to.drawItems();
    m.draw();
  }
  
}

class MiningDrillDemo implements DemoFragment {
  
  DirectTransporterPart p1;
  DirectTransporterPart p2;
  DirectTransporterPart p3;
  DirectTransporterPart p4;
  DirectTransporterPart p5;
  
  MiningDrill md1;
  MiningDrill md2;
  
  Mediator m1;
  Mediator m2;
  
  public MiningDrillDemo(DrawableTransporterPartFlyweight df) {
    p1 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 4, null, 0, (byte)1, df);
    p2 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 4, p1, 0, (byte)1, df);
    p3 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN * 4, p2, 0, (byte)1, df);
    p4 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 4, CONSTANTS.BLOCK_LEN * 4, p3, 0, (byte)1, df);
    p5 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 5, CONSTANTS.BLOCK_LEN * 4, p4, 0, (byte)1, df);
    
    
    DrawableMiningDrillFlyweight dfmd = new SimpleDrawableMiningDrillFlyweight();
    //md1 = new UDMiningDrill(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN, 32, 1, dfmd); 
    md2 = new DUMiningDrill(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 5, 32, 2, dfmd);
    
    //m1 = new SimpleMediator(md1, new InsertableToDirectOnLeftSecondPosition(p2));
    m2 = new SimpleMediator(md2, new InsertableToDirectOnRightSecondPosition(p2));
  }
  
  void redraw() {
    p5.drawParts();
    
    p5.update();
    //md1.update();
    md2.update();
    //m1.update();
    m2.update();
    
    p5.drawItems();
    //md1.draw();
    md2.draw();
  }
  
}

class UndergroundTransporterPartDemo implements DemoFragment {
  
  TransporterPart f;
  TransporterPart s;
  
  TransporterPart t1;
  TransporterPart t2;
  TransporterPart t3;
  TransporterPart t4;
  TransporterPart t5;
  
  TransporterPart g1;
  TransporterPart g2;
  TransporterPart g3;
  
  public UndergroundTransporterPartDemo(DrawableTransporterPartFlyweight df) {
     f = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 1, CONSTANTS.BLOCK_LEN * 2, null, -2004318072, (byte) 1, df);
     f.leftRes = 33686018;f.rightRes = 16843009;
     s = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, f, 0, (byte) 1, df);
    
     t1 = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN * 5, CONSTANTS.BLOCK_LEN, null, 0, (byte) 1, df);
     //t1.leftRes = 65792; t1.rightRes = 33554434;
     t2 = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN * 5, CONSTANTS.BLOCK_LEN * 2, t1, 0, (byte) 1, df);
     t3 = new UDDirectTransporterPart(CONSTANTS.BLOCK_LEN * 5, CONSTANTS.BLOCK_LEN * 3, t2, 0, (byte) 1, df);
     
     t4 = new LRFirstUndergroundTransporterPart(CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN * 2, s, 0, (byte) 1, df);
     //t4.leftRes = 16777216; t4.rightRes = 131072;
     
     g1 = new DirectUndergroundTranspoterPart(t4, 0, (byte) 1);
     g2 = new DirectUndergroundTranspoterPart(g1, 0, (byte) 1);
     g3 = new DirectUndergroundTranspoterPart(g2, 0, (byte) 1);
     
     t5 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 7, CONSTANTS.BLOCK_LEN * 2, g3, 0, (byte) 1, df);
  }
  
  void redraw() {
    f.drawParts();
     t3.drawParts();
     t5.drawParts();
     
     t3.update();
     t5.update();
     
     f.drawItems();
     t3.drawItems();
     t5.drawItems();
  }
  
}

public class AssemblerDemo implements DemoFragment {
  
  TransporterPart t1;
  TransporterPart t2;
  
  DirectTransporterPart t3;
  DirectTransporterPart t4;
  UDManipulatorFromDirectTransporterToAssembler m;
  Assembler asm;
  
  Manipulator md;
  DirectTransporterPart a1;
  DirectTransporterPart a2;
  
  public AssemblerDemo(DrawableTransporterPartFlyweight df) {
    t1 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN, CONSTANTS.BLOCK_LEN * 2, null, -2004318072, (byte) 1, df);
    t1.leftRes = 16843009; t1.rightRes = 33686018;
    t2 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 2, CONSTANTS.BLOCK_LEN * 2, t1, -2004318072, (byte) 1, df);
    t2.leftRes = 16843009; t2.rightRes = 33686018;
    
    t3 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN * 2, t2, 0, (byte) 1, df);
    t4 = new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 4, CONSTANTS.BLOCK_LEN * 2, t3, 0, (byte) 1, df);
    Recipe r = new Recipe(2, new int[]{1, 2}, new int[]{1, 1}, 5); 
    asm = new Assembler(CONSTANTS.BLOCK_LEN * 3, CONSTANTS.BLOCK_LEN * 4, r, 5, 64, new SimpleDrawableAssembler());
    m = new UDManipulatorFromDirectTransporterToAssembler(CONSTANTS.BLOCK_LEN * 4, CONSTANTS.BLOCK_LEN * 3, 
              new RemovableDirectTransporterForAssembler(t4), asm, 16, new DrawableManupulatorFlyweight(CONSTANTS.BLOCK_LEN * 2 / 16)); 
              
    a1 =  new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 4, CONSTANTS.BLOCK_LEN * 8, null, 0, (byte) 1, df);
    a2 =  new LRDirectTransporterPart(CONSTANTS.BLOCK_LEN * 5, CONSTANTS.BLOCK_LEN * 8, a1, 0, (byte) 1, df);
    md = new UDManipulator(CONSTANTS.BLOCK_LEN * 4, CONSTANTS.BLOCK_LEN * 7, asm, new InsertableToDirectOnRightSecondPosition(a1), 16, new DrawableManupulatorFlyweight(CONSTANTS.BLOCK_LEN * 2 / 16));
  }
  
  void redraw() {
    t2.drawParts();
    t4.drawParts();
    a2.drawParts();
    
    t4.update();
    a2.update();
    m.update();
    asm.update();
    md.update();
    
    t2.drawItems();
    t4.drawItems();
    a2.drawItems();
    asm.draw();
    m.draw();
    md.draw();
  }
  
}
