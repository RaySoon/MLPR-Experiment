<%--
  Created by IntelliJ IDEA.
  User: alexsun
  Date: 2018/10/12
  Time: 上午12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.IR.Component.SearchFiles" %>
<%@page import="com.IR.Component.File" %>
<%--<%@ page import="org.apache.lucene.search.highlight.Scorer" %>--%>
<head>
    <!-- Standard Meta -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <!-- Site Properties -->
    <title>Answer</title>
    <link rel="stylesheet" type="text/css" href="/semantic/dist/semantic.css">

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

        .header {
            user-select: none;
        }

        @media only screen and (max-width: 700px) {

            .masthead h2 {
                margin-top: 0.5em;
                font-size: 1.5em;
            }
        }


    </style>

    <script src="/js/jQuery.min.js"></script>
    <script src="/semantic/dist/semantic.js"></script>

</head>
<body>
<%
    ArrayList<File> answerList = (ArrayList<File>) session.getAttribute("answerList");
%>

<div class="container">
    <div class="ui large top menu">
        <div class="ui container">
            <a class="item" href="/home">Home</a>
            <a class="item" href="/search">Search</a>
            <a class="item" href="/tasks">Tasks</a>
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
            <%=answerList.size()%>
        </div>
        <div class="label">
            Results
        </div>
    </div>
</div>


<br>
<%
    if (answerList.size() == 0 && (String) session.getAttribute("keyword") != null) {
%>
<br><br><br><br><br>
<div class="container">
    <div class="ui two column grid centered">
        <div class="text">
            There is no result for searching <%=(String) session.getAttribute("keyword")%>.
        </div>
    </div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<% }%>


<%
    if (answerList.size() <= 5) {
        for (int i = 0; i < answerList.size(); i++) {
%>
<div class="container">
    <div class="ui two column grid centered">
        <div class="column">
            <div class="ui raised segment">
                <a class="ui red ribbon label">Title:</a>
                <p>
                    <%=answerList.get(i).getTitle()%>
                    <sup>
                        <a href="/data/<%=SearchFiles.realPath(answerList.get(i).getFilepath())%>">[pdf]</a>
                    </sup>
                </p>
                <%
                    if (answerList.get(i).getAuthor().length() != 0) {
                %>
                <a class="ui orange ribbon label">Authors: </a>
                <p><%=answerList.get(i).getAuthor()%>
                </p>
                <%
                    }
                    if (answerList.get(i).getPage().length() != 0) {
                %>
                <a class="ui teal ribbon label">Pages: </a>
                <p><%=answerList.get(i).getPage()%>
                </p>
                <%
                    }
                    if (answerList.get(i).getDate().length() != 0) {
                %>
                <a class="ui blue ribbon label">Year: </a>
                <p><%=answerList.get(i).getDate()%>
                </p>
                <%
                    }
                %>
                <a class="ui violet right ribbon label">Preview: </a>
                <div><%=answerList.get(i).getHighlight()%>
                </div>
            </div>
        </div>
    </div>
    <br><br>

        <% }
} else {

    for (int j = 0; j < 5; j++) {

%>

    <div class="container">
        <div class="ui two column grid centered">
            <div class="column">
                <div class="ui raised segment">
                    <a class="ui red ribbon label">Title:</a>
                    <p>
                        <%=answerList.get(j).getTitle()%>
                        <sup>
                            <a href="/data/<%=SearchFiles.realPath(answerList.get(j).getFilepath())%>">[pdf]</a>
                        </sup>
                    </p>
                    <%
                        if (answerList.get(j).getAuthor().length() != 0) {
                    %>
                    <a class="ui orange ribbon label">Authors: </a>
                    <p><%=answerList.get(j).getAuthor()%>
                    </p>
                    <%
                        }
                        if (answerList.get(j).getPage().length() != 0) {
                    %>
                    <a class="ui teal ribbon label">Pages: </a>
                    <p><%=answerList.get(j).getPage()%>
                    </p>
                    <%
                        }
                        if (answerList.get(j).getDate().length() != 0) {
                    %>
                    <a class="ui blue ribbon label">Year: </a>
                    <p><%=answerList.get(j).getDate()%>
                    </p>
                    <%
                        }
                    %>
                    <a class="ui violet right ribbon label">Abstract: </a>
                    <div><%=answerList.get(j).getHighlight()%>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
            <% } } %>

        <br><br><br>

            <%
    if (answerList.size() > 5) {
%>

        <div class="ui grid centered">
            <div class="ui pagination menu">

                <%
                    int pagen = answerList.size();
                    int yvshu = pagen % 5;
                    int yv = 0;
                    if (yvshu > 0) yv = 1;
                    int allpagenumber = pagen / 5 + yv;
                    if (pagen <= 25) {
                        for (int pageIndex = 1; pageIndex <= allpagenumber; pageIndex++) {
                %>
                <a class="item" href="/search/<%=pageIndex %>">
                    <%=pageIndex%>
                </a>

                <%
                    }
                } else {
                    for (int pageIndex = 1; pageIndex <= 5; pageIndex++) {
                %>
                <a class="item" href="/search/<%=pageIndex %>">
                    <%=pageIndex%>
                </a>


                <% }%>

                <a class="item" href="/search/6">
                    >>
                </a>

                <%
                    } %>
            </div>
        </div>
            <% }%>

        <br><br><br><br><br>

        <div class="pusher">
            <div class="ui inverted vertical footer segment">
                <div class="ui container">
                    <div class="ui stackable inverted divided equal height stackable grid">
                        <div class="five wide column">
                            <h4 class="ui inverted header">About</h4>
                            <div class="ui inverted link list">
                                <a href="/members" class="item">About Us</a>
                                <a href="http://miner.picp.net/members/Yan/teaching/IR2016Spring.html" class="item">About
                                    This
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



