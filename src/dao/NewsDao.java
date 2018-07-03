package dao;

import model.News;

public class NewsDao extends Dao {

    protected static String table = "news";
    protected static String class_type = News.class.getName();

    public NewsDao(){
        super(table, class_type);
    }

    public static void main(String [] args){
        NewsDao dao = new NewsDao();
        News n = new News();
        n.setContent("asd");
        n.setPublisher(0);
        n.setType(0);
        n.setTitle("第一篇文章");
        n.setViews(0);
        dao.add(n);
        n = (News)dao.filter("id", ">5").filter("id", "<10").first();
        System.out.println(n.getTitle());
    }

}
