// The following short XML file called "mammals.xml" is parsed
// in the code below. It must be in the project's "data" folder.
//
// <?xml version="1.0"?>
// <mammals>
//   <animal id="0" species="Capra hircus">Goat</animal>
//   <animal id="1" species="Panthera pardus">Leopard</animal>
//   <animal id="2" species="Equus zebra">Zebra</animal>
// </mammals>

class test{
String key ="d296134b27215cc728104f660752f821";
XML xml = loadXML("https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=d296134b27215cc728104f660752f821&mode=xml");
XML latElement;
XML[] children = xml.getChildren("current");

  void draw()
  {
    for (int i = 0; i < children.length; i++) {
      latElement= children[i].getChild("weather");
       String weather = latElement.getString("value");
      println("weather ::::::: "+weather);
    }
  }
}
// Sketch prints:
// 0, Capra hircus, Goat
// 1, Panthera pardus, Leopard
// 2, Equus zebra, Zebra
