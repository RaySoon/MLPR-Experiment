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
    <title>Members</title>
    <link rel="stylesheet" type="text/css" href="/semantic/dist/semantic.css">

    <style type="text/css">

        .hidden.menu {
            display: none;
        }

        .masthead.segment {
            min-height: 700px;
            padding: 1em 0em;
        }

        .masthead .logo.item img {
            margin-right: 1em;
        }

        .masthead .ui.menu .ui.button {
            margin-left: 0.5em;
        }

        .masthead h1.ui.header {
            margin-top: 3em;
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

    <script src="/js/jQuery-3.3.1.js"></script>
    <script src="/semantic/dist/semantic.js"></script>
</head>
<body>


<div class="container">

    <div class="ui large top menu">
        <div class="ui container">
            <a class="item" href="/home">Home</a>
            <a class="item" href="/search">Search</a>
            <a class="item" href="/tasks">Tasks</a>
            <div class="right menu">
                <a class="active item" href="/members">Members</a>
            </div>
        </div>
    </div>
</div>
<div class="main ui container">
    <br>
    <h1 class="ui dividing header">Members</h1>
    <br><br><br>
</div>
<div class="pusher">
    <div class="ui six column centered cards">
        <div class="card">
            <div class="image">
                <img src="/image/Ray.png">
            </div>
            <div class="content">
                <div class="header">Ray</div>
                <div class="meta">
                    <a>Computer Science</a>
                </div>
            </div>
            <div class="extra content">
            <span class="right floated">
                2016312336
            </span>
            </div>
        </div>
        <div class="card">
            <div class="image">
                <img src="/image/LP.png">
            </div>
            <div class="content">
                <div class="header">LP</div>
                <div class="meta">
                    <span class="date">Computer Science</span>
                </div>
            </div>
            <div class="extra content">
            <span class="right floated">
                2016312333
            </span>
            </div>
        </div>
        <div class="card">
            <div class="image">
                <img src="/image/Andrew.png">
            </div>
            <div class="content">
                <div class="header">Andrew</div>
                <div class="meta">
                    <span class="date">Computer Science</span>
                </div>
            </div>
            <div class="extra content">
            <span class="right floated">
                2016312335
            </span>
            </div>
        </div>
        <div class="card">
            <div class="image">
                <img src="/image/Ryan.png">
            </div>
            <div class="content">
                <div class="header">Ryan</div>
                <div class="meta">
                    <span class="date">Computer Science</span>
                </div>
            </div>
            <div class="extra content">
            <span class="right floated">
                2016312344
            </span>
            </div>
        </div>
    </div>
    <br><br><br><br><br><br>
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

