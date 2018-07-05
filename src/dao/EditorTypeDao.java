package dao;

import model.EditorType;

public class EditorTypeDao extends Dao {
    protected static String table = "editor_type";
    protected static Class class_type = EditorType.class;

    public EditorTypeDao() {
        super(table, class_type);
    }
}
