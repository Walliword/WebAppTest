<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Web App Test</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
        .myrow-container {
            margin: 20px;
        }

        a.aEdit:link {
            color: #000000;
        }

        a.aEdit:visited {
            color: #565455;
        }

        a.aEdit:hover {
            color: #c9c7a3;
        }

        a.aEdit:active {
            color: #dedcb4;
        }

        a.aDelete:link {
            color: #a83016;
        }

        a.aDelete:hover {
            color: #ff0000;
        }

        a.aDelete:active {
            color: #000000;
        }

        .panel-footer a {
            font-size: 1.1em;
            color: #ffffff;
        }

        .panel-footer a:visited {
            color: #ffffff;
        }

        .panel-footer a:hover {
            color: #ffffff;
        }

        .panel-footer a:active {
            color: #ffffff;
        }
    </style>
</head>
<body class=".container-fluid" style="background-color:whitesmoke">
<div class="container myrow-container">

    <div class="panel">
        <div class="panel-heading" style="background-color:#128181">
            <h3 class="panel-title ">
            </h3>
        </div>

        <div class="panel-body">
            <c:if test="${empty partList}">
                There are no Parts
            </c:if>
            <c:if test="${not empty partList}">

                <form action="createPart">
                    <div class="row">
                        <div class="col-md-2"><input class="btn btn-primary" type='submit' value='Добавить деталь'/>
                        </div>
                    </div>
                </form>

                <form action="searchPart">
                    <div class="row">
                        <div class="col-md-2"><strong>Поиск по имени:</strong></div>
                        <div class="col-md-3"><input type="text" name="searchName" id="searchName"
                                                     placeholder="Поиск.."></div>
                        <div class="col-md-2" align="left"><input class="btn btn-primary" type='submit' value='Найти'/>
                        </div>
                    </div>
                </form>

                <form action="searchRequired">
                    <div class="row" align="left">
                        <div class="col-md-2"><strong>Отфильтровать:</strong></div>

                        <div class="col-md-3">
                            <input type="radio" name="requirement" value=""/> Все
                            <input type="radio" name="requirement" value="true"/> Нужные
                            <input type="radio" name="requirement" value="false"/> Ненужные
                        </div>
                        <div class="col-md-2"><input class="btn btn-primary" type='submit' value='Выбор'/></div>
                    </div>
                </form>

                <table class="table table-hover table-bordered">
                    <thead style="background-color: #17a8a5; color: white;">
                    <tr>
                        <th>Наименование</th>
                        <th>Необходимость</th>
                        <th>На складе</th>
                        <th>Редактировать</th>
                        <th>Удалить</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${partList}" var="part">
                        <tr>
                            <th><c:out value='${part.name}'/></th>
                            <th><c:out value='${part.required == true ? "да" : "нет"}'/></th>
                            <th><c:out value='${part.amount}'/></th>
                            <th><a class="aEdit" href="editPart?id=<c:out value='${part.id}'/>">Ред.</a></th>
                            <th><a class="aDelete" href="deletePart?id=<c:out value='${part.id}'/>">Х</a></th>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <table class="table table-hover table-bordered">
                <tbody>
                <tr>
                    <th>Можно собрать</th>
                    <th><c:out value='${computers}'/></th>
                    <th>компьютер(ов)</th>
                </tr>
                </tbody>
            </table>
        </div>

        <div align="center" class="panel-footer" style="background-color:#128181" id="pagination">
            <c:url value="/" var="prev">
                <c:param name="page" value="${page-1}"/>
            </c:url>
            <c:if test="${page > 1}">
                <a href="<c:out value="${prev}" />" class="pn prev">Пред.</a>
            </c:if>

            <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                <c:choose>
                    <c:when test="${page == i.index}">
                        <span>${i.index}</span>
                    </c:when>
                    <c:otherwise>
                        <c:url value="/" var="url">
                            <c:param name="page" value="${i.index}"/>
                        </c:url>
                        <a href='<c:out value="${url}" />'>${i.index}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:url value="/" var="next">
                <c:param name="page" value="${page + 1}"/>
            </c:url>
            <c:if test="${page + 1 <= maxPages}">
                <a href='<c:out value="${next}" />' class="pn next">След.</a>
            </c:if>
        </div>

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</div>
</body>
</html>
