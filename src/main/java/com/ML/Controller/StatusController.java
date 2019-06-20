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

    @RequestMapping(value = "/gbm", method = {RequestMethod.GET})
    public String gbm() {
        return "LightGBM";
    }

    @RequestMapping(value = "/linear", method = {RequestMethod.GET})
    public String linear() {
        return "Linear";
    }

    @RequestMapping(value = "/gbdt", method = {RequestMethod.GET})
    public String gbdt() {
        return "GBDT";
    }

    @RequestMapping(value = "/rf", method = {RequestMethod.GET})
    public String rf() {
        return "RF";
    }

    @RequestMapping(value = "/tensorflow", method = {RequestMethod.GET})
    public String tensorflow() {
        return "tensorflow";
    }

//    @RequestMapping(value = "/tasks", method = {RequestMethod.GET})
//    public String tasks() {
//        return "tasks";
//    }
//
    @RequestMapping(value = "/table", method = {RequestMethod.GET})
    public String table() {
        return "table";
    }

    @RequestMapping(value = "/success", method = {RequestMethod.GET})
    public String success() {
        return "success";
    }

    @RequestMapping(value = "/fileUpload")
    public String fileUpload2(@RequestParam("file") CommonsMultipartFile file) throws IOException {
        long startTime = System.currentTimeMillis();
        System.out.println("fileName：" + file.getOriginalFilename());

//       写死上传到"E:\\data.txt"
        String path = "F:\\MLPR-Experiment\\python\\"+ file.getOriginalFilename();
        File newFile = new File(path);
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        file.transferTo(newFile);
        long endTime = System.currentTimeMillis();
        System.out.println("方法二的运行时间：" + String.valueOf(endTime - startTime) + "ms");
        if(BPython.myrun()){
            return "/success";
        }else {
            return "/error";
        }


    }
}
