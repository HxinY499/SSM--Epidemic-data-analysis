package com.ssm.crud.controller;

import com.ssm.crud.bean.BarCountry;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import com.ssm.crud.bean.Bar;

@Controller
public class Show {

    @RequestMapping("/aaa")
    @ResponseBody
    public Bar maxDay() throws IOException {
        Bar bar = new Bar();
        bar = tool("maxDay.txt");
        return bar;
    }

    @RequestMapping("/bbb")
    @ResponseBody
    public Bar avg() throws IOException {
        Bar bar = new Bar();
        bar = tool("avg.txt");
        return bar;
    }

    @RequestMapping("/ccc")
    @ResponseBody
    public BarCountry maxCountry() throws IOException {
        FileReader fileReader = new FileReader("D:/data/maxCountry.txt");
        BufferedReader bufferedReader = new BufferedReader(fileReader);
        String line = bufferedReader.readLine();
        BarCountry bar = new BarCountry();
        ArrayList<String> xList1 = new ArrayList<>();
        ArrayList<String> xList2 = new ArrayList<>();
        ArrayList<Integer> yList = new ArrayList<>();
        while (!StringUtils.isEmpty(line)) {
            String[] strs = line.split("\n");
            for (String str : strs) {
                String[] items = str.split("\t");
                xList1.add(items[0]);
                xList2.add(items[1]);
                yList.add(Integer.parseInt(items[2]));
            }
            line = bufferedReader.readLine();
        }
        bar.setX1(xList1);
        bar.setX2(xList2);
        bar.setY(yList);
        return bar;
    }


    public Bar tool(String file)  throws IOException {
        FileReader fileReader = new FileReader("D:/data/"+file);
        BufferedReader bufferedReader = new BufferedReader(fileReader);
        String line = bufferedReader.readLine();
        Bar bar = new Bar();
        ArrayList<String> xList = new ArrayList<>();
        ArrayList<Integer> yList = new ArrayList<>();
        while (!StringUtils.isEmpty(line)) {
            String[] strs = line.split("\n");
            for (String str : strs) {
                String[] items = str.split("\t");
                xList.add(items[0]);
                yList.add(Integer.parseInt(items[1]));
            }
            line = bufferedReader.readLine();
        }
        bar.setX(xList);
        bar.setY(yList);
        return bar;
    }
}
