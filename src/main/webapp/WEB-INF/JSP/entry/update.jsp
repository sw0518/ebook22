<%--
  Created by IntelliJ IDEA.
  User: 孙旺
  Date: 2018/8/1
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>修改</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/statics/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/statics/My97DatePicker/WdatePicker.js"></script>
<script>
    function check(){
        alert("1");
        var title=document.getElementById("title")[0].value;
        var date=$dp.$("createdate").value;
        if(title==""){
            alert("图书名称不能为空！");
            return false;
        }
        if(date==""){
            alert("上传时间不能为空！");
            return false;
        }
        return true;
    }


</script>

<form action="${pageContext.request.contextPath}/entry/doupdate" method="post">
    <input type="hidden" value="${entry.id}" name="id"/>
    <table>
        <tr>
            <td>增加电子图书</td>
        </tr>
        <tr>
            <td>图书编号</td>
            <td><input type="text" value="${entry.categoryId}" name="categoryId"/></td>
        </tr>
        <tr>
            <td>图书名称(*)</td>
            <td><input type="text" name="title" value="${entry.title}"/></td>
        </tr>
        <tr>
            <td>图书摘要</td>
            <td><textarea name="summary" class="ckeditor" >${entry.summary}</textarea></td>
        </tr>
        <tr>
            <td>上传人</td>
            <td><input type="text" name="uploaduser" value="${entry.uploaduser}"/></td>
        </tr>
        <tr>
        <td>上传时间</td>
        <td><input  name="createdate" value="<fmt:formatDate value="${entry.createdate}" pattern="yyyy-MM-dd"/> " calss="Wdate" onfocus="WdatePicker({el:$dp.$('createdate'),datefmt:'yyyy-MM-dd',readOnly:true,maxDate:'%y-%M-%d'})"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="提交" onclick="return check()"/>&nbsp;<input type="button"value="返回" onclick="window.location='${pageContext.request.contextPath}/entry/page?categoryId=${entry.categoryId}'"/></td>
        </tr>
    </table>
</form>



</body>
</html>
