public with sharing class DonutCakeWrapper {
    
    public String id;
    public String type;
    public String name;
    public imagex image;
    public thumbnailx thumbnail;
    
    public class imagex{
        public String url;
        public Integer width;
        public Integer height;
    }
    
    public class thumbnailx{
        public String url;
        public Integer width;
        public Integer height;
    }
}
