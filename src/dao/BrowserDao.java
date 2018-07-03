package dao;

import model.Browser;

public class BrowserDao extends Dao{

    protected static String table = "news";
    protected static String class_type = Browser.class.getName();

    public BrowserDao() {
        super(table, class_type);
    }
}
