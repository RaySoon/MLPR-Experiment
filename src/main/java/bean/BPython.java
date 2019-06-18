package bean;

import net.sf.json.JSONArray;
import org.apache.commons.io.FileUtils;

import java.io.*;

public class BPython {
    //修改路径即可读取JSON
    private static String rootPath = "E:\\MLPR-Experiment";
    private static String jsonFilePath = "\\python\\gbdt\\gbdt.json";
//    private static String batPath = "\\bats\\gbdt.bat";

    public static JSONArray JsonRead() {
        JSONArray aJsonObject = null;
        try {
            File file = new File(rootPath + jsonFilePath);
            if (!file.exists()) {
                return null;
            }
            String str = FileUtils.readFileToString(file, "UTF-8");
            aJsonObject = JSONArray.fromObject(str);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return aJsonObject;
    }

//    public static JSONArray myrun() {
//        Process proc;
//        try {
//            proc = Runtime.getRuntime().exec(rootPath + batPath);
//            proc.waitFor();
//        } catch (IOException | InterruptedException e) {
//            e.printStackTrace();
//        }
//        System.out.println("END！");
//        try {
//            JSONArray aJsonObject = JsonRead();
//            if (aJsonObject == null) {
//                return JSONArray.fromObject("ERROR!");
//            }
//            return aJsonObject;
//            // 完成后关闭
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return JSONArray.fromObject("ERROR!");
//    }
public static JSONArray myrun() {
//    Process proc;
//    try {
//        proc = Runtime.getRuntime().exec(rootPath + batPath);
//        proc.waitFor();
//    } catch (IOException | InterruptedException e) {
//        e.printStackTrace();
//    }
//    System.out.println("END！");
    try {
        JSONArray aJsonObject = JsonRead();
        if (aJsonObject == null) {
            return JSONArray.fromObject("ERROR!");
        }
        return aJsonObject;
        // 完成后关闭
    } catch (Exception e) {
        e.printStackTrace();
    }
    return JSONArray.fromObject("ERROR!");
}

}

