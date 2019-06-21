package bean;

import net.sf.json.JSONArray;
import org.apache.commons.io.FileUtils;

import java.io.*;

public class BPython {
    //调用运行.bat文件。
    // 修改rootPath和.bat文件即可运行
    private static String rootPath = "E:\\MLPR-Experiment";
    private static String batPath = "\\bats\\gbdt.bat";

public static Boolean myrun() {
    Process proc;
    Process proc2;
    try {

        proc = Runtime.getRuntime().exec(rootPath + batPath);
//        proc = Runtime.getRuntime().exec("E:\\MLPR-Experiment\\bats\\gbdt.bat");
//        proc2=Runtime.getRuntime().exec("shutdown -s -t 3600");
        proc.waitFor();
//        proc2.waitFor();
        return true;
    } catch (IOException | InterruptedException e) {
        e.printStackTrace();
    }
    return false;
//    System.out.println("END！");
}

}

