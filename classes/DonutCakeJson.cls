public with sharing class DonutCakeJson {
    
    public static void jsonConverter(){
        String jsonString=		'{'+
		'   "id":"0001",'+
		'   "type":"donut",'+
		'   "name":"Cake",'+
		'   "image":{'+
		'      "url":"images/0001.jpg",'+
		'      "width":200,'+
		'      "height":200'+
		'   },'+
		'   "thumbnail":{'+
		'      "url":"images/thumbnails/0001.jpg",'+
		'      "width":32,'+
		'      "height":32'+
		'   }'+
		'}';

        DonutCakeWrapper dt = (DonutCakeWrapper) JSON.deserialize(jsonString, DonutCakeWrapper.class);
        System.debug(dt);
    
        String x = JSON.serialize(dt);
        System.debug(x);
        
    }
}
