package edu.imu.mapreduce.mr;

import lombok.extern.slf4j.Slf4j;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import java.io.IOException;

import java.util.HashMap;
import java.util.Map;
@Slf4j
public class m_avgMapper extends Mapper<LongWritable, Text, Text, Text> {

    //Map<String, Integer> map = new HashMap <String, Integer>();
    //Map<String, Integer> daySumMap = new HashMap <String, Integer>();

    protected void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
        String data = value.toString();
        String []str = data.split(",");
        str[0]=str[0].substring(0,str[0].lastIndexOf("-"));
        //Date_reported, Country, New_cases, Cumulative_cases, New_deaths, Cumulative_deaths
        if(str[1].equals("China")){
            context.write(new Text(str[0]),new Text(String.valueOf(str[2])));
            /*
            if(map.containsKey(str[0])){
                map.put(str[0],map.get(str[0])+Integer.parseInt(str[2]));
                daySumMap.put(str[0],daySumMap.get(str[0])+1);
            }
            else
            {
                map.put(str[0],Integer.parseInt(str[2]));
                daySumMap.put(str[0],1);
            }
            */
        }

    }
/*
    protected void cleanup(Context context) throws IOException, InterruptedException {
        for(String key : map.keySet()){
            int avgDays=map.get(key)/daySumMap.get(key);
            log.info("mapper:key:" + key + ";value:" + avgDays);
            context.write(new Text(key),new Text(String.valueOf(avgDays)));
        }
    }
*/
}
