<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/29
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="tool.*" %>
<%@ page import="java.util.List,DAO.ChangePageServlet"%>
<!doctype html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en-US"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en-US"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en-US"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en-US"> <!--<![endif]-->
<head>
    <!-- META TAGS -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Knowledge Base Theme</title>

    <link rel="shortcut icon" href="images/favicon.png" />
    <script src="js/jquery-3.3.1.min.js"></script>
    <style>

        #page{
            margin-left:160px;
        }

    </style>


    <!-- Style Sheet-->
    <link rel="stylesheet" href="style.css"/>
    <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='pretty-photo-css-css'  href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
    <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />


    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script></script>
    <![endif]-->


</head>

<body>

<%
    String username = (String)session.getAttribute("username");
%>

<!-- Start of Header -->
<div class="header-wrapper">
    <header>
        <div class="container">


            <div class="logo-container">
                <!-- Website Logo -->
                <a href=""  title="Knowledge Base Theme">
                    <img src="images/logo.png" alt="Knowledge Base Theme">
                </a>

            </div>


            <!-- Start of Main Navigation -->
            <nav class="main-nav">
                <div class="menu-top-menu-container">
                    <ul id="menu-top-menu" class="clearfix">
                        <li><a href="index-2.html">Home</a></li>
                        <li><a href="home-categories-description.html">Home 2</a></li>
                        <li><a href="home-categories-articles.html">Home 3</a></li>
                        <li  class="current-menu-item"><a href="articles-list.html">Articles List</a></li>
                        <li><a href="faq.html">FAQs</a></li>
                        <li><a href="#">Skins</a>
                            <ul class="sub-menu">
                                <li><a href="blue-skin.html">Blue Skin</a></li>
                                <li><a href="green-skin.html">Green Skin</a></li>
                                <li><a href="red-skin.html">Red Skin</a></li>
                                <li><a href="index-2.html">Default Skin</a></li>
                            </ul>
                        </li>
                        <li><a href="#">More</a>
                            <ul class="sub-menu">
                                <li><a href="full-width.html">Full Width</a></li>
                                <li><a href="elements.html">Elements</a></li>
                                <li><a href="page.html">Sample Page</a></li>
                            </ul>
                        </li>
                        <li><a href="contact.html">Contact</a></li>
                        <li><a href="regist.html" id="regist">注册</a></li>
                        <li><a href="login.jsp" id="login">登录</a></li>
                    </ul>
                </div>
            </nav>
            <!-- End of Main Navigation -->

        </div>
    </header>
</div>
<!-- End of Header -->

<!-- Start of Search Wrapper -->
<div class="search-area-wrapper">
    <div class="search-area container">
        <h3 class="search-header">Have a Question?</h3>
        <p class="search-tag-line">If you have any question you can ask below or enter what you are looking for!</p>

        <form id="search-form" class="search-form clearfix" method="get" action="#" autocomplete="off">
            <input class="search-term required" type="text" id="s" name="s" placeholder="Type your search terms here" title="* Please enter a search term!" />
            <input class="search-btn" type="submit" value="Search" />
            <div id="search-error-container"></div>
        </form>
    </div>
</div>
<!-- End of Search Wrapper -->

<!-- Start of Page Container -->
<div class="page-container" id="page">
    <div class="container">
        <div class="row">

            <!-- start of page content -->
            <div class="span8 main-listing">

                <%!
                    List<NewsList> as = tool.GetJsonText.getArticleFromDB(900,5000);
                    int index = 0;
                %>

               <%

                   index = DAO.ChangePageServlet.getPage();

                    if(index<0){
                        index = 0;
                    }else if(index>as.size()){
                        index = 0;
                    }
                   System.out.println(index);
                    for(int i=index;i<16+index;i++)
                    {
                        %>

                         <article class="format-standard type-post hentry clearfix">

                      <header class="clearfix">

                        <h3 class="post-title">
                            <a id="<%="article_item_"+i%>" target="_blank" onclick="ClickedArticle(this)" href="<%="http://www.textvalve.com/page/usercenter/article.html?"+as.get(i).getId()%>"><%=as.get(i).getTitle()%></a>
                        </h3>

                        <div class="post-meta clearfix">
                            <span class="date">25 Feb, 2013</span>
                            <span class="category"><a href="#" title="View all posts in Server &amp; Database">Server &amp; Database</a></span>
                            <span class="comments"><a href="#" title="Comment on Integrating WordPress with Your Website">3 Comments</a></span>
                            <span class="like-count">66</span>
                        </div><!-- end of post meta -->

                       </header>


                         </article>

                <%
                    }
               %>


                <div id="pagination">
                    <a href="articles-list.jsp" class="btn" onclick="onLast()">上一页 »</a>
                    <a href="articles-list.jsp" class="btn" onclick="onNext()">下一页 »</a>
                </div>

            </div>
            <!-- end of page content -->



        </div>
    </div>
