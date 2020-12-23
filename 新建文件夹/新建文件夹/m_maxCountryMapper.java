package edu.imu.mapreduce.mr;

import lombok.extern.slf4j.Slf4j;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import java.io.IOException;


@Slf4j
public class m_maxCountryMapper extends Mapper<LongWritable, Text, Text ,Text> {

    @Override
    protected void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
        String data = value.toString();
        String []str = data.split(",");
        //Date_reported, Country, New_cases, Cumulative_cases, New_deaths, Cumulative_deaths
        String s = (str[1]+","+str[2]);
        if(str[0].equals("2020-3-10"))
            log.info("asd");
        if(str[1].equals("\"occupied Palestinian territory")) {
            context.write(new Text(str[0] + " " + str[1]), new Text(str[2] + "," + str[3]));
        }
        else
            context.write(new Text(str[0]),new Text(str[1]+","+str[2]));
    }
}
