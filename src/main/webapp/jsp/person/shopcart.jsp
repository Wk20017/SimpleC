<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>购物车页面</title>

    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

    <link href="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/css/amazeui.min.css" rel="stylesheet"
          type="text/css">
    <script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js"
            type="text/javascript"></script>

    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.min.css" rel="stylesheet"/>--%>
    <%--<script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>--%>

    <link href="${APP_PATH}/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="${APP_PATH}/css/cartstyle.css" rel="stylesheet" type="text/css"/>
    <link href="${APP_PATH}/css/optstyle.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<!--顶部导航条 -->
<jsp:include   page="${APP_PATH}/jsp/common/top.jsp" flush="true"/>
<div class="clear"></div>
<!--购物车 -->
<div class="concent">
    <div id="cartTable">


        <%--<table class="am-table am-table-bordered am-table-radius am-table-striped">--%>
            <%--<thead>--%>
            <%--<tr>--%>
                <%--<th>网站名称</th>--%>
                <%--<th>网址</th>--%>
                <%--<th>创建时间</th>--%>
            <%--</tr>--%>
            <%--</thead>--%>
            <%--<tbody>--%>
            <%--<tr>--%>
                <%--<td>Amaze UI</td>--%>
                <%--<td>http://amazeui.org</td>--%>
                <%--<td>2012-10-01</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>Amaze UI</td>--%>
                <%--<td>http://amazeui.org</td>--%>
                <%--<td>2012-10-01</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>Amaze UI</td>--%>
                <%--<td>http://amazeui.org</td>--%>
                <%--<td>2012-10-01</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>Amaze UI</td>--%>
                <%--<td>http://amazeui.org</td>--%>
                <%--<td>2012-10-01</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>Amaze UI</td>--%>
                <%--<td>http://amazeui.org</td>--%>
                <%--<td>2012-10-01</td>--%>
            <%--</tr>--%>
            <%--</tbody>--%>
        <%--</table>--%>


        <div class="cart-table-th">
            <div class="wp">
                <div class="th th-chk">
                    <div id="J_SelectAll1" class="select-all J_SelectAll"></div>
                </div>
                <div class="th th-item">
                    <div class="td-inner">商品信息</div>
                </div>
                <div class="th th-price">
                    <div class="td-inner">单价</div>
                </div>
                <div class="th th-amount">
                    <div class="td-inner">数量</div>
                </div>
                <div class="th th-sum">
                    <div class="td-inner">金额</div>
                </div>
                <div class="th th-op">
                    <div class="td-inner">操作</div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <tr class="item-list">
            <div class="bundle  bundle-last ">
                <div class="clear"></div>


                <div class="bundle-main">
                    <c:forEach items="${requestScope.ShopcartList}" var="ShopcartList" varStatus="loop">
                        <ul class="item-content clearfix">
                            <li class="td td-chk">
                                <div class="cart-checkbox ">
                                    <input class="check" id="J_CheckBox_170769542747" name="items[]"
                                           value="170769542747" type="checkbox">
                                    <label for="J_CheckBox_170769542747"></label>
                                </div>
                            </li>
                            <li class="td td-item">
                                <div class="item-pic">
                                    <a href="#" target="_blank"
                                       data-title="${requestScope.GoodsList[loop.count-1].goodsname}"
                                       class="J_MakePoint" data-point="tbcart.8.12">
                                        <img
                                                src="${APP_PATH}/${requestScope.GoodsList[loop.count-1].image}"
                                                class="itempic J_ItemImg" style="width:100%;height: 100%;"></a>
                                </div>
                                <div class="item-info">
                                    <div class="item-basic-info"><a href="#" target="_blank"
                                                                    title="${requestScope.GoodsList[loop.count-1].goodsname}"
                                                                    class="item-title J_MakePoint"
                                                                    data-point="tbcart.8.11">${requestScope.GoodsList[loop.count-1].goodsname}</a>
                                    </div>
                                </div>
                            </li>
                            <li class="td td-info">
                                <div class="item-props item-props-can"></div>
                            </li>
                            <li class="td td-price">
                                <div class="item-price price-promo-promo">
                                    <div class="price-content">
                                        <div class="price-line"><em
                                                class="price-original">${requestScope.GoodsList[loop.count-1].goodsprice}</em>
                                        </div>
                                        <div class="price-line"><em class="J_Price price-now"
                                                                    tabindex="0">${requestScope.GoodsList[loop.count-1].goodsprice}</em>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="td td-amount">
                                <div class="amount-wrapper ">
                                    <div class="item-amount ">
                                        <div class="sl">
                                            <input class="min am-btn" name="" type="button" value="-"/>
                                            <input class="text_box" name="" type="text" value="${ShopcartList.number}"
                                                   style="width:30px;"/>
                                            <input class="add am-btn" name="" type="button" value="+"/></div>
                                    </div>
                                </div>
                            </li>
                            <li class="td td-sum">
                                    <%--<div class="td-inner"><em tabindex="0" class="J_ItemSum number">${ShopcartList.number}*${GoodsList[loop.count-1].goodsprice}</em></div>--%>
                                117
                            </li>
                            <li class="td td-op">
                                <div class="td-inner"><a href="javascript:;" data-point-url="#" class="delete">
                                    删除</a></div>
                            </li>
                        </ul>
                    </c:forEach>
                </div>

            </div>
        </tr>
    </div>
    <div class="clear"></div>

    <div class="am-form-group" style="padding-top: 3px;padding-left: 5px;background-color: #d8d8d8">
        <label class="am-checkbox-inline">
            <input type="checkbox"  value="" data-am-ucheck> 全选
        </label>
        <a style="padding-left: 7px">删除</a>
    </div>

    <jsp:include   page="${APP_PATH}/jsp/common/bottom.jsp" flush="true"/>
</div>
<!--操作页面-->

</body>

</html>
