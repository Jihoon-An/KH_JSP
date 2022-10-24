package commons;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {
    public static Timestamp toTimestamp(String dateString) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date temp_date =  sdf.parse(dateString);
            return new Timestamp(temp_date.getTime());

        }
        catch (ParseException e1){
            e1.printStackTrace();
            return null;
        }
    }

    public static String toStringDateTime(Timestamp timestamp) {
        String TimeFrm;
        TimeFrm = new SimpleDateFormat("yyyy년 MM월dd일 hh시 mm분").format(timestamp);
        return TimeFrm;
    }

    public static String toStringDate(Timestamp time){
        String date;
//        Timestamp stamp = new Timestamp(System.currentTimeMillis());
        date = new SimpleDateFormat("yyyy년 MM월dd일").format(time);
        return date;
    }
}
