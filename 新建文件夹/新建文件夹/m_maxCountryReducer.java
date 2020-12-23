package edu.imu.mapreduce.mr;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

import java.io.IOException;

public class m_maxCountryReducer extends Reducer<Text, Text, Text, Text> {
    protected void reduce(Text key, Iterable<Text> values,Context context) throws IOException, InterruptedException {
        int max = Integer.MIN_VALUE;
        String str=null;
        for(Text value : values){
            String t=value.toString().split(",")[1];
            int cases=Integer.MIN_VALUE;
            if(t!=null)
                cases=Integer.parseInt(value.toString().split(",")[1]);
            if(cases >= max){
                str = value.toString();
                max = cases;
            }
        }
        str = str.split(",")[0]+"\t"+str.split(",")[1];
        context.write(key, new Text(str));
    }
}