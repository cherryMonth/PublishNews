package dao;

import java.util.Iterator;
import java.util.List;


public class Result {

    private List<Object> result = null;

    private String table;
    private String class_type;

    private static DataBaseConnect db = new DataBaseConnect();

    public Result(List<Object> result, String table, String class_type) {
        this.result = result;
        this.table = table;
        this.class_type = class_type;
    }

    public Iterator<Object> all() {
        return this.result.iterator();
    }

    public Object first() {
        Iterator<Object> iter = this.result.iterator();
        return iter.next();
    }

    public Result filter(String column, String filter) {

        if (this.table.isEmpty()) {
            try {
                throw new Exception("Table name not define!");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        String sql = String.format("select * from %s where %s %s", this.table, column, filter);
        return new Result(db.query_filter(sql, this.class_type), this.table, this.class_type);
    }


}
