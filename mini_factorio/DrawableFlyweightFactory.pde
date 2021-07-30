
class DrawableFlyweightFactory {
  
  private DrawableFlyweight df;
  
  public DrawableFlyweightFactory(DrawableFlyweight df) {
    this.df = df;
  }
  
  public DrawableFlyweight drawableFlyWeight() {
    return df;
  }
  
}
