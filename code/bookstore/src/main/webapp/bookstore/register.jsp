<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!-- 重置文件 -->
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/register.css">
  <link rel="stylesheet" href="css/bootstrap.css">
  <title>注册</title>
</head>
 <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/jquery.citys.js"></script>          
 
<body>
<nav>
  <div class="container"> 
    
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="test.jsp"><img src="images/index1_logo.png"/></a> 
      </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav navbar-right hidden-sm">
        <li><a href="test.jsp">我已注册，回首页登录</a> </li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>

<div class="container">
    <div class="row">
      <!-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">-->
        <div id="carousel1" class="carousel slide">
          <ol class="carousel-indicators">
            <li data-target="#carousel1" data-slide-to="0" class="active"> </li>
            <li data-target="#carousel1" data-slide-to="1" class=""> </li>
            <li data-target="#carousel1" data-slide-to="2" class=""> </li>
          </ol>
          <div class="carousel-inner" >
            <div class="item"> <img class="img-responsive" src="images/index1_banner.png" alt="thumb" >
            </div>
            <div class="item active"> <img class="img-responsive" src="images/index1_banner.png" alt="thumb">
            </div>
            <div class="item"> <img class="img-responsive" src="images/index1_banner.png" alt="thumb">
            </div>
          </div>
          <a class="left carousel-control" href="#carousel1" data-slide="prev"><span class="icon-prev"></span></a> <a class="right carousel-control" href="#carousel1" data-slide="next"><span class="icon-next"></span></a></div>
     
     </div>
    <hr>
  </div>
  
<div class="reg_div">
    <ul class="reg_ul">
      <li>
          <span>用户名：</span>
          <input type="text" name="" value="" placeholder="6-12位用户名" class="reg_user">
          <span class="tip user_hint"></span>
      </li>
      <li>
          <span>密码：</span>
          <input type="password" name="" value="" placeholder="6-16位密码" class="reg_password">
          <span class="tip password_hint"></span>
      </li>
      <li>
          <span>确认密码：</span>
          <input type="password" name="" value="" placeholder="确认密码" class="reg_confirm">
          <span class="tip confirm_hint"></span>
      </li>
      <li>
          <span>真实姓名：</span>
          <input type="text" name="" value="" placeholder="真实姓名" class="reg_realname">
          <span class="tip realname_hint"></span>
      </li>
      <li>
          <span>性别：</span>
          
          <input type="radio" name="sex" value="male" class="reg_sex" checked>男
          <input type="radio" name="sex" value="female" class="reg_sex">女
          
      </li>
      <li>
          <span>手机号码：</span>
          <input type="text" name="" value="" placeholder="手机号" class="reg_mobile">
          <span class="tip mobile_hint"></span>
      </li>
      <li>
          <span>邮箱：</span>
          <input type="email" name="" value="" placeholder="邮箱" class="reg_email">
          <span class="tip email_hint"></span>
      </li>
      <li>
          <span>地址：</span>
          
            <div id="demo3" class="citys">
                <p>
                      <select name="province"></select>
                      <select name="city"></select>
                      <br>
                      <select name="area"></select>
                      <select name="town"></select>
                </p>
             </div>
          
          <span>   </span>
          <input type="text" name="" value="" placeholder="详细地址" class="reg_address">
          <span class="tip address_hint"></span>
      </li>
      <li>
          <span>验证问题：</span>
          <input type="text" name="" value="" placeholder="验证问题" class="reg_validationProblem">
          <span class="tip validationProblem_hint"></span>
      </li>
      <li>
          <span>答案：</span>
          <input type="text" name="" value="" placeholder="验证问题答案" class="reg_validationAnswer">
          <span class="tip validationAnswer_hint"></span>
      </li>      
      

 <!--  sex                  enum("male","female")          not null, 
   address              varchar(50)                    not null, 
   registerDate         datetime                       not null,-->

      <li>
        <button type="button" name="button" class="red_button">注册</button>
      </li>
    </ul>
  </div>
  

<script type="text/javascript">
        		var $town = $('#demo3 select[name="town"]');
        		var townFormat = function(info){
        			$town.hide().empty();
        			if(info['code']%1e4&&info['code']<7e5){	//是否为“区”且不是港澳台地区
        				$.ajax({
        					url:'http://passer-by.com/data_location/town/'+info['code']+'.json',
        					dataType:'json',
        					success:function(town){
        						$town.show();
        						for(i in town){
        								$town.append('<option value="'+i+'">'+town[i]+'</option>');
        						}
        					}
        				});
        			}
        		};
                $('#demo3').citys({
        			province:'福建',
        			city:'厦门',
        			area:'思明',
        			onChange:function(info){
        				townFormat(info);
        			}
        		},function(api){
        			var info = api.getInfo();
        			townFormat(info);
        		});
            </script>


  <script type="text/javascript" src="js/script.js"></script>
</body>
</html>
    