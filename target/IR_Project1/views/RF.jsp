<%--
  Created by IntelliJ IDEA.
  User: ryan_
  Date: 2019/6/14
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.math.BigDecimal" %>
<head>
    <!-- Standard Meta -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <!-- Site Properties -->
    <title>table</title>
    <link rel="stylesheet" type="text/css" href="../semantic/dist/semantic.css">

    <style type="text/css">

        .masthead .logo.item img {
            margin-right: 1em;
        }

        .masthead h2 {
            font-size: 1.7em;
            font-weight: normal;
        }

        .ui.vertical.stripe h3 {
            font-size: 2em;
        }

        .ui.vertical.stripe .button + h3,
        .ui.vertical.stripe p + h3 {
            margin-top: 3em;
        }

        .ui.vertical.stripe p {
            font-size: 1.33em;
        }

        .footer.segment {
            padding: 3em 0em;
        }


        @media only screen and (max-width: 700px) {
            .masthead h2 {
                margin-top: 0.5em;
                font-size: 1.5em;
            }
        }


    </style>

    <script src="/js/jQuery-3.3.1.js"></script>
    <script src="/semantic/dist/semantic.js"></script>
</head>
<body>

<div class="container">
    <div class="ui large top menu">
        <div class="ui container">
            <a class="item" href="/home">Home</a>
            <a class="item" href="/gbm">LightGBM</a>
            <a class="item" href="/gbdt">GBDT</a>
            <a class="active item" href="/rf">RF</a>
            <a class="item" href="/tensorflow">TensorFlow</a>
            <div class="right menu">
                <a class="item" href="/linear">Linear</a>
            </div>
        </div>
    </div>
</div>

<br>

<%!
    public static String readJsonFile(String fileName) {
        String jsonStr = "";
        try {
            File jsonFile = new File(fileName);
            FileReader fileReader = new FileReader(jsonFile);

            Reader reader = new InputStreamReader(new FileInputStream(jsonFile),"utf-8");
            int ch = 0;
            StringBuffer sb = new StringBuffer();
            while ((ch = reader.read()) != -1) {
                sb.append((char) ch);
            }
            fileReader.close();
            reader.close();
            jsonStr = sb.toString();
            return jsonStr;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

%>
<%

    try {
//        修改文件位置
        String jsonStr=readJsonFile("F:\\MLPR-Experiment\\python\\rf\\rf.json");
        JSONObject wholeJSON = new JSONObject(jsonStr);
        double mse=wholeJSON.getDouble("mse");
        //利用BigDecimal来实现四舍五入.保留一位小数
        mse = new BigDecimal(mse).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        double rmse=Math.sqrt(mse);
        double reshaped_rmse=new BigDecimal(rmse).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        JSONObject tableJson=wholeJSON.getJSONObject("table");
        int resultCount=tableJson.length();
        double predict,truth,deviation;
        JSONObject currentResult;

%>

<div class="header">
    <%
        for (int space = 0; space < 8; space++) {
    %>
    <div class="ui statistic">
        <div class="value" style="color: rgba(0,0,0,0)">
            000
        </div>
        <div class="label" style="color: rgba(0,0,0,0)">
            space
        </div>
    </div>
    <% }%>
    <div class="ui statistic">
        <div class="value">
            <%=reshaped_rmse%>
        </div>
        <div class="label">
            RMSE
        </div>
    </div>
</div>

<div class="main ui container">

    <table class="ui celled table">
        <thead>
        <tr><th>ground truth</th>
            <th>prediction</th>
            <th>deviation</th>
        </tr></thead>
        <tbody>

            <%for (int i = 0; i < resultCount; i++){%>
            <%  currentResult=tableJson.getJSONObject(String.valueOf(i));
                predict=currentResult.getDouble("predict");
                truth=currentResult.getDouble("test");
                deviation=Math.abs(predict-truth);
                if (deviation-rmse<-1){%>
            <tr class="positive">
            <%}else if (deviation-rmse<=1 && deviation-rmse>=-1){%>
            <tr>
                <%} else{%>
            <tr class="negative">
                <%}%>
            <td data-label="ground truth"><%=truth%></td>
            <td data-label="prediction"><%=predict%></td>
            <td data-label="deviation"><%=deviation%></td>
            </tr>
                <%}%>
                <%}catch (Exception e){%>
            <div class="value">
                hahaha
            </div>
    <%}%>

    </table>
</div>

<br><br><br><br><br>

<div class="pusher">
    <div class="ui inverted vertical footer segment">
        <div class="ui container">
            <div class="ui stackable inverted divided equal height stackable grid">
                <div class="five wide column">
                    <h4 class="ui inverted header">About</h4>
                    <div class="ui inverted link list">
                        <a href="/members" class="item">About Us</a>
                        <a href="http://miner.picp.net/members/Yan/teaching/IR2016Spring.html" class="item">About This
                            Course</a>
                        <a href="http://en.cufe.edu.cn/" class="item">About CUFE</a>
                    </div>
                </div>
                <%--<div class="seven wide column">--%>
                <%--<h4 class="ui inverted header">Source Code</h4>--%>
                <%--&lt;%&ndash;<a href="https://github.com/RaySoon/CUFE-Information-Retrieval-Course-Project-1" class="item">GitHub Link</a>&ndash;%&gt;--%>
                <%--</div>--%>
            </div>
        </div>
    </div>
</div>


</body>

