<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${ctx}/resource/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${ctx}/resource/css/style.css"/>
    <link href="${ctx}/resource/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/resource/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${ctx}/resource/assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="${ctx}/resource/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${ctx}/resource/assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="${ctx}/resource/assets/js/jquery.min.js"></script>

    <!-- <![endif]-->

    <!--[if IE]>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <![endif]-->

    <!--[if !IE]> -->

    <script type="text/javascript">
        window.jQuery || document.write("<script src='${ctx}/resource/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
    </script>

    <!-- <![endif]-->

    <!--[if IE]>
    <script type="text/javascript">
        window.jQuery || document.write("<script src='${ctx}/resource/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
    </script>
    <![endif]-->

    <script src="${ctx}/resource/assets/js/bootstrap.min.js"></script>
    <script src="${ctx}/resource/assets/js/typeahead-bs2.min.js"></script>
    <!-- page specific plugin scripts -->
    <script src="${ctx}/resource/assets/js/jquery.dataTables.min.js"></script>
    <script src="${ctx}/resource/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="${ctx}/resource/js/H-ui.js"></script>
    <script type="text/javascript" src="${ctx}/resource/js/H-ui.admin.js"></script>
    <script src="${ctx}/resource/assets/layer/layer.js" type="text/javascript" ></script>
    <script src="${ctx}/resource/assets/laydate/laydate.js" type="text/javascript"></script>
    <title>实验室列表</title>
    <script>
        $(function () {
            if (${login} == 1){
                top.location = 'login_login.do';
            }
        })
    </script>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
        <div class="d_Confirm_Order_style">
            <form method="post" action="laboratory_list.do">
            <div class="search_style">
                <ul class="search_content clearfix">
                    <li><label class="l_f">产品名称</label><input name="productname" type="text" value="${laboratory.productname}" class="text_add"  style=" width:200px"/></li>
                    <li><label class="l_f">负责人</label><input name="applicant" type="text" value="${laboratory.applicant}" class="text_add"  style=" width:200px"/></li>
                    <li style="width:90px;"><button type="submit" class="btn_search"><i class="icon-search"></i>查询</button></li>
                </ul>
            </div>
                </form>
            <!---->
            <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加实验室</a>
       </span>
            </div>
            <!---->
            <div class="table_menu_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="200">申请人</th>
                        <th width="300">申请日期</th>
                        <th width="300">产品名称</th>
                        <th width="300">产品编号</th>
                        <th width="200">生产商</th>
                        <th width="200">供应商</th>
                        <th width="120">购买数量</th>
                        <th width="120">计量单位</th>
                        <th width="120">单价</th>
                        <th width="120">总价</th>
                        <th width="120">用途</th>
                        <th width="300">实验目的</th>
                        <th width="300">收货时间</th>
                        <th width="300">实际价格</th>
                        <th width="300">已收到数量</th>
                        <th width="300">存放位置</th>
                        <th width="120">状态</th>
                        <th width="120">操作</th>

                    </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${pagers.datas}" var="c" varStatus="l">
                        <tr>
                        <!--
                        <td><u style="cursor:pointer" class="text-primary" >${c.id}</u></td>
                        -->
                        <td>${c.applicant}</td>
                        <td>${c.applydate}</td>
                        <td>${c.productname}</td>
                        <td>${c.productnum}</td>
                        <td>${c.manufacturer}</td>
                        <td>${c.provider}</td>
                        <td>${c.num}</td>
                        <td>${c.umeasurement}</td>
                        <td>${c.unitprice}</td>
                        <td>${c.price}</td>
                        <td>${c.purpose}</td>
                        <td>${c.expurpose}</td>
                        <td>${c.receiptdate}</td>
                        <td>${c.actprice}</td>
                        <td>${c.receiptnum}</td>
                        <td>${c.location}</td>
                        <td>${c.status}</td>
                        <td class="td-manage">
                            <%--<a onClick="member_stop(this,'10001')"  href="javascript:;" title="停用"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>--%>
                            <c:if test="${c.status == '待审批'}">
                            <a title="编辑" onclick="edit(${c.id})" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a>
                            <c:if test="${role == 'admin' or role=='js'}">
                                <a title="审批" href="javascript:;"  onclick="approve(${c.id})" class="btn btn-xs btn-warning" ><i class="icon-ok  bigger-120"></i></a>
                            </c:if>
                            </c:if>
                            <c:if test="${c.status == '已审批'}">
                            <a title="完成" href="javascript:;"  onclick="receive(${c.id})" class="btn btn-xs btn-warning" ><i class="icon-truck  bigger-120"></i></a>
                            </c:if>
                            <a title="删除" href="javascript:;"  onclick="member_del(${c.id})" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
                        </td>

                    </tr>
                          </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- 分页开始 -->
    <div class="pagelist">
        <pg:pager url="${ctx}/laboratory_list.do" maxIndexPages="5" items="${pagers.total}" maxPageItems="15"
                  export="curPage=pageNumber">
            <pg:param name="productname" value="${laboratory.productname}"/>
            <pg:param name="applicant" value="${laboratory.applicant}"/>
            <pg:last>
                共${pagers.total}记录,共${pageNumber}页,
            </pg:last>
            当前第${curPage}页
            <pg:first>
                <a href="${pageUrl}">首页</a>
            </pg:first>
            <pg:prev>
                <a href="${pageUrl}">上一页</a>
            </pg:prev>
            <pg:pages>
                <c:choose>
                    <c:when test="${curPage eq pageNumber}">
                        <font color="red"><span class="current">${pageNumber }</span></font>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageUrl}">${pageNumber}</a>
                    </c:otherwise>
                </c:choose>
            </pg:pages>
            <pg:next>
                <a href="${pageUrl}">下一页</a>
            </pg:next>
            <pg:last>
                <c:choose>
                    <c:when test="${curPage eq pageNumber}">
                        <a href="##">尾页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageUrl}">尾页</a>
                    </c:otherwise>
                </c:choose>

            </pg:last>
        </pg:pager>
    </div>
    <!-- 分页结束 -->
