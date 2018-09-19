<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Vitaliy Ivkin">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Part Information</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
        .myrow-container{
            margin: 20px;
        }
        .panel-title{
            color: #d1cbbc;
        }
    </style>
</head>

<body class=".container-fluid" style="background-color:whitesmoke">
<div class="container myrow-container">
    <div class="panel panel-success">

        <div class="panel-heading" style="background-color:#128181">
        </div>

        <div class="panel-body">
            <h2 class="panel-title" style="color: black">
                <strong>Характеристики детали</strong>
            </h2>
            <form:form id="PartRegisterForm" cssClass="form-horizontal" modelAttribute="part" method="post" action="savePart">

                <div class="form-group">
                    <div class="control-label col-xs-3"> <form:label path="name" >Название</form:label> </div>
                    <div class="col-xs-6">
                        <form:hidden path="id" value="${partObject.id}"/>
                        <form:input cssClass="form-control" path="name" value="${partObject.name}"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="control-label col-xs-3"><form:label path="required">Необходимость</form:label></div>
                    <div class="col-md-3" >
                        <input type="radio" name="required" value="true"/> Да
                        <input type="radio" name="required" value="false"/> Нет
                    </div>
                </div>

                <div class="form-group">
                    <form:label path="amount" cssClass="control-label col-xs-3">Количество</form:label>
                    <div class="col-xs-6">
                        <form:input cssClass="form-control" path="amount" value="${partObject.amount}"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-4">
                        </div>
                        <div class="col-xs-4">
                            <input type="submit" id="savePart" class="btn btn-primary" value="Save" onclick="return submitPartForm();"/>
                        </div>
                        <div class="col-xs-4">
                        </div>
                    </div>
                </div>

            </form:form>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script type="text/javascript">
    function submitPartForm() {

        var name = $('#name').val().trim();
        var amount = $('#amount').val();
        $('#required').val();
        if (name.length === 0) {
            alert('Название нельзя оставлять пустым');
            $('#name').focus();
            return false;
        }
        if (amount < 0) {
            alert('Неподходящее количество на складе');
            $('#amount').focus();
            return false;
        }
        return true;
    };
</script>
</body>
</html>
