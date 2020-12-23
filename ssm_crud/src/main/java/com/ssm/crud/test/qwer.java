package com.ssm.crud.test;
import com.github.pagehelper.PageInfo;
import com.ssm.crud.bean.Bar;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.util.StringUtils;
import org.springframework.web.context.WebApplicationContext;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import com.ssm.crud.bean.Bar;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath*:applicationContext.xml",
        "file:E:/IdeaProjects/ssm_crud/src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class qwer {


    @Test
    public void tool()  throws IOException {
        FileReader fileReader = new FileReader("D:/data/maxCountry.txt");
        BufferedReader bufferedReader = new BufferedReader(fileReader);
        String line = bufferedReader.readLine();
        Bar bar = new Bar();
        ArrayList<String> xList1 = new ArrayList<>();
        ArrayList<String> xList2 = new ArrayList<>();
        ArrayList<Integer> yList = new ArrayList<>();
        while (!StringUtils.isEmpty(line)) {
            String[] strs = line.split("\n");
            for (String str : strs) {
                String[] items = str.split("\t");
                xList1.add(items[0]);
                xList2.add(items[1]);
                System.out.println(str);
                yList.add(Integer.parseInt(items[2]));

            }
            line = bufferedReader.readLine();
        }
        System.out.println(xList1);
        System.out.println(xList2);
        System.out.println(yList);
    }
}