</div>
<!-- End of Page Container -->

<!-- Start of Footer -->
<footer id="footer-wrapper">
    <div id="footer" class="container">
        <div class="row">

            <div class="span3">
                <section class="widget">
                    <h3 class="title">How it works</h3>
                    <div class="textwidget">
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </p>
                        <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>
                    </div>
                </section>
            </div>

            <div class="span3">
                <section class="widget"><h3 class="title">Categories</h3>
                    <ul>
                        <li><a href="#" title="Lorem ipsum dolor sit amet,">Advanced Techniques</a> </li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet,">Designing in WordPress</a></li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet,">Server &amp; Database</a></li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet, ">Theme Development</a></li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet,">Website Dev</a></li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet,">WordPress for Beginners</a></li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet, ">WordPress Plugins</a></li>
                    </ul>
                </section>
            </div>

            <div class="span3">
                <section class="widget">
                    <h3 class="title">Latest Tweets</h3>
                    <div id="twitter_update_list">
                        <ul>
                            <li>No Tweets loaded !</li>
                        </ul>
                    </div>


                </section>
            </div>

            <div class="span3">
                <section class="widget">
                    <h3 class="title">Flickr Photos</h3>
                    <div class="flickr-photos" id="basicuse">
                    </div>
                </section>
            </div>

        </div>
    </div>
    <!-- end of #footer -->

    <!-- Footer Bottom -->
    <div id="footer-bottom-wrapper">
        <div id="footer-bottom" class="container">
            <div class="row">
                <div class="span6">
                    <p class="copyright">

                    </p>
                </div>
                <div class="span6">
                    <!-- Social Navigation -->
                    <ul class="social-nav clearfix">
                        <li class="linkedin"><a target="_blank" href="#"></a></li>
                        <li class="stumble"><a target="_blank" href="#"></a></li>
                        <li class="google"><a target="_blank" href="#"></a></li>
                        <li class="deviantart"><a target="_blank" href="#"></a></li>
                        <li class="flickr"><a target="_blank" href="#"></a></li>
                        <li class="skype"><a target="_blank" href="skype:#?call"></a></li>
                        <li class="rss"><a target="_blank" href="#"></a></li>
                        <li class="twitter"><a target="_blank" href="#"></a></li>
                        <li class="facebook"><a target="_blank" href="#"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Footer Bottom -->

</footer>
<!-- End of Footer -->

<a href="#top" id="scroll-top"></a>

<!-- script -->

<script>
    function onNext(){
        $.ajax({
            type:"POST",
            url:"ChangePageServlet",
            data:{name:"next"},
            success:function(data,textStatus){
                console.log(data);
            }
        });
    }

    function onLast(){
        $.ajax({
            type:"POST",
            url:"ChangePageServlet",
            data:{name:"last"},
            success:function(data,textStatus){
                console.log(data);
            }
        });
    }

    function ClickedArticle(obj) {
        var a = document.getElementById(obj.id);
        var url = a.href;
        var n = url.indexOf('?');
        var id = url.substring(n+1);
        console.log(obj.id);
        console.log(id);

        $.ajax({
            type:"POST",
            url:"LogItemServlet",
            data:{item_id:id,username:'<%=username%>'},
            success:function(data,textStatus){
                console.log(data);
            }
        });

    }

    function loginsuccess() {
        var regist = document.getElementById('regist');
        regist.href = '';
        regist.innerHTML = '<%=username%>';

        var login = document.getElementById('login');
        login.href = 'logout.jsp';
        login.innerHTML = '注销';
    }
    if('<%=username%>'!=''&&'<%=username%>'!='null')
    {
        loginsuccess();
    }


</script>


</body>
</html>
