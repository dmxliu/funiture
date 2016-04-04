<%@ page contentType="text/html;charset=UTF-8" language="java" %><html><head>    <jsp:include page="../common/backend_common.jsp"/></head><body class="no-skin" youdao="bind" style="background: white"><input id="gritter-light" checked="" type="checkbox" class="ace ace-switch ace-switch-5"/><div class="page-header">    <h1>        用户管理        <small>            <i class="ace-icon fa fa-angle-double-right"></i>            维护部门与用户关系        </small>    </h1></div><div class="main-content-inner">    <div class="col-sm-3">        <div class="table-header">            部门列表&nbsp;&nbsp;            <a class="green" href="#">                <i class="ace-icon fa fa-plus-circle orange bigger-130 dept-add"></i>            </a>        </div>        <div id="deptList">        </div>    </div>    <div class="col-sm-9">        <div class="col-xs-12">            <div class="table-header">                用户列表&nbsp;&nbsp;                <a class="green" href="#">                    <i class="ace-icon fa fa-plus-circle orange bigger-130"></i>                </a>            </div>            <div>                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">                    <div class="row">                        <div class="col-xs-6">                            <div class="dataTables_length" id="dynamic-table_length"><label>                                展示                                <select id="pageSize" name="dynamic-table_length" aria-controls="dynamic-table" class="form-control input-sm">                                    <option value="10">10</option>                                    <option value="25">25</option>                                    <option value="50">50</option>                                    <option value="100">100</option>                                </select> 条记录 </label>                            </div>                        </div>                        <div class="col-xs-6">                            <div id="dynamic-table_filter" class="dataTables_filter"><label>                                搜索:                                <input type="search" class="form-control input-sm" placeholder="" aria-controls="dynamic-table"></label></div>                        </div>                    </div>                    <table id="dynamic-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid"                           aria-describedby="dynamic-table_info" style="font-size:14px">                        <thead>                        <tr role="row">                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">                                姓名                            </th>                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">                                所属部门                            </th>                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">                                邮箱                            </th>                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">                                电话                            </th>                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">                                状态                            </th>                            <th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""></th>                        </tr>                        </thead>                        <tbody id="userList"></tbody>                    </table>                    <div class="row" id="userPage">                    </div>                </div>            </div>        </div>    </div></div><div id="dialog-dept-form" style="display: none;">    <form id="deptForm">        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">            <tr>                <td style="width: 80px;"><label for="parentId">上级部门</label></td>                <td>                    <select id="parentId" name="parentId" data-placeholder="选择部门" style="width: 200px;"></select>                    <input type="hidden" name="id" id="deptId" />                </td>            </tr>            <tr>                <td><label for="deptName">名称</label></td>                <td><input type="text" name="name" id="deptName" value="" class="text ui-widget-content ui-corner-all"></td>            </tr>            <tr>                <td><label for="deptSeq">顺序</label></td>                <td><input type="text" name="seq" id="deptSeq" value="1" class="text ui-widget-content ui-corner-all"></td>            </tr>            <tr>                <td><label for="deptRemark">备注</label></td>                <td><textarea name="remark" id="deptRemark" class="text ui-widget-content ui-corner-all" rows="3" cols="25"></textarea></td>            </tr>        </table>    </form></div><div id="dialog-user-form" style="display: none;">    <form id="userForm">        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">            <tr>                <td style="width: 80px;"><label for="parentId">所在部门</label></td>                <td>                    <select id="deptSelectId" name="deptId" data-placeholder="选择部门" style="width: 200px;"></select>                    <input type="hidden" name="id" id="userDeptId" />                </td>            </tr>            <tr>                <td><label for="userName">名称</label></td>                <td><input type="text" name="name" id="userName" value="" class="text ui-widget-content ui-corner-all"></td>            </tr>            <tr>                <td><label for="userSeq">顺序</label></td>                <td><input type="text" name="seq" id="userSeq" value="1" class="text ui-widget-content ui-corner-all"></td>            </tr>            <tr>                <td><label for="userRemark">备注</label></td>                <td><textarea name="remark" id="userRemark" class="text ui-widget-content ui-corner-all" rows="3" cols="25"></textarea></td>            </tr>        </table>    </form></div><script id="paginateTemplate" type="x-tmpl-mustache"><div class="col-xs-6">    <div class="dataTables_info" id="dynamic-table_info" role="status" aria-live="polite">        总共 {{total}} 中的 {{from}} ~ {{to}}    </div></div><div class="col-xs-6">    <div class="dataTables_paginate paging_simple_numbers" id="dynamic-table_paginate">        <ul class="pagination">            <li class="paginate_button previous disabled" aria-controls="dynamic-table" tabindex="0" id="dynamic-table_previous">                <a href="#" >首页</a>            </li>            <li class="paginate_button " aria-controls="dynamic-table" tabindex="0">                <a href="#">前一页</a>            </li>            <li class="paginate_button active" aria-controls="dynamic-table" tabindex="0">                <a href="#" data-id="{{pageNo}}">第{{pageNo}}页</a>                <input type="hidden" id="pageNo" value="{{pageNo}}" />            </li>            <li class="paginate_button" aria-controls="dynamic-table" tabindex="0">                <a href="#">后一页</a>            </li>            <li class="paginate_button next" aria-controls="dynamic-table" tabindex="0" id="dynamic-table_next">                <a href="#">尾页</a>            </li>        </ul>    </div></div></script><script id="deptListTemplate" type="x-tmpl-mustache"><ol class="dd-list">    {{#deptList}}        <li class="dd-item dd2-item dept-name" id="dept_{{id}}" href="javascript:void(0)" data-id="{{id}}">            <div class="dd2-content" style="cursor:pointer;">            {{name}}            <span style="float:right;">                <a class="green dept-edit" href="#" data-id="{{id}}" >                    <i class="ace-icon fa fa-pencil bigger-100"></i>                </a>                &nbsp;                <a class="red dept-delete" href="#" data-id="{{id}}" data-name="{{name}}">                    <i class="ace-icon fa fa-trash-o bigger-100"></i>                </a>            </span>            </div>        </li>    {{/deptList}}</ol></script><script id="userListTemplate" type="x-tmpl-mustache">{{#userList}}<tr role="row" class="user-name odd" data-id="{{id}}"><!--even -->    <td><a href="#">{{username}}</a></td>    <td>{{showDeptName}}</td>    <td>{{mail}}</td>    <td>{{telephone}}</td>    <td>        <span class="label label-sm label-warning">{{showStatus}}</span>    </td>    <td>        <div class="hidden-sm hidden-xs action-buttons">            <a class="green" href="#">                <i class="ace-icon fa fa-pencil bigger-100"></i>            </a>            <a class="red" href="#">                <i class="ace-icon fa fa-trash-o bigger-100"></i>            </a>            <a class="red" href="#">                <i class="ace-icon fa fa-flag bigger-100"></i>            </a>        </div>    </td></tr>{{/userList}}</script><script type="text/javascript">    $(function () {        var deptList; // 存储树形部门列表        var deptMap = {}; // 存储map格式部门列表        var optionStr = ""; // 用于存储最新的部门列表组成的下拉列表字符串, 每次使用前清为空串        var lastClickDeptId = -1;        // 预编译需要使用的模板        var deptListTemplate = $('#deptListTemplate').html();        Mustache.parse(deptListTemplate);        var userListTemplate = $('#userListTemplate').html();        Mustache.parse(userListTemplate);        var paginateTemplate = $('#paginateTemplate').html();        Mustache.parse(paginateTemplate);        loadDeptList();        // 处理点击[新增部门]按钮        $(".dept-add").click(function () {            $("#dialog-dept-form").dialog({                modal: true,                title: "新增部门",                open: function (event, ui) {                    $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮                    optionStr = "<option value=\"0\">-</option>";                    recursiveRenderDeptSelect(deptList, 1);                    $("#deptForm")[0].reset();                    $("#parentId").html(optionStr);                },                buttons: {                    "添加": function (e) {                        e.preventDefault();                        updateDept(true, function (data) {                            $("#dialog-dept-form").dialog("close");                        }, function(data) {                            showMessage("新增部门", data.msg, false);                        });                    },                    "取消": function () {                        $("#dialog-dept-form").dialog("close");                    }                }            });        });        // 加载部门列表        function loadDeptList() {            $.ajax({                url: "/sys/dept/tree.json",                success: function (result) {                    if (result.ret) {                        deptList = result.data;                        var rendered = Mustache.render(deptListTemplate, {deptList: result.data});                        $('#deptList').html(rendered);                        recursiveRenderDept(result.data);                        bindDeptClick();                    } else {                        showMessage("加载部门列表", result.msg, false);                    }                }            });        }        // 递归渲染部门列表        function recursiveRenderDept(deptList) {            if (deptList && deptList.length > 0) {                $(deptList).each(function (i, dept) {                    deptMap[dept.id] = dept;                    if (dept.deptList.length > 0) {                        var rendered = Mustache.render(deptListTemplate, {deptList: dept.deptList});                        $('#dept_' + dept.id).append(rendered);                        recursiveRenderDept(dept.deptList);                    }                });            }        }        // 递归渲染部门下拉列表字符串, 前提是加载过部门列表, 根据部门列表数据计算        function recursiveRenderDeptSelect(deptList, level) {            level = level | 0;            if (deptList && deptList.length > 0) {                $(deptList).each(function (i, dept) {                    deptMap[dept.id] = dept;                    var blank = "";                    if (level > 1) {                        for (var j = 2; j <= level; j++) {                            blank += "..";                        }                        blank += "∟";                    }                    optionStr += Mustache.render("<option value='{{id}}'>{{name}}</option>", {id: dept.id, name: blank + dept.name});                    if (dept.deptList.length > 0) {                        recursiveRenderDeptSelect(dept.deptList, level + 1);                    }                });            }        }        // 绑定部门相关点击事件        function bindDeptClick() {            // 处理点击选中            $(".dept-name").click(function (e) {                e.preventDefault();                e.stopPropagation(); // 此处必须要取消冒泡,因为是个递归结构,冒泡的话会让一个点击被响应多个                var deptId = $(this).attr("data-id");                if (deptId != lastClickDeptId) {                    handleDeptSelected(deptId);                }            });            // 处理点击[编辑部门]按钮            $(".dept-edit").click(function (e) {                e.preventDefault();                e.stopPropagation(); // 此处必须要取消冒泡,因为是个递归结构,冒泡的话会让一个点击被响应多个                var deptId = $(this).attr("data-id"); // 选中的部门id                $("#dialog-dept-form").dialog({                    modal: true,                    title: "编辑部门",                    open: function (event, ui) {                        $("#deptForm")[0].reset();                        $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮                        optionStr = "<option value=\"0\">-</option>";                        recursiveRenderDeptSelect(deptList, 1);                        $("#parentId").html(optionStr);                        $("#deptId").val(deptId);                        var targetDept = deptMap[deptId];                        if(targetDept){                            $("#parentId").val(targetDept.parentId);                            $("#deptName").val(targetDept.name);                            $("#deptSeq").val(targetDept.seq);                            $("#deptRemark").val(targetDept.remark);                        };                    },                    buttons: {                        "更新": function (e) {                            e.preventDefault();                            updateDept(false, function (data) { // success callback                                $("#dialog-dept-form").dialog("close");                            }, function(data) { // fail callback                                showMessage("更新部门", data.msg, false);                            });                        },                        "取消": function () {                            $("#dialog-dept-form").dialog("close");                        }                    }                });            });            // 处理点击[删除部门]按钮            $(".dept-delete").click(function (e) {                e.preventDefault();                e.stopPropagation(); // 此处必须要取消冒泡,因为是个递归结构,冒泡的话会让一个点击被响应多个                var deptId = $(this).attr("data-id");                var deptName = $(this).attr("data-name");                if (confirm("确定要删除部门[" + deptName + "]吗?")) {                    $.ajax({                        url: "/sys/dept/delete.json",                        data: {                            id: deptId                        },                        success: function (result) {                            if (result.ret) {                                showMessage("删除部门[" + deptName + "]", "操作成功", true);                                loadDeptList();                            } else {                                showMessage("删除部门[" + deptName + "]", result.msg, false);                            }                        }                    });                }            });        }        // 选中一个部门, 加载样式, 并加载对应用户的列表并渲染        function handleDeptSelected(deptId) {            if (lastClickDeptId != -1) {                var lastDept = $("#dept_" + lastClickDeptId + " .dd2-content:first");                lastDept.removeClass("btn-yellow");                lastDept.removeClass("no-hover");            }            var currentDept = $("#dept_" + deptId + " .dd2-content:first");            currentDept.addClass("btn-yellow");            currentDept.addClass("no-hover");            lastClickDeptId = deptId;            loadUserList(deptId);        }        // 加载部门下用户信息,并渲染        function loadUserList(deptId) {            var pageSize = $("#pageSize").val();            var pageNo = $("#pageNo").val() | 1;            $.ajax({                url: "/sys/user/list.json",                data: {                    deptId: deptId,                    pageSize: pageSize,                    pageNo: pageNo                },                success: function (result) {                    if (result.ret) {                        console.log(deptMap[deptId]);                        var rendered = Mustache.render(userListTemplate,                            {                                "userList": result.data.data,                                "showDeptName": function () {                                    return deptMap[this.deptId].name;                                },                                "showStatus": function () {                                    return this.status == 1 ? "有效" : (this.status == 0 ? "无效" : "删除");                                }                            }                        );                        $('#userList').html(rendered);                        var total = result.data.total;                        var from = (pageNo - 1) * pageSize + 1;                        var view = {                            total: total,                            pageNo: pageNo,                            from: from > total ? total : from,                            to: (from + pageSize) > total ? total : (from + pageSize)                        };                        $("#userPage").html(Mustache.render(paginateTemplate, view));                    } else {                        showMessage("获取部门下用户列表", result.msg, false);                    }                }            });        }        // 与后端交互, 新增或更新部门        function updateDept(isCreate, successCallback, failCallback) {            $.ajax({                url: isCreate ? "/sys/dept/save.json" : "/sys/dept/update.json",                data: $("#deptForm").serializeArray(),                type: 'POST',                success: function (result) {                    if (result.ret) {                        loadDeptList();                        if (successCallback) {                            successCallback(result);                        }                    } else {                        if(failCallback) {                            failCallback(result);                        }                    }                }            });        }        // 展示提示信息        function showMessage(title, msg, isSuccess) {            if(!isSuccess) {                msg = msg || '';            } else {                msg = msg || '操作成功'            }            $.gritter.add({                title: title,                text: msg != '' ? msg : "服务器处理异常, 建议刷新页面来保证数据是最新的",                time: '',                class_name: (isSuccess ? 'gritter-success' : 'gritter-warning') + (!$('#gritter-light').get(0).checked ? ' gritter-light' : '')            });        }    });</script></body></html>