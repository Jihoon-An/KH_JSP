package commons;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {
    public static Timestamp stringToTimestamp(String dateString) {
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

    public static String timestampToString(Date time){
        String date = new SimpleDateFormat("yyyy년 MM월dd일").format(time);
        return date;
    }
}
