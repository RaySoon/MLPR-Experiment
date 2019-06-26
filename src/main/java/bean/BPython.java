package bean;

import net.sf.json.JSONArray;
import org.apache.commons.io.FileUtils;

import java.io.*;

public class BPython {
    //调用运行.bat文件。
    // 修改rootPath和.bat文件即可运行
    private static String rootPath = "E:\\MLPR-Experiment\\bats\\";

    public static Boolean Run(String path) {
        Process proc;
        try {
            proc = Runtime.getRuntime().exec(rootPath + path);
            proc.waitFor();
            return true;
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        return false;
    }
}

