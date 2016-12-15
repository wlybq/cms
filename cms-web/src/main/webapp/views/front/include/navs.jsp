<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/tag.jsp"%>
<input id="uploadImageWeb" type="hidden" value="${uploadImageWeb}">
<div class="am-g am-g-fixed blog-fixed ">
<h1 class="am-topbar-brand">
  <a href="${ctx_front}/index?cid=${site.siteId}">${site.siteName}</a>
</h1>

<!-- nav start am-g am-g-fixed blog-fixed-->
<nav class=" blog-nav">
<button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only blog-button" data-am-collapse="{target: '#blog-collapse'}" ><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="blog-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav">
      <li class="am-active"><a href="${ctx_front}/index?cid=${site.siteId}">首页</a></li>
      
      <c:forEach var="nav" items="${navs}">
      	<c:if test="${nav.children == null || fn:length(nav.children) == 0}">
      	<li><a href="${frontPath}/category?cid=${site.siteId}&id=${nav.categoryId}">${nav.categoryName}</a></li>
      	</c:if>
      	<c:if test="${nav.children != null && fn:length(nav.children) > 0}">
      		<li class="am-dropdown" data-am-dropdown="">
      			<a class="am-dropdown-toggle" data-am-dropdown-toggle="" href="javascript:;">
         		 ${nav.categoryName}<span class="am-icon-caret-down"></span>
         		</a>
         		<ul class="am-dropdown-content">
      			<c:forEach var="children" items="${nav.children}">
      				<li><a href="${frontPath}/category?cid=${site.siteId}&id=${children.categoryId}">${children.categoryName}</a></li>         
      			</c:forEach>
      			</ul>
      		</li>
      	</c:if>
      </c:forEach>
    </ul>
   
   <shiro:notAuthenticated>
    <div class="am-topbar-right">
    	<a class="am-btn am-btn-primary am-topbar-btn am-btn-sm" href="${frontPath}/login?cid=${site.siteId}"><span class="am-icon-user"></span> 登录</a>
    	<a class="am-btn am-btn-secondary am-topbar-btn am-btn-sm" href="${frontPath}/register?cid=${site.siteId}"><span class="am-icon-pencil"></span> 注册</a>
    </div>
   <!--  <div class="am-topbar-right">
      
    </div> -->
    </shiro:notAuthenticated>
    <shiro:user>  
    	
    	<shiro:authenticated>
    	<div class="am-topbar-right">
    		<a class="am-btn am-btn-secondary am-topbar-btn am-btn-sm " href="${frontPath}/personal/info?cid=${site.siteId}">
    		<span class="am-icon-user"></span> <shiro:principal property="username"/>
    		</a>
    		<a class="am-btn am-btn-secondary am-topbar-btn am-btn-sm sign-out" href="javascript:;">
    		<span class="am-icon-sign-out"></span> 退出
    		</a>
    	</div>
    	<%-- <div class="am-topbar-right">    	 
    		<div class="am-dropdown" data-am-dropdown="{boundary: '.am-topbar'}">
		        <button class="am-btn am-btn-secondary am-topbar-btn am-btn-sm am-dropdown-toggle" data-am-dropdown-toggle>
		        	<i class="am-icon-user"></i>&nbsp;
		        	<shiro:principal property="username"/>
		        	<span class="am-icon-caret-down"></span>
		        </button>
		        <ul class="am-dropdown-content">
		          <li><a href="javascript:;">个人信息</a></li>
		         <li><a class="sign-out" href="javascript:;">退出</a></li>
		        </ul>
	        </div>
    	</div> --%>
    	
    	</shiro:authenticated>
    </shiro:user>
   <!--  <form class="am-topbar-form am-topbar-right am-form-inline" role="search">
      <div class="am-form-group">
        <input type="text" class="am-form-field am-input-sm" placeholder="搜索">
      </div>
    </form> -->
  </div>
</nav>
</div>
<hr>
<!-- nav end -->