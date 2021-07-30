
AppFactory appFactory;
Instance instance;

void setup() {
 size(800, 800);
 background(255);
 appFactory = new AppFactory();
 // chooce AppConfigType to get instance:
 // - APP - to start app
 // - TEST - to start unit tests
 // - DEMO - to start short sketches show part of app
 instance = appFactory.config(AppConfigType.APP);
 
}

void draw() {
 background(255); 
}
