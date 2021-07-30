class AppFactory {
  
  Instance config(AppConfigType type) {
     if (type == AppConfigType.APP) {
        return new App();
     } else  if (type == AppConfigType.TEST) {
        return new Test();
     } else if (type == AppConfigType.DEMO) {
        return new Demo();
     } else {
       throw new RuntimeException("Illegal argument type: " + type);
     }
       
  }
}
  
  
