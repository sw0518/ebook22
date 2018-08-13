<%--
  Created by IntelliJ IDEA.
  User: 孙旺
  Date: 2018/8/1
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>列表页</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
    <script type="text/javascript" >
        function exportlist(){
            document.forms.myFrom.action="${pageContext.request.contextPath}/entry/add";
            document.forms.myFrom.submit();
        }

        function deleteone(id) {
            if(confirm("删除后不可恢复，确认删除吗？")){
                $.get("${pageContext.request.contextPath}/entry/deleteone",{id:id,r:Math.random()},function(result){
                    if(result="1"){
                        alert("删除成功！");
                    }else{
                        alert("删除失败！");
                    }
                    window.location=window.location;
                })
            }
        }





    </script>


</head>
<body>
${msg}
<form action="${pageContext.request.contextPath}/entry/page" method="get" id="myFrom">
    图书分类：<select name="categoryId">
        <option value="0">全部</option>
    <c:forEach var="cateGroy" items="${cList}">
        <option ${entry.categoryId==cateGroy.id ? "selected":""} value="${cateGroy.id}">${cateGroy.name}</option>
    </c:forEach>
    </select>
    <input type="submit" value="查询" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" onclick="javascirpt:exportlist();" value="新增电子图书" />
</form>

    <br/><br/>
    <table border="2" >
        <tr>
            <td colspan="6" style="text-align: center;border-style: solid" >电子图书列表</td>
        </tr>
        <tr>
            <td>图书编号</td>
            <td>图书名称</td>
            <td>图书摘要</td>
            <td>上传人</td>
            <td>上传时间</td>
            <td>操作</td>
        </tr>
        <c:forEach var="entry" items="${eList}" >
            <tr>
                <td>${entry.id}</td>
                <td>${entry.title}</td>
                <td>${entry.summary}</td>
                <td>${entry.uploaduser}</td>
                <td><fmt:formatDate value="${entry.createdate}" pattern="yyyy-MM-dd" /></td>
                <td><a href="${pageContext.request.contextPath}/entry/update?id=${entry.id}">修改</a>&nbsp;<a href="javascript:deleteone(${entry.id})">删除</a></td>
            </tr>
        </c:forEach>
    </table><br/>
    <p><a href="${pageContext.request.contextPath}/entry/page?categoryId=${entry.categoryId}">首页</a>|
        <a href="${pageContext.request.contextPath}/entry/page?currentPage=${ph.currentPage-1}&categoryId=${entry.categoryId}">上一页</a>|
        <a href="${pageContext.request.contextPath}/entry/page?currentPage=${ph.currentPage+1}&categoryId=${entry.categoryId}">下一页</a>|
        <a href="${pageContext.request.contextPath}/entry/page?currentPage=${ph.totalPageCount}&categoryId=${entry.categoryId}">末页</a>&nbsp;第${ph.currentPage}页/共${ph.totalPageCount}页 </p>

</body>

</html>
