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
        File gbmJson=new File("E:\\MLPR-Experiment\\python\\lightGBM\\lightGBM.json");
        if(!gbmJson.exists()) {
            System.out.println("找不到，重新生成！");
            BPython.Run("lightGBM.bat");
        }
        return "LightGBM";
    }

    @RequestMapping(value = "/XGBoost", method = {RequestMethod.GET})
    public String linear() {
        File XGBoostJson=new File("E:\\MLPR-Experiment\\python\\XGBoost\\xgb.json");
        if(!XGBoostJson.exists()) {
            System.out.println("找不到，重新生成！");
            BPython.Run("xgboost.bat");
        }
        return "XGBoost";
    }

    @RequestMapping(value = "/gbdt", method = {RequestMethod.GET})
    public String gbdt() {
        File gbdtJson=new File("E:\\MLPR-Experiment\\python\\gbdt\\gbdt.json");
        if(!gbdtJson.exists()) {
            System.out.println("找不到，重新生成！");
            BPython.Run("gbdt.bat");
        }
        return "GBDT";
    }

    @RequestMapping(value = "/rf", method = {RequestMethod.GET})
    public String rf() {
        File rfJson=new File("E:\\MLPR-Experiment\\python\\rf\\rf.json");
        if(!rfJson.exists()) {
            System.out.println("找不到，重新生成！");
            BPython.Run("rf.bat");
        }
        return "RF";
    }

    @RequestMapping(value = "/tensorflow", method = {RequestMethod.GET})
    public String tensorflow() {
        return "tensorflow";
    }

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
        System.out.println("fileName：" + file.getOriginalFilename());
        String path="";
        if ("data.txt".equals( file.getOriginalFilename())){
            path = "E:\\data.txt";
        }else{
            path = "E:\\score.txt";
        }
        File newFile = new File(path);
        if(newFile.exists()){
            newFile.delete();
        }
        file.transferTo(newFile);
        return "/success";
    }
}
