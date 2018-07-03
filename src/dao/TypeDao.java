package dao;

import model.Type;

public class TypeDao extends Dao{

    protected static String table = "type";
    protected static String class_type = Type.class.getName();

    public TypeDao(){
        super(table, class_type);
    }

    public static void main(String []args){
        Type t = new Type();
        t.setType("编辑");
        TypeDao dao = new TypeDao();
        dao.add(t);
    }

}
