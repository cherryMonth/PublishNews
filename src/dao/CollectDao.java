package dao;

import model.Collect;

public class CollectDao extends Dao{

    protected static String table = "news";
    protected static String class_type = Collect.class.getName();

    public CollectDao() {
        super(table, class_type);
    }
}
