package dao;

import model.Browser;

public class BrowserDao extends Dao{

    protected static String table = "browser";
    protected static Class class_type = Browser.class;

    public BrowserDao() {
        super(table, class_type);
    }
}
