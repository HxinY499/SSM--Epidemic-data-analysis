package edu.imu.mapreduce.mr;

import lombok.extern.slf4j.Slf4j;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

import java.io.IOException;
import java.util.*;

@Slf4j
public class m_maxDayReducer extends Reducer<Text, Text, Text, Text> {
    Map<String, Integer> map = new TreeMap<String, Integer>();
    private final static int N = 1000;
    @Override
    protected void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
        //key:data value:cases
        for(Text value : values){
            map.put(key.toString(),Integer.parseInt(value.toString()));
        }

    }

    @Override
    protected void cleanup(Context context) throws IOException, InterruptedException {
        List<Map.Entry<String,Integer>> list = new ArrayList<Map.Entry<String, Integer>>(map.entrySet());
        Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
        });
        while(list.size() > N){
            list.remove(0);
        }
        for(Map.Entry<String,Integer> mapping:list){
            context.write(new Text((String)mapping.getKey()),new Text(String.valueOf(mapping.getValue())));
        }
    }
}
