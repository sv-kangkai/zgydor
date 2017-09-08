<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/header.jsp" %>
</head>
<body>
<div id="example">
    <script src="/scripts/test/products.js"></script>
<div>
    <h1>统计数据生成器</h1>
    <hr/>
</div>

    <div class="demo-section k-content wide">
        <div id="listView"></div>
        <div id="pager" class="k-pager-wrap"></div>
    </div>

    <script type="text/x-kendo-template" id="template">
        <div class="product">
                <img src="../content/web/foods/#= ProductID #.jpg" alt="#: ProductName # image" />
            <h3>#:ProductName#</h3>
            <a href="/projectIndex"><p>#:kendo.toString(UnitPrice, "c")#</p></a>
        </div>
    </script>

    <script>
        $(function() {
            var dataSource = new kendo.data.DataSource({
                data: products,
                pageSize: 9
            });

            $("#pager").kendoPager({
                dataSource: dataSource
            });

            $("#listView").kendoListView({
                dataSource: dataSource,
                template: kendo.template($("#template").html())
            });
        });
    </script>
    <style>
        #listView {
            padding: 10px 5px;
            margin-bottom: -1px;
            min-height: 510px;
        }
        .product {
            float: left;
            position: relative;
            width: 211px;
            height: 270px;
            margin: 0 5px;
            padding-right: 20px;
            padding-left: 20px;
        }
        .product img {
            width: 210px;
            height: 210px;
        }
        .product h3 {
            margin: 0;
            padding: 3px 5px 0 0;
            max-width: 96px;
            overflow: hidden;
            line-height: 1.1em;
            font-size: .9em;
            font-weight: normal;
            text-transform: uppercase;
            color: #999;
        }
        .product p {
            visibility: hidden;
        }
        .product:hover p {
            visibility: visible;
            position: absolute;
            width: 210px;
            height: 210px;
            top: 0;
            margin: 0;
            padding: 0;
            line-height: 110px;
            vertical-align: middle;
            text-align: center;
            color: #fff;
            background-color: rgba(0,0,0,0.75);
            transition: background .2s linear, color .2s linear;
            -moz-transition: background .2s linear, color .2s linear;
            -webkit-transition: background .2s linear, color .2s linear;
            -o-transition: background .2s linear, color .2s linear;
        }
        .k-listview:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
    </style>
</div>
</body>
</html>