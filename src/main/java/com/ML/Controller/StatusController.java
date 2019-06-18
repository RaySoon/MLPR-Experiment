package com.ML.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.*;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import net.sf.json.JSONArray;
import org.apache.commons.io.FileUtils;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import bean.BPython;

@Controller
public class StatusController {

    @RequestMapping(value = "/home", method = {RequestMethod.GET})
    public String home() {
        return "home";
    }

    @RequestMapping(value = "/members", method = {RequestMethod.GET})
    public String members() {
        return "members";
    }

    @RequestMapping(value = "/tasks", method = {RequestMethod.GET})
    public String tasks() {
        return "tasks";
    }

    @RequestMapping(value = "/table", method = {RequestMethod.GET})
    public String table() {
        return "table";
    }

    @RequestMapping(value = "/fileUpload")
    public String fileUpload2(@RequestParam("file") CommonsMultipartFile file) throws IOException {
        long startTime = System.currentTimeMillis();
        System.out.println("fileName：" + file.getOriginalFilename());
        String path = "./" + file.getOriginalFilename();
        File newFile = new File(path);
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        file.transferTo(newFile);
        long endTime = System.currentTimeMillis();
        System.out.println("方法二的运行时间：" + String.valueOf(endTime - startTime) + "ms");
        JSONArray gbdt=BPython.myrun();
        System.out.println(gbdt);
        return "/table";
    }
}
