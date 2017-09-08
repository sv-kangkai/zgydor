<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/header.jsp" %>
    <script type="text/javascript">
        //行号
        var rowCount = 1;
        var mouseEvent;

        $(document).ready(function () {

            $("body").click(function (e) {
                //alert("ddd");
                $("#mouseMenu0").hide();
                $("#mouseMenu1").hide();
            });

            $("thead").bind("contextmenu", function (e) {
                //区分当前右键点击的位置
                mouseEvent = e;
                var rowId = e.target.id;
                if (rowId == "rowContent" || rowId == "operateRow" || rowId == "lineNumber") {
                    return false;
                }
                else {
                    var row_Index = e.target.parentElement.rowIndex;
                    if (row_Index == 0) {
                        //alert("右键被屏蔽");
                        var x = e.originalEvent.clientX;
                        var y = e.originalEvent.clientY;
                        $("#mouseMenu0").css("left", x);
                        $("#mouseMenu0").css("top", y);
                        $("#mouseMenu0").show();
                        $("#mouseMenu1").hide();
                    }
                    else {
                        var x = e.originalEvent.clientX;
                        var y = e.originalEvent.clientY;
                        $("#mouseMenu1").css("left", x);
                        $("#mouseMenu1").css("top", y);
                        $("#mouseMenu1").show();
                        $("#mouseMenu0").hide();
                    }
                }
                return false;
            });



            //添加一列
            $("#button2").click(function () {
                $("#thd tr").eq(0).append("<th colspan='1'>指标</th>");
                $("#thd tr").eq(1).append("<th>年份 </th>");
                $("#tb tr").append("<td><input type='text' class='form-control'/></td>");
            });
        });

        //往前添加一列指标
        function addIndicatorBefore() {
            var theq = mouseEvent.target.cellIndex;
            var colspanval = 0;
            for (var i = 3; i < theq; i++) {
                //在thead的第一行第三个脚标开始循环，i不超过要添加指标的脚标
                var a = $("thead tr").eq(0).find("th").eq(i).attr("colspan");//取第一行每个th的colspan的值
                colspanval = colspanval + parseInt(a);//求当前所有th的colspan值的总和
            }
            $("thead tr").eq(1).find("th").eq(colspanval).before("<th>年份 <br/>同时加在左边的年份</th>");
            var len = $("tbody tr").length;//得到当前要增加的td的长度
            for (var i = 0; i < len; i++) {
                $("tbody tr").eq(i).find("td").eq(colspanval + 3).before("<td><input type='text' class='form-control'/></td>");//依次添加对应的tbody每行td
            }
            $("thead tr").eq(0).find("th").eq(theq).before("<th colspan='1'>指标 <br/>加在左边的指标</th>");
        };

        //往后添加一列指标
        function addIndicatorAfter() {
            var theq = mouseEvent.target.cellIndex;
            var colspanval = 0;
            for (var i = 3; i < theq; i++) {
                //在thead的第一行第三个脚标开始循环，i不超过要添加指标的脚标
                var a = $("thead tr").eq(0).find("th").eq(i).attr("colspan");//取第一行每个th的colspan的值
                colspanval = colspanval + parseInt(a);//求当前所有th的colspan值的总和
            }
            $("thead tr").eq(1).find("th").eq(colspanval).after("<th>年份 <br/>同时加在右边的年份</th>");
            var len = $("tbody tr").length;//得到当前要增加的td的长度
            for (var i = 0; i < len; i++) {
                $("tbody tr").eq(i).find("td").eq(colspanval + 3).after("<td><input type='text' class='form-control'/></td>");//依次添加对应的tbody每行td
            }
            $("thead tr").eq(0).find("th").eq(theq).after("<th colspan='1'>指标 <br/>加在右边的指标</th>");
        };

        //删除一列指标
        function removeIndicator() {
            var theq = mouseEvent.target.cellIndex;//取到当前的脚标
            //var residuetheq = theq - 2;
            var colspanval = 0;
            for (var i = 3; i < theq; i++) {
                //在thead的第一行第三个脚标开始循环，i不超过要删除指标的脚标
                var a = $("thead tr").eq(0).find("th").eq(i).attr("colspan");//取第一行每个th的colspan的值
                colspanval = colspanval + parseInt(a);//求当前所有th的colspan值的总和
            }
            var colspanval_theq = $("thead tr").eq(0).find("th").eq(theq).attr("colspan");//取当前要删除的指标colspan的值
            colspanval_theq = parseInt(colspanval_theq);//强制转换为int型
            for (var i = 0; i < colspanval_theq; i++) {
                $("thead tr").eq(1).find("th").eq(colspanval).remove();//找到对应th的并删除
                var str = "tbody tr td:nth-child(" + parseInt(colspanval + 4) + ")";
                console.log(str);
                $(str).remove();//删除tbody里的对应列
            }
            $("thead tr").eq(0).find("th").eq(theq).remove();//删除该指标
        };

        //删除一列年份
        function removeYear() {
            var theq_1 = mouseEvent.target.cellIndex;//脚标
            var theq_1_len = theq_1 + 1;//长度
            var a = 0;
            var i = 0;
            for (i = 3; ; i++) {
                a = $("thead tr").eq(0).find("th").eq(i).attr("colspan");//依次colspan的值
                theq_1_len = theq_1_len - parseInt(a);//剩余长度
                if (theq_1_len <= 0) {
                    break;//跳出
                }
            }
            var b = parseInt(a) - 1;//当前指标colspan的值减一
            if (b == 0) {
                $("thead tr").eq(0).find("th").eq(i).remove();//如果指标下只有一个年份，那么删除年份，指标也会被删除
                $("thead tr").eq(1).find("th").eq(theq_1).remove();
                var len = $("tbody tr").length;//得到当前要删除的年份长度
                for (var k = 0; k < len; k++) {
                    $("tbody tr").eq(k).find("td").eq(theq_1 + 3).remove();//依次删除年份对应的tbody每行td
                }
            }
            else {
                $("thead tr").eq(0).find("th").eq(i).attr("colspan", b);//付给当前的指标应有的colspan值
                $("thead tr").eq(1).find("th").eq(theq_1).remove();
                var len = $("tbody tr").length;//得到当前要删除的td长度
                for (var k = 0; k < len; k++) {
                    $("tbody tr").eq(k).find("td").eq(theq_1 + 3).remove();//依次删除年份对应的tbody每行td
                }
            }
        }

        //往后添加一列年份
        function addYearAfter() {
            var theq = mouseEvent.target.cellIndex;
            var tdeq = mouseEvent.target.cellIndex + 3;
            var k = 3;
            var residuetheq = theq + 1;
            for (var j = 0; ; k++) {
                j = $("thead tr").eq(0).find("th").eq(k).attr("colspan");
                residuetheq = residuetheq - j;
                if (residuetheq <= 0) {
                    break;
                }
            }
            var anElement = $("thead tr").eq(0).find("th").eq(k);
            var colval = anElement.attr("colspan");
            colval = parseInt(colval) + 1;
            anElement.attr("colspan", colval);
            $("thead tr").eq(1).find("th").eq(theq).after("<th>年份 <br/>加在右边的年份</th>");
            var len = $("tbody tr").length;
            for (var i = 0; i < len; i++) {
                $("tbody tr").eq(i).find("td").eq(tdeq).after("<td><input type='text' class='form-control'/></td>");
            }
        };

        //往前添加一列年份
        function addYearBefore() {
            var theq = mouseEvent.target.cellIndex;
            var tdeq = mouseEvent.target.cellIndex + 3;
            var k = 3;
            var residuetheq = theq + 1;
            for (var j = 0; ; k++) {
                j = $("thead tr").eq(0).find("th").eq(k).attr("colspan");
                residuetheq = residuetheq - j;
                if (residuetheq <= 0) {
                    break;
                }
            }
            var anElement = $("thead tr").eq(0).find("th").eq(k);
            var colval = anElement.attr("colspan");
            colval = parseInt(colval) + 1;
            anElement.attr("colspan", colval);
            $("thead tr").eq(1).find("th").eq(theq).before("<th>年份 <br/>加在左边的年份</th>");
            var len = $("tbody tr").length;
            for (var i = 0; i < len; i++) {
                $("tbody tr").eq(i).find("td").eq(tdeq).before("<td><input type='text' class='form-control'/></td>");
            }
        };

        //删除一行
        function removeRow(e) {
            e.parentElement.parentElement.remove();
            rowCount--;
            var len = $("#tb tr").length;
            for (var i = 0; i < len; i++) {
                $("#tb tr").eq(i).children("td").eq(1).text(i + 1);
            }
        };


    </script>
