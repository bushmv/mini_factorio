class Test implements Instance {
 
  public void run() {
    noLoop();
    // unit tests for DirectTransporterPart
    println(" --- unit tests for DirectTransporterPart --- \n");
    itemsShouldMoveFromEndToStartOnDirectTransporterPart();
    emptyDirectTransporterPartShouldRemainEmpty();
    fulledDirectTransporterPartShouldRemainFulled();
    halfFulledDirectTransporterPartShouldMoveItems();
    directTransporterPartShouldMoveItemsToNextTransporterPart();
    onlyLeftFulledDirectTransporterPartShouldMoveItems();
    onlyRightFulledDirectTransporterPartShouldMoveItems();
    
    // unit tests for ClockWiseAngleTransporterPart
    println("\n\n\n --- unit tests for ClockWiseAngleTransporterPart ---");
    itemsShouldMoveFromStartToEndOnClockWiseAngleTransporterPart();
    emptyClockWiseTransporterPartShouldRemainEmpty();
    fulledClockWiseTransporterShouldRemainFull();
    halfFulledClockWiseTransporterPartShouldMoveItems();
    ClockWisetransporterPartShouldMoveItemsToNextClockWiseTransporterPart();
    onlyLeftFulledClockWiseTransporterPartShouldMoveItems();
    onlyRightFulledClockWiseTransporterPartShouldMoveItems();
    
    // unit tests for AntiClockWiseAngleTransporterPart
    println("\n\n\n --- unit tests for AntiClockWiseAngleTransporterPart ---");
    itemsShouldMoveFromStartToEndOnAntiClockWiseAngleTransporterPart();
    emptyAntyClockWiseTransporterPartShouldRemainEmpty();
    fulledAntyClockWiseTransporterShouldRemainFull();
    halfFulledAntyClockWiseTransporterPartShouldMoveItems();
    AntiClockWiseTransporterPartShouldMoveItemsToNextAntiClockWiseTransporterPart();
    onlyLeftFulledAntiClockWiseTransporterPartShouldMoveItems();
    onlyRightFulledAntiClockWiseTransporterPartShouldMoveItems();
    
    //unit tests for transporter parts combination
    println("\n\n\n --- unit tests for transporter parts combination ---");
    ClockwiseAnticlockwiseDirectTransporterParts();
    
    
  }
  
  
  
  
 
  private void itemsShouldMoveFromEndToStartOnDirectTransporterPart() {
   TransporterPart tp = new TestDirectTransporterPart(null, -2147450880, (byte) 1); 
   tp.leftRes = 16777216; tp.rightRes = 16777216;
   
   for (int i = 0; i < 8 * 3; i++) { 
       tp.update();
   }
   
   println("\t itemsShouldMoveFromEndToStartOnDirectTransporterPart test:");
   if (tp.state != 524296) throw new RuntimeException("test  failed, tp.state = " + tp.state + ", but must be 524296");
   else if (tp.leftRes != 1) throw new RuntimeException("test  failed, tp.leftRes = " + tp.leftRes + ", but must be 1");
   else if (tp.rightRes != 1) throw new RuntimeException("test  failed, tp.rightRes = " + tp.rightRes + ", but must be 1");
   else System.out.println(" + test successfull passed");
  }
  
  private void emptyDirectTransporterPartShouldRemainEmpty() {
    TransporterPart tp = new TestDirectTransporterPart(null, 0, (byte) 1); 
    
    for (int i = 0; i < 8 * 3; i++) { 
       tp.update();
    }
    
    println("\t emptyTransporterPartShouldRemainEmpty test:");
    if (tp.state != 0) throw new RuntimeException("test failed, tp.state = " + tp.state + ", but must be 0");
    else if (tp.leftRes != 0) throw new RuntimeException("test failed, tp.leftRes = " + tp.leftRes + ", but must be 0");
    else if (tp.rightRes != 0) throw new RuntimeException("test failed, tp.rightRes = " + tp.rightRes + ", but must be 0");
    else System.out.println(" + test successfull passed");
  }
  
  private void fulledDirectTransporterPartShouldRemainFulled() {
    TransporterPart tp = new TestDirectTransporterPart(null, -2004318072, (byte) 1);
    tp.leftRes = 16843009; tp.rightRes = 16843009;
    
    for (int i = 0; i < 8 * 3; i++) { 
       tp.update();
    }
    
    println("\t fulledDirectTransporterPartShouldRemainFulled test:");
    if (tp.state != -2004318072) throw new RuntimeException("test failed, tp.state = " + tp.state + ", but must be -2004318079");
    else if (tp.leftRes != 16843009) throw new RuntimeException("test failed, tp.leftRes = " + tp.leftRes + ", but must be 16843009");
    else if (tp.rightRes != 16843009) throw new RuntimeException("test failed, tp.rightRes = " + tp.rightRes + ", but must be 16843009");
    else System.out.println(" + test successfull passed");
  }
  
  private void halfFulledDirectTransporterPartShouldMoveItems() {
    TransporterPart tp = new TestDirectTransporterPart(null, -2013231104, (byte) 1);
    tp.leftRes = 16842752; tp.rightRes = 16842752;
    
    for (int i = 0; i < 8 * 3; i++) { 
       tp.update();
    }
    
    println("\t halfFulledDirectTransporterPartShouldMoveItems test:");
    if (tp.state != 8913032) throw new RuntimeException("test failed, tp.state = " + tp.state + ", but must be 8913032");
    else if (tp.leftRes != 257) throw new RuntimeException("test failed, tp.leftRes = " + tp.leftRes + ", but must be 257");
    else if (tp.rightRes != 257) throw new RuntimeException("test failed, tp.rightRes = " + tp.rightRes + ", but must be 257");
    else System.out.println(" + test successfull passed");
  }
  
  private void directTransporterPartShouldMoveItemsToNextTransporterPart() {
    TransporterPart first = new TestDirectTransporterPart(null, 134250496, (byte) 1);
    first.leftRes = 16777216; first.rightRes = 131072;
    TransporterPart second = new TestDirectTransporterPart(first, -2147481600, (byte) 1);
    second.leftRes = 196608; second.rightRes = 67108864;
    
    for (int i = 0; i < 8 * 3 * 2; i++) {
       second.update();
    }

    println("\t directTransporterPartShouldMoveItemsToNextTransporterPart test:");
    if (second.state != 8913032) throw new RuntimeException("test failed, second.state = " + second.state + ", but must be 8913032");
    else if (first.state != 0) throw new RuntimeException("test failed, first.state = " + first.state + ", but must be 0");
    else if (second.leftRes != 259) throw new RuntimeException("test failed, second.leftRes = " + second.leftRes + ", but must be 259");
    else if (second.rightRes != 516) throw new RuntimeException("test failed, second.rightRes = " + second.rightRes + ", but must be 516");
    else if (first.leftRes != 0) throw new RuntimeException("test failed, first.leftRes = " + first.leftRes + ", but must be 0");
    else if (first.rightRes != 0) throw new RuntimeException("test failed, first.rightRes = " + first.rightRes + ", but must be 0");
    else System.out.println(" + test successfull passed");
  }
  
  private void onlyLeftFulledDirectTransporterPartShouldMoveItems() {
    TransporterPart first = new TestDirectTransporterPart(null, 34952, (byte) 1);
    first.leftRes = 16909060; first.rightRes = 0;
    TransporterPart second = new TestDirectTransporterPart(first, 0, (byte) 1);
    second.leftRes = 0; second.rightRes = 0;
    
    for (int i = 0; i < 8 * 3 * 2; i++) {
       second.update();
    }
    
    println("\t onlyLeftFulledDirectTransporterPartShouldMoveItems test:");
    if (second.state != 34952) throw new RuntimeException("test failed, second.state = " + second.state + ", but must be 34952");
    else if (first.state != 0) throw new RuntimeException("test failed, first.state = " + first.state + ", but must be 0");
    else if (second.leftRes != 16909060) throw new RuntimeException("test failed, second.leftRes = " + second.leftRes + ", but must be 16909060");
    else if (second.rightRes != 0) throw new RuntimeException("test failed, second.rightRes = " + second.rightRes + ", but must be 0");
    else if (first.leftRes != 0) throw new RuntimeException("test failed, first.leftRes = " + first.leftRes + ", but must be 0");
    else if (first.rightRes != 0) throw new RuntimeException("test failed, first.rightRes = " + first.rightRes + ", but must be 0");
    else System.out.println(" + test successfull passed");
  }
  
  private void onlyRightFulledDirectTransporterPartShouldMoveItems() {
    TransporterPart first = new TestDirectTransporterPart(null, -2004353024, (byte) 1);
    first.leftRes = 0; first.rightRes = 16909060;
    TransporterPart second = new TestDirectTransporterPart(first, 0, (byte) 1);
    second.leftRes = 0; second.rightRes = 0;
    
    for (int i = 0; i < 8 * 3 * 2; i++) { 
       second.update();
    }
    
    println("\t onlyRightFulledDirectTransporterPartShouldMoveItems test:");
    if (second.state != -2004353024) throw new RuntimeException("test failed, second.state = " + second.state + ", but must be -2004353024");
    else if (first.state != 0) throw new RuntimeException("test failed, first.state = " + first.state + ", but must be 0");
    else if (second.leftRes != 0) throw new RuntimeException("test failed, second.leftRes = " + second.leftRes + ", but must be 0");
    else if (second.rightRes != 16909060) throw new RuntimeException("test failed, second.rightRes = " + second.rightRes + ", but must be 16909060");
    else if (first.leftRes != 0) throw new RuntimeException("test failed, first.leftRes = " + first.leftRes + ", but must be 0");
    else if (first.rightRes != 0) throw new RuntimeException("test failed, first.rightRes = " + first.rightRes + ", but must be 0");
    else System.out.println(" + test successfull passed");
  }
  
  
  
  
  
  private void itemsShouldMoveFromStartToEndOnClockWiseAngleTransporterPart() {
    TransporterPart tp = new TestClockWiseAngleTransporterPart(null, -2146959360, (byte) 1);
    tp.rightRes = 16777217;
    
    for (int i = 0; i < 8 * 4; i++) { 
       tp.update();
    }
   
    println("\t itemsShouldMoveFromStartToEndOnClockWiseAngleTransporterPart test:");
    if (tp.state != 8388616) throw new RuntimeException("test failed, tp.state = " + tp.state + ", but must be 8388616");
    else if (tp.leftRes != 1) throw new RuntimeException("test failed, tp.leftRes = " + tp.leftRes + ", but must be 1");
    else if (tp.rightRes != 256) throw new RuntimeException("test failed, tp.rightRes = " + tp.rightRes + ", but must be 256");
    else System.out.println(" + test successfull passed");
  }
  
  private void emptyClockWiseTransporterPartShouldRemainEmpty() {
    TransporterPart tp = new TestClockWiseAngleTransporterPart(null, 0, (byte) 1);
    
    for (int i = 0; i < 8 * 4; i++) { 
       tp.update();
    }
   
    println("\t emptyClockWiseTransporterPartShouldRemainEmpty test:");
    if (tp.state != 0) throw new RuntimeException("test failed, tp.state = " + tp.state + ", but must be 0");
    else if (tp.leftRes != 0) throw new RuntimeException("test failed, tp.leftRes = " + tp.leftRes + ", but must be 0");
    else if (tp.rightRes != 0) throw new RuntimeException("test failed, tp.rightRes = " + tp.rightRes + ", but must be 0");
    else System.out.println(" + test successfull passed");
  }
  
  private void fulledClockWiseTransporterShouldRemainFull() {
    TransporterPart tp = new TestClockWiseAngleTransporterPart(null, -2004318072, (byte) 1);
    tp.leftRes = 16843009; tp.rightRes = 33686017;
    
    for (int i = 0; i < 8 * 4; i++) {
       tp.update();
    }
   
    println("\t fulledClockWiseTransporterShouldRemainFull test:");
    if (tp.state != -2004318072) throw new RuntimeException("test failed, tp.state = " + tp.state + ", but must be -2004318072");
    else if (tp.leftRes != 16843009) throw new RuntimeException("test failed, tp.leftRes = " + tp.leftRes + ", but must be 16843009");
    else if (tp.rightRes != 33686017) throw new RuntimeException("test failed, tp.rightRes = " + tp.rightRes + ", but must be 33686017");
    else System.out.println(" + test successfull passed");
  }
  
  private void halfFulledClockWiseTransporterPartShouldMoveItems() {
    TransporterPart tp = new TestClockWiseAngleTransporterPart(null, 134744072, (byte) 1);
    tp.leftRes = 65537; tp.rightRes = 131073;
    
    for (int i = 0; i < 8 * 4; i++) { 
       tp.update();
    }
   
    println("\t halfFulledClockWiseTransporterPartShouldMoveItems test:");
    if (tp.state != 8390792) throw new RuntimeException("test failed, tp.state = " + tp.state + ", but must be 8390792");
    else if (tp.leftRes != 65793) throw new RuntimeException("test failed, tp.leftRes = " + tp.leftRes + ", but must be 65793");
    else if (tp.rightRes != 512) throw new RuntimeException("test failed, tp.rightRes = " + tp.rightRes + ", but must be 512");
    else System.out.println(" + test successfull passed");
  }
  
  private void ClockWisetransporterPartShouldMoveItemsToNextClockWiseTransporterPart() {
    TransporterPart first = new TestClockWiseAngleTransporterPart(null, 134742016, (byte) 1);
    first.leftRes = 0; first.rightRes = 131073;
    TransporterPart second = new TestClockWiseAngleTransporterPart(first, -2147450880, (byte) 1);
    second.leftRes = 50331648; second.rightRes = 67108864;
    
    for (int i = 0; i < 8 * 5 * 2; i++) { 
       second.update();
    }

    println("\t ClockWisetransporterPartShouldMoveItemsToNextClockWiseTransporterPart test:");
    if (second.state != 142606472) throw new RuntimeException("test failed, second.state = " + second.state + ", but must be 142606472");
    else if (first.state != 0) throw new RuntimeException("test failed, first.state = " + first.state + ", but must be 0");
    else if (second.leftRes != 259) throw new RuntimeException("test failed, second.leftRes = " + second.leftRes + ", but must be 259");
    else if (second.rightRes != 132096) throw new RuntimeException("test failed, second.rightRes = " + second.rightRes + ", but must be 132096");
    else if (first.leftRes != 0) throw new RuntimeException("test failed, first.leftRes = " + first.leftRes + ", but must be 0");
    else if (first.rightRes != 0) throw new RuntimeException("test failed, first.rightRes = " + first.rightRes + ", but must be 0");
    else System.out.println(" + test successfull passed");
  }
  
  private void onlyLeftFulledClockWiseTransporterPartShouldMoveItems() {
    TransporterPart first = new TestClockWiseAngleTransporterPart(null, 559240, (byte) 1);
    first.leftRes = 67305985; first.rightRes = 5;
    TransporterPart second = new TestClockWiseAngleTransporterPart(first, 0, (byte) 1);
    second.leftRes = 0; second.rightRes = 0;
    
    for (int i = 0; i < 8 * 4 * 2; i++) { 
       second.update();
    }
    
    println("\t onlyLeftFulledClockWiseTransporterPartShouldMoveItems test:");
    if (second.state != 559240) throw new RuntimeException("test failed, second.state = " + second.state + ", but must be 559240");
    else if (first.state != 0) throw new RuntimeException("test failed, first.state = " + first.state + ", but must be 0");
    else if (second.leftRes != 67305985) throw new RuntimeException("test failed, second.leftRes = " + second.leftRes + ", but must be 67305985");
    else if (second.rightRes != 5) throw new RuntimeException("test failed, second.rightRes = " + second.rightRes + ", but must be 5");
    else if (first.leftRes != 0) throw new RuntimeException("test failed, first.leftRes = " + first.leftRes + ", but must be 0");
    else if (first.rightRes != 0) throw new RuntimeException("test failed, first.rightRes = " + first.rightRes + ", but must be 0");
    else System.out.println(" + test successfull passed");
  
  }
  
  private void onlyRightFulledClockWiseTransporterPartShouldMoveItems() {
    TransporterPart first = new TestClockWiseAngleTransporterPart(null, -2004877312, (byte) 1);
    first.leftRes = 0; first.rightRes = 50462976;
    TransporterPart second = new TestClockWiseAngleTransporterPart(first, 0, (byte) 1);
    second.leftRes = 0; second.rightRes = 0;
    
    for (int i = 0; i < 8 * 3 * 2; i++) { 
       second.update();
    }
    
    println("\t onlyRightFulledClockWiseTransporterPartShouldMoveItems test:");
    if (second.state != -2004877312) throw new RuntimeException("test failed, second.state = " + second.state + ", but must be -2004877312");
    else if (first.state != 0) throw new RuntimeException("test failed, first.state = " + first.state + ", but must be 0");
    else if (second.leftRes != 0) throw new RuntimeException("test failed, second.leftRes = " + second.leftRes + ", but must be 0");
    else if (second.rightRes != 50462976) throw new RuntimeException("test failed, second.rightRes = " + second.rightRes + ", but must be 50462976");
    else if (first.leftRes != 0) throw new RuntimeException("test failed, first.leftRes = " + first.leftRes + ", but must be 0");
    else if (first.rightRes != 0) throw new RuntimeException("test failed, first.rightRes = " + first.rightRes + ", but must be 0");
    else System.out.println(" + test successfull passed");
  
  }
  
  
  
  
  
  private void itemsShouldMoveFromStartToEndOnAntiClockWiseAngleTransporterPart() {
    TransporterPart tp = new TestAntiClockWiseAngleTransporterPart(null, -2147481600, (byte) 1);
    tp.leftRes = 65536; tp.rightRes = 33554432;
    
    for (int i = 0; i < 8 * 4; i++) { 
       tp.update();
    }
    
    println("\t itemsShouldMoveFromStartToEndOnAntiClockWiseAngleTransporterPart test:");
    if (tp.state != 32776) throw new RuntimeException("test failed, tp.state = " + tp.state + ", but must be 32 776");
    else if (tp.leftRes != 33554433) throw new RuntimeException("test failed, tp.leftRes = " + tp.leftRes + ", but must be 33554433");
    else if (tp.rightRes != 0) throw new RuntimeException("test failed, tp.rightRes = " + tp.rightRes + ", but must be 0");
    else System.out.println(" + test successfull passed");
  }
 
 private void emptyAntyClockWiseTransporterPartShouldRemainEmpty() {
    TransporterPart tp = new TestAntiClockWiseAngleTransporterPart(null, 0, (byte) 1);
    
    for (int i = 0; i < 8 * 4; i++) {
       tp.update();
    }
    
    println("\t emptyAntyClockWiseTransporterPartShouldRemainEmpty test:");
    if (tp.state != 0) throw new RuntimeException("test failed, tp.state = " + tp.state + ", but must be 0");
    else if (tp.leftRes != 0) throw new RuntimeException("test failed, tp.leftRes = " + tp.leftRes + ", but must be 0");
    else if (tp.rightRes != 0) throw new RuntimeException("test failed, tp.rightRes = " + tp.rightRes + ", but must be 0");
    else System.out.println(" + test successfull passed");
  }
  
  private void fulledAntyClockWiseTransporterShouldRemainFull() {
    TransporterPart tp = new TestAntiClockWiseAngleTransporterPart(null, -2004318072, (byte) 1);
    tp.leftRes = 33620225; tp.rightRes = 33686018;
    
    for (int i = 0; i < 8 * 4; i++) { 
       tp.update();
    }
   
    println("\t fulledAntyClockWiseTransporterShouldRemainFull test:");
    if (tp.state != -2004318072) throw new RuntimeException("test failed, tp.state = " + tp.state + ", but must be -2004318072");
    else if (tp.leftRes != 33620225) throw new RuntimeException("test failed, tp.leftRes = " + tp.leftRes + ", but must be 33620225");
    else if (tp.rightRes != 33686018) throw new RuntimeException("test failed, tp.rightRes = " + tp.rightRes + ", but must be 33686018");
    else System.out.println(" + test successfull passed");
  }
  
  private void halfFulledAntyClockWiseTransporterPartShouldMoveItems() {
    TransporterPart tp = new TestAntiClockWiseAngleTransporterPart(null, 134744072, (byte) 1);
    tp.leftRes = 65537; tp.rightRes = 131074;
    
    for (int i = 0; i < 8 * 5; i++) { 
       tp.update();
    }
   
    println("\t halfFulledAntyClockWiseTransporterPartShouldMoveItems test:");
    if (tp.state != 557192) throw new RuntimeException("test failed, tp.state = " + tp.state + ", but must be 557192");
    else if (tp.leftRes != 33554689) throw new RuntimeException("test failed, tp.leftRes = " + tp.leftRes + ", but must be 33554689");
    else if (tp.rightRes != 2) throw new RuntimeException("test failed, tp.rightRes = " + tp.rightRes + ", but must be 2");
    else System.out.println(" + test successfull passed");
  }
  
  private void AntiClockWiseTransporterPartShouldMoveItemsToNextAntiClockWiseTransporterPart() {
    TransporterPart first = new TestAntiClockWiseAngleTransporterPart(null, -2147481600, (byte) 1);
    first.leftRes = 65536; first.rightRes = 16777216;
    TransporterPart second = new TestAntiClockWiseAngleTransporterPart(first, 8390656, (byte) 1);
    second.leftRes = 131072; second.rightRes = 512;
    
    for (int i = 0; i < 8 * 5 * 2; i++) { 
       second.update();
    }
    
    println("\t AntiClockWiseTransporterPartShouldMoveItemsToNextAntiClockWiseTransporterPart test:");
    if (second.state != 557192) throw new RuntimeException("test failed, second.state = " + second.state + ", but must be 557192");
    else if (first.state != 0) throw new RuntimeException("test failed, first.state = " + first.state + ", but must be 0");
    else if (second.leftRes != 33554690) throw new RuntimeException("test failed, second.leftRes = " + second.leftRes + ", but must be 33554690");
    else if (second.rightRes != 1) throw new RuntimeException("test failed, second.rightRes = " + second.rightRes + ", but must be 1");
    else if (first.leftRes != 0) throw new RuntimeException("test failed, first.leftRes = " + first.leftRes + ", but must be 0");
    else if (first.rightRes != 0) throw new RuntimeException("test failed, first.rightRes = " + first.rightRes + ", but must be 0");
    else System.out.println(" + test successfull passed");
  }
  
  private void onlyLeftFulledAntiClockWiseTransporterPartShouldMoveItems() {
    TransporterPart first = new TestAntiClockWiseAngleTransporterPart(null, 2184, (byte) 1);
    first.leftRes = 197121; first.rightRes = 0;
    TransporterPart second = new TestAntiClockWiseAngleTransporterPart(first, 0, (byte) 1);
    second.leftRes = 0; second.rightRes = 0;
    
    for (int i = 0; i < 8 * 4 * 2; i++) { 
       second.update();
    }
    
    println("\t onlyLeftFulledAntiClockWiseTransporterPartShouldMoveItems test:");
    if (second.state != 2184) throw new RuntimeException("test failed, second.state = " + second.state + ", but must be 2184");
    else if (first.state != 0) throw new RuntimeException("test failed, first.state = " + first.state + ", but must be 0");
    else if (second.leftRes != 197121) throw new RuntimeException("test failed, second.leftRes = " + second.leftRes + ", but must be 197121");
    else if (second.rightRes != 0) throw new RuntimeException("test failed, second.rightRes = " + second.rightRes + ", but must be 0");
    else if (first.leftRes != 0) throw new RuntimeException("test failed, first.leftRes = " + first.leftRes + ", but must be 0");
    else if (first.rightRes != 0) throw new RuntimeException("test failed, first.rightRes = " + first.rightRes + ", but must be 0");
    else System.out.println(" + test successfull passed");
  
  }
  
  private void onlyRightFulledAntiClockWiseTransporterPartShouldMoveItems() {
    TransporterPart first = new TestAntiClockWiseAngleTransporterPart(null, -2004320256, (byte) 1);
    first.leftRes = 16777216; first.rightRes = 84148994;
    TransporterPart second = new TestAntiClockWiseAngleTransporterPart(first, 0, (byte) 1);
    second.leftRes = 0; second.rightRes = 0;
    
    for (int i = 0; i < 8 * 5 * 2; i++) {
       second.update();
    }
    
    println("\t onlyRightFulledAntiClockWiseTransporterPartShouldMoveItems test:");
    if (second.state != -2004320256) throw new RuntimeException("test failed, second.state = " + second.state + ", but must be -2004320256");
    else if (first.state != 0) throw new RuntimeException("test failed, first.state = " + first.state + ", but must be 0");
    else if (second.leftRes != 16777216) throw new RuntimeException("test failed, second.leftRes = " + second.leftRes + ", but must be 16777216");
    else if (second.rightRes != 84148994) throw new RuntimeException("test failed, second.rightRes = " + second.rightRes + ", but must be 84148994");
    else if (first.leftRes != 0) throw new RuntimeException("test failed, first.leftRes = " + first.leftRes + ", but must be 0");
    else if (first.rightRes != 0) throw new RuntimeException("test failed, first.rightRes = " + first.rightRes + ", but must be 0");
    else System.out.println(" + test successfull passed");
  
  }
  
  
  
  
  private void ClockwiseAnticlockwiseDirectTransporterParts() {
    TransporterPart first = new TestClockWiseAngleTransporterPart(null, 557056, (byte) 1);
    first.leftRes = 33554432; first.rightRes = 1;
    TransporterPart second = new TestAntiClockWiseAngleTransporterPart(first, -2013265920, (byte) 1);
    second.leftRes = 0; second.rightRes = 16908288;
    TransporterPart third = new TestDirectTransporterPart(second, 0, (byte) 1);
    third.leftRes = 0; third.rightRes = 0;

    for (int i = 0; i < 8 * 5 * 3; i++) {
       third.update();
    }
    
    println("\t ClockwiseAnticlockwiseDirectTransporterParts test:");
    if (third.state != 8913032) throw new RuntimeException("testfailed, third.state = " + third.state + ", but must be 8913032");
    else if (third.leftRes != 258) throw new RuntimeException("test failed, third.leftRes = " + third.leftRes + ", but must be 258");
    else if (third.rightRes != 258) throw new RuntimeException("test failed, third.rightRes = " + third.rightRes + ", but must be 258");
    else System.out.println(" + test successfull passed");
  }
  
}

class TestDirectTransporterPart extends DirectTransporterPart {
  
  public TestDirectTransporterPart(TransporterPart previous, int state, byte speed) {
    super(0, 0, previous, state, speed, null); 
  }
  
  // empty, don't need draw when test
  public void drawCurrentItems() {}
  public void drawCurrentPart() {}
  
}

class TestClockWiseAngleTransporterPart extends ClockWiseAngleTransporterPart {
  public TestClockWiseAngleTransporterPart(TransporterPart previous, int state, byte speed) {
    super(0, 0, previous, state, speed, null); 
  }
  
  // empty, don't need draw when test
  public void drawCurrentItems() {}
  public void drawCurrentPart() {}
}

class TestAntiClockWiseAngleTransporterPart extends AntiClockWiseAngleTransporterPart {
  public TestAntiClockWiseAngleTransporterPart(TransporterPart previous, int state, byte speed) {
    super(0, 0, previous, state, speed, null); 
  }
  
  // empty, don't need draw when test
  public void drawCurrentItems() {}
  public void drawCurrentPart() {}
}
