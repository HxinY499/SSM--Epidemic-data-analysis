package edu.imu.mapreduce.mr;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

import java.io.IOException;

public class m_avgReducer extends Reducer<Text, Text, Text, IntWritable> {
    protected void reduce(Text key, Iterable<Text> values,Context context) throws IOException, InterruptedException {
        double sumValue = 0;
        long numValue = 0;
        int avgValue = 0;
        for(Text value : values){
            String[] valueAll = value.toString().split(",");
            sumValue += Double.parseDouble(valueAll[0]);
            numValue += Integer.parseInt(valueAll[1]);
        }
        avgValue  = (int)(sumValue/numValue);
        context.write(key, new IntWritable(avgValue));
    }
}