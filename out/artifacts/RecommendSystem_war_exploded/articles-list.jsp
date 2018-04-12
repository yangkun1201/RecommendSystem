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

    <title>23 News</title>

    <link rel="shortcut icon" href="images/favicon.png" />
    <script src="js/jquery-3.3.1.min.js"></script>
    <style>

        #page{
            margin-left:160px;
        }

    </style>


    <!-- Style Sheet-->
    <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='pretty-photo-css-css'  href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
    <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />


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
                <a href="articles-list.jsp"  title="23 News">
                    <img src="images/logo.png" alt="23 News">
                </a>

            </div>


            <!-- Start of Main Navigation -->
            <nav class="main-nav">
                <div class="menu-top-menu-container">
                    <ul id="menu-top-menu" class="clearfix">
                        <li  class="current-menu-item"><a href="articles-list.jsp">时下流行</a></li>
                        <li><a href="articles_type_society.jsp">社会</a></li>
                        <li><a href="articles_type_physical.jsp">体育</a></li>
                        <li><a href="articles_type_entertainment.jsp">娱乐</a></li>
                        <li><a href="articles_type_science.jsp">科技</a></li>
                        <li><a href="articles_type_cultural.jsp">人文</a></li>
                        <li><a href="articles_type_films.jsp">影视</a></li>
                        <li><a href="articles_type_education.jsp">教育</a></li>
                        <li><a href="articles_type_game.jsp">游戏</a></li>
                        <li><a href="articles-recommend.jsp">猜你喜欢</a></li>
                        <li><a href="regist.html" id="regist">注册</a></li>
                        <li><a href="login.jsp" id="login">登录</a></li>
                        <li><a href="" id="head"><img src="images/headlogo.png" style="margin-top: -2px;"></a></li>
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
                    List<NewsList> as = tool.GetJsonText.getArticlesFromDB(900,1000);
                    int index = 0;
                    String url = "";
                %>

               <%

                   index = DAO.ChangePageServlet.getPage();

                    if(index<0){
                        index = 0;
                    }else if(index>as.size()){
                        index = 0;
                    }
                    //  System.out.println(index);



                    for(int i=index;i<16+index;i++)
                    {
                        url = "articles-display.jsp?item_id="+as.get(i).getId()+"&user_name="+username;

                        %>

                         <article class="format-standard type-post hentry clearfix" id="<%="article_"+i%>">

                      <header class="clearfix">

                        <h3 class="post-title">
                            <a id="<%="article_item_"+i%>" target="_blank" onclick="ClickedArticle(this)" href=<%=url%>><%=as.get(i).getTitle()%></a>
                        </h3>

                        <div class="post-meta clearfix">
                            <span class="date"><%=GetJsonText.getTimeById(as.get(i).getId())%></span>
                            <span  id="<%="likeitem_"+as.get(i).getId()%>" style="float:right" onclick="changeImgLike(this)">
                                <img id="<%="like_"+as.get(i).getId()%>" src="images/like1.png">
                            </span>
                            <span id="<%="unlikeitem_"+as.get(i).getId()%>" style="float:right"  onclick="changeImgUnlike(this)">
                                <img id="<%="unlike_"+as.get(i).getId()%>" src="images/unlike1.png">
                            </span>
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
                    <h3 class="title">网站使用指南</h3>
                    <div class="textwidget">
                        <p>1.注册成为本站会员</p>
                    </div>
                </section>
            </div>

            <div class="span3">
                <section class="widget">
                    <h3 class="title">&nbsp;&nbsp;</h3>
                    <div class="textwidget">
                        <p>2.浏览热门新闻或自己偏好的新闻</p>
                    </div>
                </section>
            </div>

            <div class="span3">
                <section class="widget">
                    <h3 class="title">&nbsp;&nbsp;</h3>
                    <div class="textwidget">
                        <p>3.进入猜你喜欢查看为您推荐的新闻</p>
                    </div>
                </section>
            </div>

            <div class="span3">
                <section class="widget">
                    <h3 class="title">&nbsp;&nbsp;</h3>
                    <div class="textwidget">
                        <p>4.查看本站为您建立的偏好模型</p>
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
       /*/ var a = document.getElementById(obj.id);
        var url = a.href;
        var n = url.indexOf('?');
        var id = url.substring(n+1);
        console.log(obj.id);
        console.log(id);

        $.ajax({
            type:"POST",
            url:"LogItemServlet",
            data:{item_id:id,username:''},
            success:function(data,textStatus){
               // console.log(data);
            }
        });*/
    }
    
    function loginsuccess() {
        var regist = document.getElementById('regist');
        regist.href = '';
        regist.innerHTML = '<%=username%>';

        var login = document.getElementById('login');
        login.href = 'logout.jsp';
        login.innerHTML = '注销';
        head.href = 'my.jsp';
        head.onclick = function () {
        };
    }
    if('<%=username%>'!=''&&'<%=username%>'!='null')
    {
        loginsuccess();
    }else{
        head.onclick = function () {
            alert("请先登录");
        }
    }



    function changeImgLike(obj){
        var father = document.getElementById(obj.id);
        var img = father.childNodes[1];
        //console.log(img);
        if (img.src.indexOf('like1') > 0) {
            img.src="images/like2.png";
        } else {
            img.src="images/like1.png";
        }

        if('<%=username%>'!=''&&'<%=username%>'!='null'){
            var s = obj.id;
            var n = s.indexOf('_');
            var id = s.substring(n+1);

            $.ajax({
                type:"POST",
                url:"LogClickedLikeServlet",
                data:{item_id:id,username:'<%=username%>'},
                success:function(data,textStatus){
                    console.log(data);
                }
            });
        }
    }

    function changeImgUnlike(obj){
        var father = document.getElementById(obj.id);
        var img = father.childNodes[1];
        var article = father.parentElement.parentElement.parentElement;
        console.log(article.id);
        if (img.src.indexOf('unlike1') > 0) {
            img.src="images/unlike2.png";
        } else {
            img.src="images/unlike1.png";
        }
        disappear(article.id);
        if('<%=username%>'!=''&&'<%=username%>'!='null'){
            var s = obj.id;
            var n = s.indexOf('_');
            var id = s.substring(n+1);

            $.ajax({
                type:"POST",
                url:"LogClickedUnLikeServlet",
                data:{item_id:id,username:'<%=username%>'},
                success:function(data,textStatus){
                    console.log(data);
                }
            });
        }
    }
    function disappear(id){
        var s = "#"+id;
        $(s).delay(300).fadeOut("fast");
    }
</script>


</body>
</html>
