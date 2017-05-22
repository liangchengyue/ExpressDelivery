<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/10
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>策略配置下发</title>
    <link href="/resources/plugins/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_pa2qef7c195asjor.css">
    <link rel="stylesheet" href="/resources/plugins/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/plugins/hadmin/css/hui.css"/>
    <link rel="stylesheet" href="/resources/css/ecr.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/plugins/table/css/GridManager.css"/>
</head>
<body>
<%--action="/strategy/add/Strategy" method="get"--%>
<form name="strategyForm">
<div class="search-area">
    <b>策略下发</b>
    <div class="sa-ele">
        <div class="layui-input-inline">
            <select id="strategy_select_head" name="nmap" lay-verify="" lay-search style="width:150px;height:30px;margin-left: 100px;margin-top: 10px;">
                <option value="0" selected="selected">Nmap</option>
                <option value="1">API</option>
            </select>
        </div>
    </div>
    <div class="sa-ele">
        <div class="layui-input-inline">
            <select id="strategy_select_foot" name="nmapType" lay-verify="" lay-search style="width:200px;height:30px;margin-left: 10px;margin-top: 10px;">
                <option value="0" selected="selected">Intensescan</option>
                <option value="1">IntensescanplusUDP</option>
                <option value="2">IntensescanallTCPports</option>
                <option value="3">Intensescannoping</option>
                <option value="4">Pingscan</option>
                <option value="5">Regularscan</option>
                <option value="6">Quickscan</option>
                <option value="7">Quicktraceroute</option>
            </select>
        </div>
    </div>
    <div class="sa-ele">
        <div class="layui-input-inline">
            <input type="text" id="strategy_input_ip" name="ipOrPort" required lay-verify="required"
                   placeholder="请输入IP/IP段/域名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="sa-ele">
        <div class="layui-inline">
            <button class="layui-btn layui-btn-primary" type="button" id="strategy_btn_add">策略下发</button>
        </div>
    </div>
</div>
</form>

<div class="row">
    <div class="col-md-12">
        <div class="hui-panel">
            <div class="hui-panel-header">
                <b>策略下发信息</b>
                <ul class="hui-panel-header-icon">
                    <li class="hui-panel-change" data-open="true"><a href="javascript:;"><i class="iconfont icon-gotop"></i></a></li>
                    <li class="hui-panel-close"><a href="javascript:;"><i class= "iconfont icon-guanbi"></i></a></li>
                </ul>
            </div>
            <div class="hui-panel-body">
                <div id="strategy_table" style="width: 100%;">
                    <table grid-manager="strategy_table">

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/resources/plugins/layui/layui.js" type="application/javascript"></script>
<script type="application/javascript" src="/resources/plugins/table/js/GridManager.js"></script>
<script src="/resources/js/frons/strategy/strategy.js" type="application/javascript"></script>


</body>
</html>
