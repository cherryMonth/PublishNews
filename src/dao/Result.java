package dao;

import java.util.Iterator;
import java.util.List;


public class Result {

    private List<Object> result = null;
    private String class_type;
    private String sql;

    private static DataBaseConnect db = new DataBaseConnect();

    public Result(List<Object> result, String class_type, String sql) {
        this.result = result;
        this.class_type = class_type;
        this.sql = sql;
    }

    public Iterator<Object> all() {
        return this.result.iterator();
    }

    public Object first() {
        Iterator<Object> iter = this.result.iterator();
        return iter.hasNext() ? iter.next() : null;
    }

    public Result filter(String column, String filter) {

        if (this.sql.isEmpty()) {
            try {
                throw new Exception("sql not define!");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        String sql = String.format(this.sql + " and %s  %s ", column, filter);
        return new Result(db.query_filter(sql, this.class_type), this.class_type, this.sql);
    }


}
