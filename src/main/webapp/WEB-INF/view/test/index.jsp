
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="charset=utf-8"/>
    <title>Title</title>
    <link rel="stylesheet" href="/styles/kendo.common.min.css"/>
    <link rel="stylesheet" href="/styles/kendo.metro.min.css"/>

    <script src="/scripts/jquery.min.js"></script>
    <script src="/scripts/kendo.all.min.js"></script>
    <script src="/scripts/cultures/kendo.culture.zh-CN.min.js"></script>
    <script src="/scripts/messages/kendo.messages.zh-CN.min.js"></script>
    <style type="text/css">
        body {
            font-size: 12px;
        }

        div {
            font-size: 12px;
        }
    </style>
    <%--动态添加列的Grid--%>
    <script>
        $().ready(function () {
            var readDataUrl = "/allProducts?tm=" + new Date().getFullYear() + new Date().getMilliseconds() + new Date().getDate();
            createGrid(readDataUrl);
        });

        function createGrid(readDataUrl) {
            $("body").append("<div id=\"grid\"></div>");
            var isDateField = [];
            $.ajax({
//                url: "/allProducts?tm=" + new Date().getFullYear() + new Date().getMilliseconds() + new Date().getDate(),
                url: readDataUrl,
                //url: "http://www.mocky.io/v2/5835e736110000020e0c003c",
                dataType: "json",
                success: function (result) {
                    //alert("OK1");
                    generateGrid(result);
                },
                error: function (error) {
                    alert(error);
                }
            });


            function generateGrid(response) {
                var model = generateModel(response);
                var columns = generateColumns(response);

                var grid = $("#grid").kendoGrid({
                    dataSource: {
                        transport: {
                            read: function (options) {
                                options.success(response.data);
                            }
                        },
                        pageSize: 10,
                        schema: {
                            model: model
                        }
                    },
                    columns: columns,
                    pageable: true,
                    editable: true,
                    columnMenu: {
                        filterable: true,
                        sortable: true,
                        columns: false
                    },
                    columnMenuInit: function (e) {
                        var popup = e.container.data('kendoPopup');
                        var menu = e.container.find(".k-menu").data("kendoMenu");

                        menu.append([{text: "删除此列", spriteCssClass: "k-i-columns"}]);
                        menu.bind("select", function (e) {
                            if ($(e.item).text() == "删除此列") {
                                menu.close();
                                popup.close();
                                testFunc();
                            }
                        });
                    }
                });
            }

            function generateColumns(response) {
                var columnNames = response["columns"];
                return columnNames.map(function (name) {
                    return {field: name, format: (isDateField[name] ? "{0:D}" : "")};
                })
            }

            function generateModel(response) {

                var sampleDataItem = response["data"][0];

                var model = {};
                var fields = {};
                for (var property in sampleDataItem) {
                    if (property.indexOf("ID") !== -1) {
                        model["id"] = property;
                    }
                    var propType = typeof sampleDataItem[property];

                    if (propType === "number") {
                        fields[property] = {
                            type: "number",
                            validation: {
                                required: true
                            }
                        };
                        if (model.id === property) {
                            fields[property].editable = false;
                            fields[property].validation.required = false;
                        }
                    } else if (propType === "boolean") {
                        fields[property] = {
                            type: "boolean"
                        };
                    } else if (propType === "string") {
                        var parsedDate = kendo.parseDate(sampleDataItem[property]);
                        if (parsedDate) {
                            fields[property] = {
                                type: "date",
                                validation: {
                                    required: true
                                }
                            };
                            isDateField[property] = true;
                        } else {
                            fields[property] = {
                                validation: {
                                    required: true
                                }
                            };
                        }
                    } else {
                        fields[property] = {
                            validation: {
                                required: true
                            }
                        };
                    }
                }

                model.fields = fields;

                return model;
            }
        }

        function testFunc() {
            $("#grid").data("kendoGrid").destroy();
            $("#grid").empty();
            $("#grid").remove();
            createGrid("/allProductsExcludeOriginalPlace?tm=" + new Date().getFullYear() + new Date().getMilliseconds() + new Date().getDate());
        }
    </script>
</head>
<body>

</body>
</html>
