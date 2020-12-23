package edu.imu.mapreduce.mr;

import lombok.extern.slf4j.Slf4j;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

import java.io.IOException;

@Slf4j
public class m_avgCombiner extends Reducer<Text, Text, Text, Text> {
    protected void reduce(Text key, Iterable<Text> values,Context context) throws IOException, InterruptedException {
        int sum = 0;
        int num = 0;
        for(Text value : values){
            sum += Integer.parseInt(value.toString());
            num ++;
        }
        context.write(key, new Text(String.valueOf(sum) + ',' + String.valueOf(num)));
    }
}