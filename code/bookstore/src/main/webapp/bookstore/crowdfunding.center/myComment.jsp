<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.BookComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Book"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="revised" content="Ningxia Seasons, 2015/8/13/" />
<!-- 定义页面的最新版本 -->
<meta name="description" content="网站简介" />
<!-- 网站简介 -->
<meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
<!-- 搜索关键字 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>我的书评</title>
<div id='MicrosoftTranslatorWidget' class='Dark' style='color:white;background-color:#555555'></div>
<script type='text/javascript'>setTimeout(function(){{var s=document.createElement('script');s.type='text/javascript';s.charset='UTF-8';s.src=((location && location.href && location.href.indexOf('https') == 0)?'https://ssl.microsofttranslator.com':'http://www.microsofttranslator.com')+'/ajax/v3/WidgetV3.ashx?siteData=ueOIGRSKkd965FeEGM5JtQ**&ctf=False&ui=true&settings=Manual&from=';var p=document.getElementsByTagName('head')[0]||document.documentElement;p.insertBefore(s,p.firstChild); }},0);</script>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/crowdfunding.center/my_comment.css" rel="stylesheet">

<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<%
	ArrayList<BookComment> bookComments = new ArrayList<BookComment>();
	bookComments = (ArrayList<BookComment>)session.getAttribute("bookComment");
	ArrayList<Book> books = new ArrayList<Book>();
	books = (ArrayList<Book>)session.getAttribute("bookByBookComment");
%>
<body>

	<!-- 开始 -->
	<div class="my_info_title">
		我的书评
		<!--<span><button type="button" class="but">签到</button>
  <p>07月29日<br>
    漏签1天</p></span>-->
	</div>
	<hr>

	<!-- 每个评论 -->
	<%
     	Book book = new Book();
     	BookComment bookComment = new BookComment();
     	String ISBN = "";
     	if (bookComments.size() > 0){
     		for (int i=0; i<bookComments.size(); i++){
     			bookComment = bookComments.get(i);
     			ISBN = bookComment.getISBN();
     			for (int j=0; j<books.size(); j++){
     				if (books.get(j).getISBN().equals(ISBN)){
     					book = books.get(j);
     					break;
     				}
     			}
     %>

<div class="commentbox">
     <table  style="width:828px;">
     
        <tr>

          <td class="bookimage" style="vertical-align:text-top;"><a target="view_parent" href="../aa.jsp?ISBN=<%=book.getISBN()%>"><img class="listbook" src="<%=book.getImage() %>"/></a></td>
          <td class="bookcontent" style="vertical-align:top;">
          <table class="allwidth" style="width:691px;height:142px;">
              <tr>
              <td class="bookname">《<%=book.getBookName() %>》</td>
              <td class="deletebutton"><button class="delete" name="" value="<%=bookComment.getID() %>" onclick="deleteBookComment(this)">删 除</button></td>
              </tr>
              <tr>
              <td colspan="2" style="vertical-align:top;">
              <p class="comment"><%=bookComment.getContent() %></p></td></tr></table>
           <table class="allwidth" style="width:691px;vertical-align:bottom;">
           <tr><td>
              <p class="time"  style="vertical-align:bottom;">
              <%
              	if("reject".equals(bookComment.getCheckResult())){
              %>
              <span class="reject">未通过&nbsp;</span>
              <%} %> 
              <%=bookComment.getCommentTime().toString().substring(0, 19) %></p></td>
              </tr>
           </table>
           </td>
        </tr>
        

		</table>




	</div>
	<br>
	<%} %>
	<%} %>















	<!-- 结束 -->
	<script src="../js/jquery-2.1.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function deleteBookComment(ob){
		var value = $(ob).attr("value");
		$.ajax({
			type:"POST",
			url:"BookCommentAction!deleteBookComment",
			async:false,
			data:{ID:$(ob).attr("value")},
			success:function(result){
				result=eval('('+result+')');
				if(result.success){
					alert("删除成功！");
					location.reload();
				}
				else{
					alert("删除失败！");
				}
			}
		});
	}
	
</script>

</body>
</html>