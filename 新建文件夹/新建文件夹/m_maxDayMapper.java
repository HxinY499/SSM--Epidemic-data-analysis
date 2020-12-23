package edu.imu.mapreduce.mr;

import lombok.extern.slf4j.Slf4j;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import java.io.IOException;


import java.util.*;
import java.util.TreeMap;

@Slf4j
public class m_maxDayMapper extends Mapper<LongWritable, Text, Text ,Text> {

    TreeMap<String, Integer> treeMap = new TreeMap<String, Integer>();
    private final static int N = 1000;
    @Override
    protected void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
        String data = value.toString();
        String []str = data.split(",");
        //Date_reported, Country, New_cases, Cumulative_cases, New_deaths, Cumulative_deaths
        if(str[1].equals("China"))
            treeMap.put(str[0], Integer.parseInt(str[2]));

    }
    @Override
    protected void cleanup(Context context) throws IOException, InterruptedException {
        List<Map.Entry<String,Integer>> list = new ArrayList<Map.Entry<String, Integer>>(treeMap.entrySet());
        Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                return o1.getValue().compareTo(o2.getValue());
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