</div>

<!--添加用户图层-->
<form action="laboratory_save.do" method="post" class="form form-horizontal" id="form-user-add" >

<div class="add_menber" id="add_menber_style" style="display:none">
    <ul>
        <li class="adderss"><label class="label_name" style="width: 130px">试剂名称：</label>
            <span class="add_name">
                <input value="" name="productname" type="text" id="productname" class="text_add"/>
            </span>
        </li>
        <li class="adderss">
            <label class="label_name"style="width: 130px">单价：</label>
            <span class="add_name">
            <input name="unitprice" type="text" id="unitprice" class="text_add" onchange="changevalue()"/>
        </span>
        </li>
        <li class="adderss"><label class="label_name" style="width: 130px">计量单位：</label>
                <span class="add_name">
                      <input name="umeasurement" type="text" id="umeasurement" class="text_add" style=" width:350px"/>
                </span>
        </li>
        <li class="adderss"><label class="label_name" style="width: 130px">购买数量：</label>
            <span class="add_name">
                <input name="num" type="text" id="num" class="text_add" onchange="changevalue()"/>
            </span>
            <div class="prompt r_f"></div></li>
        <li class="adderss"><label class="label_name" style="width: 130px">总价：</label>
                    <span class="add_name">
                        <input value=''  name="price" type="text" id="price" class="text_add" style=" width:350px"/>
                    </span>
        </li>
        <li class="adderss"><label class="label_name" style="width: 130px">产品编号：</label>
            <span class="add_name">
                <input name="productnum" type="text" id="productnum" class="text_add" style=" width:350px"/>
            </span>
        </li>
        <li class="adderss"><label class="label_name" style="width: 130px">生产商：</label>
            <span class="add_name">
                <input name="manufacturer" type="text" id="manufacturer" class="text_add" style=" width:350px"/>
            </span>
        </li>
                <li class="adderss"><label class="label_name" style="width: 130px">供应商：</label>
                    <span class="add_name">
                        <input name="provider" type="text" id="provider" class="text_add" style=" width:350px"/>
                    </span>
                </li>
        <li class="adderss"><label class="label_name" style="width: 130px">用途：</label>
                    <span class="add_name">
                    <select name="purpose" id="purpose" style=" width:350px">
                    <option value="公用">公用</option>
                    <option value="私用">私用</option>
                    </select>

                    </span>
                </li>
        <li class="adderss"><label class="label_name" style="width: 130px">实验目的：</label>
                    <span class="add_name">
                        <input name="expurpose" type="text" id="expurpose" class="text_add" style=" width:350px"/>
                    </span>
                </li>

    </ul>
</div>
    </form>
</body>
</html>
<script>
    /*用户-添加*/
    $('#member_add').on('click', function(){
        layer.open({
            type: 1,
            title: '添加用户',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area : ['800px' , '400px'],
            content:$('#add_menber_style'),
            btn:['提交','取消'],
            yes:function(index,layero){
                var num=0;
                var str="";
                $(".add_menber input[type$='text']").each(function(n){
                    if($(this).val()==""){
                        layer.alert(str+=""+$(this).attr("id")+"不能为空！\r\n",{
                            title: '提示框',
                            icon:0,
                        });
                        num++;
                        return false;
                    }
                });
                if(num>0){
                    return false;
                }else{
                    $.ajax({
                        cache: true,
                        type: "post",
                        url: "laboratory_save.do",
                        data:$('#form-user-add').serialize(),// 你的formid
                        async: false,
                        success: function(data){
                            if (data.flag){
                                layer.msg('添加成功', {
                                    icon: 1,
                                    time: 2000 //2秒关闭（如果不配置，默认是3秒）
                                }, function(){
                                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
//                                    parent.layer.close(index); //再执行关闭
                                    layer.close(index);
                                    window.location.href = data.url;
                                });
                            }
                        }
                    });
                }
            }
        });
    });
    function changevalue(){
        if($('#unitprice').val()!=''&&$('#num').val()!=''){
        let unitprice=parseInt($('#unitprice').val());
        let num=parseInt($('#num').val());
        let price=String(unitprice*num);
        $('#price').val(price);
        }
    }
    function edit(id) {
        layer.open({
            type: 2,
            area: ['910px', '500px'],
            content: ['laboratory_edit.do?laboratoryId=' + id, 'no']
        });
    }
    function receive(id) {
            layer.open({
                type: 2,
                area: ['910px', '500px'],
                content: ['laboratory_receive.do?laboratoryId=' + id, 'no']
            });
        }

    function approve(id){
        layer.confirm('是否审批通过？',function(index){
            $.ajax({
                cache: false,
                type: "post",
                url: "laboratory_approve.do",
                data:{id: id},// 你的formid
                async: false,
                success: function(data){
                    if (data.flag){
                        layer.msg("审批完成", {
                            icon: 1,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        }, function(){
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                            window.location.href = data.url;
                        });
                    }
                }
            });
        });
    }


    /*用户-删除*/
    function member_del(id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                cache: false,
                type: "post",
                url: "laboratory_delete.do",
                data:{id: id},// 你的formid
                async: false,
                success: function(data){
                    if (data.flag){
                        layer.msg("删除成功", {
                            icon: 1,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        }, function(){
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                            window.location.href = data.url;
                        });
                    }
                }
            });
        });
    }
    laydate({
        elem: '#start',
        event: 'focus'
    });

</script>