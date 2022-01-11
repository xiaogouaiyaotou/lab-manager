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
    <link rel="stylesheet" href="${ctx}/resource/assets/css/font-awesome-ie7.min.css" />
    <link rel="stylesheet" href="${ctx}/resource/assets/css/ace-ie.min.css" />
    <script src="${ctx}/resource/assets/js/jquery.min.js"></script>

    <script src="${ctx}/resource/assets/js/bootstrap.min.js"></script>
    <script src="${ctx}/resource/assets/js/typeahead-bs2.min.js"></script>
    <script src="${ctx}/resource/assets/js/jquery.dataTables.min.js"></script>
    <script src="${ctx}/resource/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="${ctx}/resource/js/H-ui.js"></script>
    <script type="text/javascript" src="${ctx}/resource/js/H-ui.admin.js"></script>
    <script src="${ctx}/resource/assets/layer/layer.js" type="text/javascript" ></script>
    <script src="${ctx}/resource/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${ctx}/resource/AJAX.js" type="text/javascript"></script>
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
            <form method="post" action="equipment_list.do">
            <div class="search_style">
                <ul class="search_content clearfix">
                    <li><label class="l_f">contruct_id</label><input name="contruct_id" type="text" value="${bean.contruct_id}" class="text_add"  style=" width:200px"/></li>
                    <li><label class="l_f">original_id</label><input name="original_id" type="text" value="${bean.original_id}" class="text_add"  style=" width:200px"/></li>
                    <li><label class="l_f">vector_backbone</label><input name="vector_backbone" type="text" value="${bean.vector_backbone}" class="text_add"  style=" width:200px"/></li>
                    <li style="width:90px;"><button type="submit" class="btn_search"><i class="icon-search"></i>查询</button></li>
                </ul>
            </div>
                </form>
            <!---->
            <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加质粒</a>
       </span>
            </div>
            <div class="table_menu_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="100">Contruct ID</th>
                        <th width="130">Expression cassettes</th>
                        <th width="120">Original ID</th>
                        <th width="120">Vector Backbone</th>
                        <th width="120">Target</th>
                        <th width="250">Bacterium Selection</th>
                        <th width="250">Plant Selection</th>
                        <th width="250">Note</th>
                        <th width="250">Builder ID</th>
                        <th width="250">备注</th>
                        <th width="250">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${pagers.datas}" var="c" varStatus="l">
                        <tr>
                        <td>${c.contruct_id}</td>
                        <td>${c.expression_cassettes}</td>
                        <td>${c.original_id}</td>
                        <td>${c.vector_backbone}</td>
                        <td>${c.target}</td>
                        <td>${c.bacterium_selection}</td>
                        <td>${c.plant_selection}</td>
                        <td>${c.note}</td>
                        <td>${c.builder_id}</td>
                        <td>${c.remark}</td>
                        <td class="td-manage">
                            <%--<a onClick="member_stop(this,'10001')"  href="javascript:;" title="停用"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>--%>
                            <c:if test="${role == 'admin' or role=='js'}">
                            <a title="编辑" onclick="edit('${c.contruct_id}')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a>
                            <a title="删除" href="javascript:;"  onclick="member_del('${c.contruct_id}');" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
                            </c:if>
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
        <pg:pager url="${ctx}/equipment_list.do" maxIndexPages="5" items="${pagers.total}" maxPageItems="15"
                  export="curPage=pageNumber">
            <pg:param name="contruct_id" value="${bean.contruct_id}"/>
            <pg:param name="original_id" value="${bean.original_id}"/>
            <pg:param name="target" value="${bean.target}"/>
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
<form action="equipment_save.do" method="post" class="form form-horizontal" id="form-user-add" >
<div class="add_menber" id="add_menber_style" style="display:none">
    <ul>
    <li><label class="label_name" style="width: 130px">contruct_id：</label>
                <span class="add_name">
                    <input value="" name="contruct_id" type="text" id="contruct_id" class="text_add"/>
                </span>
            </li>
        <li class="adderss"><label class="label_name" style="width: 130px">expression_cassettes：</label>
                    <span class="add_name">
                        <input name="expression_cassettes" type="text" id="expression_cassettes" class="text_add" style=" width:350px"/>
                    </span>
                </li>
        <li><label class="label_name" style="width: 130px">original_id：</label>
            <span class="add_name">
                <input value="" name="original_id" type="text" id="original_id" class="text_add"/>
            </span>
        </li>

        <li><label class="label_name" style="width: 130px">vector_backbone：</label>
            <span class="add_name">
                <input name="vector_backbone" type="text" id="vector_backbone" class="text_add"/>
            </span>
            <div class="pro mpt r_f"></div></li>
        <li class="adderss"><label class="label_name" style="width: 130px">target：</label>
            <span class="add_name">
               <input name="target" type="text" id="target" class="text_add" style=" width:350px"/>
            </span>
            </li>
        <li><label class="label_name" style="width: 130px">bacterium_selection：</label>
            <span class="add_name">
                <input value="" name="bacterium_selection" type="text" id="bacterium_selection" class="text_add"/>
            </span>
        </li>

        <li><label class="label_name" style="width: 130px">plant_selection：</label>
            <span class="add_name">
                <input name="plant_selection" type="text" id="plant_selection" class="text_add"/>
            </span>
            <div class="pro mpt r_f"></div></li>
        <li><label class="label_name" style="width: 130px">Note：</label>
             <span class="add_name">
                  <input name="note" type="text" id="note" class="text_add"/>
             </span>
            <div class="pro mpt r_f"></div></li>
        <li><label class="label_name" style="width: 130px">Builder：</label>
             <span class="add_name">
                  <input name="builder_id" type="text" id="builder_id" class="text_add"/>
             </span>
            <div class="pro mpt r_f"></div></li>

        <li class="adderss"><label class="label_name" style="width: 130px">备注：</label>
            <span class="add_name">
               <textarea row="6" cols="60" id="remark" class="text_add" name="remark"></textarea>
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
            title: '添加质粒',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area : ['800px' , '400px'],
            content:$('#add_menber_style'),
            btn:['提交','取消'],
            yes:function(index,layero){
                var num=0;
                var str="";
                $(".add_menber input[type$='text']").each(function(n){
                    if($(this).val()=="" && $(this).attr("id")!="remark"){
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
                    url: "equipment_save.do",
                    data:$('#form-user-add').serialize(),// 你的formid
                    async: false,
                    success:function(data){
                        if(data.flag){
                            layer.msg('添加成功',{
                                icon:1,
                                time:1000
                            },function(){
                                var index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
                                layer.close(index);
                                window.location.href = data.url;
                            })
                        }
                    }

                })
                }
            }
        });
    });

    function edit(id) {
        layer.open({
            type: 2,
            area: ['910px', '500px'],
            content: ['equipment_edit.do?contructId=' + id, 'no']  //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
        });
    }
    /*用户-删除*/
    function member_del(contruct_id){
        layer.confirm('确认要删除吗？',function(){
                       $.ajax({
                           cache: true,
                           type: "post",
                           url: "equipment_delete.do",
                           data: {contruct_id: contruct_id},// 你的formid
                           async: false,
                           success: function (data) {
                               if (data.flag) {
                                   layer.msg('删除成功', {
                                       icon: 1,
                                       time: 2000 //2秒关闭（如果不配置，默认是3秒）
                                   }, function () {
                                       var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                                       parent.layer.close(index); //再执行关闭
                                       window.location.href = data.url;
                                   });
                               } else {
                                   layer.msg('删除失败', {
                                       icon: 1,
                                       time: 2000
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