</head>

<body>
<div>
    <h1>统计数据生成器</h1>
    <hr/>
</div>
<button id="undo" class="btn btn-default">添加行</button>
<button id="button2" class="btn btn-default">添加列</button>
<table class="table table-bordered table-hover">
    <thead id="thd">
    <tr id="trHeader">
        <th id="operateRow" rowspan="2">操作</th>
        <th id="lineNumber" rowspan="2">序号／行号</th>
        <th id="rowContent" rowspan="2">行政区划</th>
    </tr>
    <tr>
    </tr>
    </thead>
    <tbody id="tb">
    </tbody>
</table>
<div id="mouseMenu0" style="display: none; float: left; position: absolute;">
    <table class="table table-bordered table-hover" style=" background-color: ghostwhite;">
        <tr>
            <td>
                <button type="button" class="btn btn-link btn-xs" onclick="addIndicatorBefore()">在左边插入指标</button>
            </td>
        </tr>
        <tr>
            <td>
                <button type="button" class="btn btn-link btn-xs" onclick="addIndicatorAfter()">在右边插入指标</button>
            </td>
        </tr>
        <tr>
            <td>
                <button type="button" class="btn btn-link btn-xs" onclick="removeIndicator()">删除此指标</button>
            </td>
        </tr>
    </table>
