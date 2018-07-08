package dao;

import model.Collect;

public class CollectDao extends Dao{

    protected static String table = "collect";
    protected static Class class_type = Collect.class;

    public CollectDao() {
        super(table, class_type);
    }
}
