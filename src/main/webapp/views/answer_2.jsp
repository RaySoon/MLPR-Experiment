<%--
  Created by IntelliJ IDEA.
  User: alexsun
  Date: 2018/10/12
  Time: 上午12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="com.IR.Component.SearchFiles" %>
<%@ page import="com.IR.Component.File" %>
<%@ page import="com.IR.Component.List" %>
<%@ page import="org.apache.lucene.search.highlight.Scorer" %>
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
    List list2 = (List) request.getAttribute("listAll2");
    int pagenumber = (int) request.getAttribute("pagesize2");
    ArrayList<File> answerList = list2.getContent();
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

<%--<div class="ui sizer vertical segment">--%>
<%--<div class="ui huge right aligned header">巨型标题</div>--%>
<%--</div>--%>
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
    <% }
        ;
    %>
    <div class="ui statistic">
        <div class="value">
            <%=pagenumber%>
        </div>
        <div class="label">
            Results
        </div>
    </div>
</div>

<div class="container">

    <br>
        <%
    for(int i = 0; i < answerList.size(); i ++){
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

            <% }%>


        <div class="ui grid centered">
            <div class="ui pagination menu">
                <%
                    int pagen = ((list2.getPage() - 1) / 5) + 1;
                    int pageAll = list2.getAllPage();
                    if (pageAll >= pagen * 5) {
                        if (list2.getPage() >= 6) {

                %>
                <a class="item"
                   href="/search/<%=(pagen-1)*5%>">
                    <<
                </a>
                <% }
                    for (int pageIndex = (pagen - 1) * 5 + 1; pageIndex <= pagen * 5; pageIndex++) {
                %>
                <a class="item"
                   href="/search/<%=pageIndex%>">
                    <%=pageIndex %>
                </a>
                <% }
                    if (pagen * 5 < pageAll) {
                %>
                <a class="item" href="/search/<%=pagen*5+1%>">
                    >>
                </a>
                <%
                    }
                } else {
                    if (list2.getPage() >= 6) {

                %>
                <a class="item"
                   href="/search/<%=(pagen-1)*5%>">
                    << q
                </a>
                <% }
                    for (int pageIndex = (pagen - 1) * 5 + 1; pageIndex <= pageAll; pageIndex++) {
                %>
                <a class="item"
                   href="/search/<%=pageIndex %>">
                    <%=pageIndex %>
                </a>
                <% }
                } %>
            </div>
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
                                <a href="http://miner.picp.net/members/Yan/teaching/IR2016Spring.html" class="item">About
                                    This Course</a>
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



