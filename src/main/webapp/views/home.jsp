<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
    <!-- Standard Meta -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <!-- Site Properties -->
    <title>Information Retrieval Project 1</title>
    <link rel="stylesheet" type="text/css" href="/semantic/dist/semantic.css">

    <style type="text/css">

        .hidden.menu {
            display: none;
        }

        .masthead.segment {
            min-height: 900px;
            padding: 1em 0em;
        }

        .masthead .logo.item img {
            margin-right: 1em;
        }

        .masthead .ui.menu .ui.button {
            margin-left: 0.5em;
        }

        .masthead h1.ui.header {
            margin-top: 2em;
            margin-bottom: 0em;
            font-size: 4em;
            font-weight: normal;
        }

        .masthead h2 {
            font-size: 1.7em;
            font-weight: normal;
        }

        .ui.vertical.stripe {
            padding: 8em 0em;
        }

        .ui.vertical.stripe h3 {
            font-size: 2em;
        }

        .ui.vertical.stripe .button + h3,
        .ui.vertical.stripe p + h3 {
            margin-top: 3em;
        }

        .ui.vertical.stripe .floated.image {
            clear: both;
        }

        .ui.vertical.stripe p {
            font-size: 1.33em;
        }

        .ui.vertical.stripe .horizontal.divider {
            margin: 3em 0em;
        }

        .quote.stripe.segment {
            padding: 0em;
        }

        .quote.stripe.segment .grid .column {
            padding-top: 5em;
            padding-bottom: 5em;
        }

        .footer.segment {
            padding: 3em 0em;
        }

        .secondary.pointing.menu .toc.item {
            display: none;
        }

        @media only screen and (max-width: 700px) {
            .ui.fixed.menu {
                display: none !important;
            }

            .secondary.pointing.menu .item,
            .secondary.pointing.menu .menu {
                display: none;
            }

            .secondary.pointing.menu .toc.item {
                display: block;
            }

            .masthead.segment {
                min-height: 350px;
            }

            .masthead h1.ui.header {
                font-size: 2em;
                margin-top: 1.5em;
            }

            .masthead h2 {
                margin-top: 0.5em;
                font-size: 1.5em;
            }
        }


    </style>

    <script src="/js/jQuery.min.js"></script>
    <script src="/semantic/dist/semantic.js"></script>
    <script>
        $(document)
            .ready(function () {

                // fix menu when passed
                $('.masthead')
                    .visibility({
                        once: false,
                        onBottomPassed: function () {
                            $('.fixed.menu').transition('fade in');
                        },
                        onBottomPassedReverse: function () {
                            $('.fixed.menu').transition('fade out');
                        }
                    })
                ;

                // create sidebar and attach to menu open
                $('.ui.sidebar')
                    .sidebar('attach events', '.toc.item')
                ;

            })
        ;
    </script>
</head>
<body>


<!-- Page Contents -->
<div class="pusher">
    <div class="ui inverted vertical masthead center aligned segment">

        <div class="ui container">
            <div class="ui large secondary inverted pointing menu">
                <a class="toc item">
                    <i class="sidebar icon"></i>
                </a>
                <a class="active item" href="/home">Home</a>
                <%--<a class="item" href="/search">Tasks</a>--%>
                <%--<a class="item" href="/table">Table</a>--%>
                <%--<div class="right item">--%>
                    <%--<a class="item" href="/members">Members</a>--%>
                <%--</div>--%>
            </div>
        </div>


        <div class="ui text container">
            <h1 class="ui inverted header">
                MLPR Final
            </h1>
            <h2>
                Upload File
            </h2>
            <%--        <form:form action="/fileUpload" method="post" enctype="multipart/form-data">--%>
            <%--            <input type="file" name="file">--%>
            <%--            <input type="submit" value="upload">--%>
            <%--        </form:form>--%>
            <br>
            <br>
            <form:form name="Form2" action="/fileUpload" method="post" enctype="multipart/form-data">
                <input type="file" name="file">
                <button type="submit" class="ui primary button">Upload</button>
            </form:form>
            <br>
            <a class="ui huge primary button" href="/gbm">Result <i class="right arrow icon"></i></a>
        </div>

    </div>


    <%--<div class="ui inverted vertical footer segment">--%>
        <%--<div class="ui container">--%>
            <%--<div class="ui stackable inverted divided equal height stackable grid">--%>
                <%--<div class="five wide column">--%>
                    <%--<h4 class="ui inverted header">About</h4>--%>
                    <%--<div class="ui inverted link list">--%>
                        <%--<a href="/members" class="item">About Us</a>--%>
                        <%--<a href="http://miner.picp.net/members/Yan/teaching/IR2016Spring.html" class="item">About This--%>
                            <%--Course</a>--%>
                        <%--<a href="http://en.cufe.edu.cn/" class="item">About CUFE</a>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="seven wide column">--%>
                    <%--<h4 class="ui inverted header">Download</h4>--%>
                    <%--<a href="/pdf/Pre.pdf" class="item">Pre</a>--%>
                    <%--&lt;%&ndash;<h4 class="ui inverted header">Source Code</h4>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<a href="https://github.com/RaySoon/CUFE-Information-Retrieval-Course-Project-1" class="item">GitHub&ndash;%&gt;--%>
                    <%--&lt;%&ndash;Link</a>&ndash;%&gt;--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
</div>

</body>

