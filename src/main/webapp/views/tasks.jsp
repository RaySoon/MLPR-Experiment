<%--
  Created by IntelliJ IDEA.
  User: alexsun
  Date: 2018/10/12
  Time: 上午12:02
  To change this template use File | Settings | File Templates.
--%>
<head>
    <!-- Standard Meta -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <!-- Site Properties -->
    <title>Tasks</title>
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
<div class="main ui container">
    <br>
    <h1 class="ui dividing header">Tasks:&nbsp;&nbsp;Scholarly Documents Parse and Search</h1>
    <br>
    <h3>TASK 1: Parse Metadata & Text form PDFs </h3>
    <p>
        Extract metadata, such as title, authors and pages from 1000 papers in PDF format.<br/>
        The machine learning software <a href="http://grobid.github.io/">Grobid</a> is recommended for this task.<br/>
        It can be used to extract fulltext & metadata info from scholarly documents and the results are saved in xml
        files.<br/>
    </p>
    <div class="ui label">
        <i class="alarm icon"></i> Hints
    </div>
    <p>
        *1000 PDFs(2.61G) can be downloaded <a href="http://miner.picp.net/members/Yan/teaching/download/IR2016Spring/IR/oriPDFs.zip">here</a>.<br/>
        *Here is the <a href="http://grobid.readthedocs.io/en/latest/">Grobid Tutorial</a> or you can search grobid on
        GitHub for more information by yourself.<br/>
    </p>
    <div class="ui divider"></div>
    <h3>TASK 2: Index & Search the Parsed Metadata from Grobid</h3>
    <p>
        Build the inverted index with the information you have got in the Task 1.<br/>
        The index should includes at least the following fields: title, authors, date, affiliation, address and
        fulltext.<br/>
        Write codes to search different fields with queries, e.g. search the word 'computer' in the field 'title'.<br/>
    </p>
    <div class="ui label">
        <i class="alarm icon"></i> Hints
    </div>
    <p>
        *The java-based tool <a href="http://lucene.apache.org/">Lucene</a> is recommended to build & search the index.
    </p>
    <div class="ui divider"></div>
    <h3>TASK 3: Build a Simple Web Search Engine with the Index</h3>
    <p>
        Implement a simple web search interface to show your search result. <br/>
        The small search engine should at least provide the users with a list of results after
        a query is submitted and more functions can be added into the website as you like.<br/>
    </p>
    <div class="ui label">
        <i class="alarm icon"></i> Hints
    </div>
    <p>
        *The back-end of the website can be Implemented with IIS+PHP or Tomcat+J2EE+JSP.<br/>
        *The front-end can be realized by HTML5+CSS+JS. Also, there are many popular front-end framework,
        such as <a href="http://www.bootcss.com/">bootstrap</a> and <a
            href="http://www.foundcss.com/">Foundation</a>.<br/>
        *For more website construction tutorial, you can refer to <a href="http://www.w3school.com.cn/">w3cshool</a>.
    </p>
    <br><br>
</div>

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


