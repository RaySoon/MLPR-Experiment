<%--
  Created by IntelliJ IDEA.
  User: ryan_
  Date: 2019/6/14
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
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
            <a class="item" href="/search">Search</a>
            <a class="active item" href="/tasks">Tasks</a>
            <div class="right menu">
                <a class="item" href="/members">Members</a>
            </div>
        </div>
    </div>
</div>

<br>

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
            0.55
<%--            <%=answerList.size()%>--%>
        </div>
        <div class="label">
            Results
        </div>
    </div>
</div>
<%
    int row=0;
    int col=0;
    try{
//    row=Integer.parseInt(request.getParameter("row"));
        row=10;
//        col=2;
//    col=Integer.parseInt(request.getParameter("column"));
    }catch(Exception ex){
        out.println("please input integer!");
        return;
    }
    int ground_truth=1;
    int predict=100;
%>
<div class="main ui container">

    <table class="ui celled table">
        <thead>
        <tr><th>ground truth</th>
            <th>prediction</th>
            <th>deviation</th>
        </tr></thead>
        <tbody>

            <%for(int i=0;i<row;i++){ %>
        <tr>
            <td data-label="ground truth"><%=ground_truth%></td>
            <td data-label="prediction"><%=predict%></td>
            <td data-label="deviation"><%=ground_truth-predict%></td>
        </tr>
            <%} %>

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

