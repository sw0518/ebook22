<%--
  Created by IntelliJ IDEA.
  User: 孙旺
  Date: 2018/8/1
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>增加页面</title>
    <script src="${pageContext.request.contextPath}/statics/ckeditor/ckeditor.js"></script>
    <script src="${pageContext.request.contextPath}/statics/My97DatePicker/WdatePicker.js"></script>

</head>
<body>
<script type="text/javascript">
    function check(){
        var title=document.getElementById("title").value;
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


<form action="${pageContext.request.contextPath}/entry/doadd" method="post">
    <input type="hidden" value="${entry.categoryId}" name="categoryId" />
    <table>
        <tr>
            <td>增加电子图书</td>
        </tr>
        <tr>
            <td>图书名称(*)</td>
            <td><input type="text" name="title" id="title"/></td>
        </tr>
        <tr>
            <td>图书摘要</td>
            <td><textarea name="summary" class="ckeditor"></textarea></td>
        </tr>
        <tr>
            <td>上传人</td>
            <td><input type="text" name="uploaduser"/></td>
        </tr>
        <tr>
            <td>上传时间</td>
            <td><input  name="createdate" id="createdate"  calss="Wdate" onfocus="WdatePicker({el:$dp.$('createdate'),datefmt:'yyyy-MM-dd',readOnly:true,maxDate:'%y-%M-%d'})"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="新增" onclick="return check()"/>&nbsp;<input type="submit"value="返回" onclick="window.location='${pageContext.request.contextPath}/entry/page?categoryId=${entry.categoryId}'"/></td>
        </tr>
    </table>
</form>

</body>
</html>