</div>
<div id="mouseMenu1" style="display: none; float: left; position: absolute;">
    <table class="table table-bordered table-hover" style=" background-color: ghostwhite;">
        <tr>
            <td>
                <button type="button" class="btn btn-link btn-xs" onclick="addYearBefore()">在左边插入年份</button>
            </td>
        </tr>
        <tr>
            <td>
                <button type="button" class="btn btn-link btn-xs" onclick="addYearAfter()">在右边插入年份</button>
            </td>
        </tr>
        <tr>
            <td>
                <button type="button" class="btn btn-link btn-xs" onclick="removeYear()">删除此列</button>
            </td>
        </tr>
    </table>
</div>

<div id="dialog" style="display: none;">
    <div id="example">
        <div class="demo-section k-content">
            <div id="treeview"></div>
        </div>
        <script>
            var regionName;
//            var serviceRoot = "https://demos.telerik.com/kendo-ui/service";
            homogeneous = new kendo.data.HierarchicalDataSource({
                transport: {
                    read: {
                        url: "/getInitData",
                        dataType: "json"
                    }
                },
                schema: {
                    model: {
                        id: "rgid",
                        hasChildren: "subcode"
                    }
                }
            });
            function onSelect(e) {
                regionName=this.text(e.node);

            };

            $("#treeview").kendoTreeView({
                dataSource: homogeneous,
                dataTextField: "name",
                select: onSelect
            });
            $(document).ready(function () {
                //var innerContent = "";
                var myDialog = $("#dialog"),
                    undo = $("#undo");

                function onClose() {
                    undo.fadeIn();
                }

                myDialog.kendoDialog({
                    actions: [{
                        text: "OK",
                        action: function (e) {
                            //添加一行
                            if($("tbody tr td:contains('+regionName+')").length==0){
                                var tdnode = $("thead tr").eq(1).children("th").length;
                                if (tdnode > 0) {
                                    var extraPart = "<td><input type='text' class='form-control'/></td>";
                                    for (var i = 0; i < tdnode - 1; i++) {
                                        extraPart = extraPart + "<td><input type='text' class='form-control'/></td>";
                                    }
                                }
                                $("#tb").append("<tr><td><a href='#' onclick='removeRow(this)'>删除</a></td><td>" + rowCount++ + "</td><td>"+regionName+"</td>" + extraPart + "</tr>");
                            }
                            else{
                                myDialog.kendoDialog({

                                });
                            }
                            // e.sender is a reference to the dialog widget object
                            // OK action was clicked
                            // Returning false will prevent the closing of the dialog

                            return true;
                        },
                        primary: true
                    }, {
                        text: "Cancel"
                    }],
                    width: "615px",
                    height: "700px",
                    title: "弹出窗口",
                    modal: "true",
                    //content: innerContent,
                    close: onClose
                });
                undo.click(function () {
                    myDialog.data("kendoDialog").open();
                    undo.fadeOut();
                    $("#dialog").show();


                });

            });
        </script>
    </div>
</div>
<div id="dialogHint" style="display: none;">

</div>

<script>


</script>


</body>

</html>