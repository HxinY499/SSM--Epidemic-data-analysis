package edu.imu.mapreduce.mr;

import lombok.extern.slf4j.Slf4j;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
import  java.lang.Iterable;
import java.io.IOException;

@Slf4j
public class m_maxCountryCombiner extends Reducer<Text, Text, Text, Text> {
    protected void reduce(Text key, Iterable<Text> values,Context context) throws IOException, InterruptedException {
        int max = Integer.MIN_VALUE;
        String str="a";
        for(Text value : values){
            String t=value.toString().split(",")[1];
            int cases=Integer.MIN_VALUE;
            if(t!=null)
                cases=Integer.parseInt(t);
            if(cases >= max){
                str = value.toString();
                max = cases;
            }
        }
        context.write(key, new Text(str));
    }
}