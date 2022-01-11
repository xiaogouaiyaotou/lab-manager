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
    <script src="${ctx}/resource/js/jquery-1.9.1.min.js"></script>
    <script src="${ctx}/resource/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="${ctx}/resource/assets/js/jquery.ui.touch-punch.min.js"></script>
    <script src="${ctx}/resource/assets/js/ace-elements.min.js"></script>
    <script src="${ctx}/resource/assets/js/ace.min.js"></script>
    <script src="${ctx}/resource/AjaxUtil.js"></script>


    <title>设备列表</title>
    <script>
        $(function () {
            alert(${login})
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
            <form method="post" action="PrimeInfo_list.do">
            <div class="search_style">
                <ul class="search_content clearfix">
                    <li><label class="l_f">设备型号</label><input name="contruct_id" type="text" value="${bean.contruct_id}" class="text_add"  style=" width:200px"/></li>
                    <li><label class="l_f">设备制造商</label><input name="expression_cassettes" type="text" value="${bean.expression_cassettes}" class="text_add"  style=" width:200px"/></li>
                    <li><label class="l_f">设备序列号</label><input name="original_id" type="text" value="${bean.original_id}" class="text_add"  style=" width:200px"/></li>
                    <li style="width:90px;"><button type="submit" class="btn_search"><i class="icon-search"></i>查询</button></li>
                </ul>
            </div>
                </form>
            <div class="border clearfix">
               <span class="l_f">
                <a href="javascript:;" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加引物信息</a>
               </span>
            </div>
            <div class="table_menu_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="120">名称</th>
                        <th width="250">描述</th>
                        <th width="200">文件</th>
                        <th width="120">创建时间</th>
                        <th width="250">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${pagers.datas}" var="c" varStatus="l">
                        <tr>
                        <td>${c.title}</td>
                        <td>${c.description}</td>
                        <td>
                            <c:if test="${not empty c.title}">
                            <a href="equipment_download.do?id=${c.id}"><span class="label label-success radius">查看说明书</span></a>
                            </c:if>
                            <c:if test="${empty c.title}">
                            <span class="label label-defaunt radius">无</span>
                            </c:if>
                        </td>
                        <td>${c.createtime}</td>
                        <td class="td-manage">
                            <%--<a onClick="member_stop(this,'10001')"  href="javascript:;" title="停用"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>--%>
                                <%--<a href="javascript:;" id="member_add1" class="btn btn-warning"><i class="icon-plus"></i>添加实验室</a>--%>
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
        <pg:pager url="${ctx}/PrimeInfo_list.do" maxIndexPages="5" items="${pagers.total}" maxPageItems="15"
                  export="curPage=pageNumber">
            <pg:param name="xh" value="${bean.contruct_id}"/>
            <pg:param name="zzs" value="${bean.expression_cassettes}"/>
            <pg:param name="sbxlh" value="${bean.original_id}"/>
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
<form action="equipment_updateprimedoc.do" method="post" class="form form-horizontal" id="form-user-add" enctype="multipart/form-data">
<div class="add_menber" id="add_menber_style" style="display:none; margin-top: 50px; text-align: center; ">
    <ul>
    <li><label class="label_name" style="width: 130px">名字：</label>
                <span class="add_name">
                    <input value="" name="title" type="text" id="title" class="text_add"/>
                </span>
            </li>
        <li class="adderss"><label class="label_name" style="width: 130px">描述：</label>
                    <span class="add_name">
                    <textarea row="6" cols="60" id="description" class="text_add" name="description"></textarea>
                    </span>
                </li>
    </ul>
    <div class="form-group" style="width: 100%">
        <label class="col-sm-1 control-label no-padding-right" for="form-field-1" style="width: 100px;">说明书： </label>
        <div class="col-sm-9">
            <input type="file" name="file" id="id-input-file-2" class="请选择文件" style="width: 300px"/>
            <input type="hidden" name="id" id="isId" value=""/>
        </div>

    </div>
    <%--<input type="submit" value="提交"/>--%>
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
                $('#form-user-add').submit();
                }
            }
        });
    });

    $('#id-input-file-2').ace_file_input({
        no_file:'选择上传图片 ...',
        btn_choose:'选择',
        btn_change:'更改',
        droppable:false,
        onchange:null,
        scrollbar: false,
        thumbnail:false, //| true | large
        whitelist:'doc'
        //blacklist:'exe|php'
        //onchange:''
        //
    });

    function  cli(id) {
        $('#isId').val(id);
        layer.open({
            type: 1,
            title: '添加合同',
            maxmin: true,
            scrollbar: false,
            shadeClose: true, //点击遮罩关闭层
            area : ['900px' , '300px'],
            content:$('#add_menber_style'),
            btn:['提交','取消'],
            yes:function(index,layero){
                var num=0;
                var str="";
                $(".add_menber input[type$='file']").each(function(n){
                    if($(this).val()==""){
                        layer.alert(str+=""+$(this).attr("class"),{
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
                    $('#form-user-add').submit();
                }
            }
        });

    }


    function edit(id) {
        layer.open({
            type: 2,
            area: ['910px', '500px'],
            content: ['laboratory_edit.do?laboratoryId=' + id, 'no']  //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
        });
    }

    function sh(id) {
        updateId("equipment_updateSh.do", "使用成功", id);
    }

        function member_del(id){
            layer.confirm('确认要删除吗？',function(){
                           $.ajax({
                               cache: true,
                               type: "post",
                               url: "equipment_primedelete.do",
                               data: {id: id},// 你的formid
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