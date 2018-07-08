package dao;

import java.util.Iterator;
import java.util.List;


public class Result {

    public List<Object> getResult() {
        return result;
    }

    public void setResult(List<Object> result) {
        this.result = result;
    }

    private List<Object> result = null;
    private Class class_type;
    private String sql;

    private static DataBaseConnect db = new DataBaseConnect();

    public Result(List<Object> result, Class class_type, String sql) {
        this.result = result;
        this.class_type = class_type;
        this.sql = sql;
    }

    public Iterator all() {
        return result.iterator();
    }

    public Object first() {
        Iterator<Object> iter = this.result.iterator();
        return this.class_type.cast(iter.hasNext() ? iter.next() : null);
    }

    public Result filter(String column, String filter) {

        if (this.sql.isEmpty()) {
            try {
                throw new Exception("sql not define!");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if(sql.toUpperCase().contains("NEWS") && column.toUpperCase().equals("TYPE"))
            column = "NEWS_TYPE";
        String sql = String.format(this.sql + " and %s  %s ", column, filter);
        return new Result(db.query_filter(sql, this.class_type.getName()), this.class_type, this.sql);
    }
}
