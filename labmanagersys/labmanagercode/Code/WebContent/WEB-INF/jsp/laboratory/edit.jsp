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
    <script src="${ctx}/resource/AJAX.js"></script>

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
    <title>修改</title>
</head>
<body onload="load()">
<!--添加用户图层-->
<form action="laboratory_update.do" method="post" class="form form-horizontal" id="update" >
    <input value="${bean.id}" name="id"  type="hidden" class="text_add"/>
    <div class="add_menber" id="add_menber_update" style="height:350px;overflow-y:auto">
        <ul>
        <li class="adderss" id="test1"><label class="label_name" style="width: 130px">试剂名称：</label>
            <span class="add_name">
                <input value="${bean.productname}" name="productname" type="text" id="productname" class="text_add"/>
            </span>
        </li>
        <li class="adderss">
            <label class="label_name"style="width: 130px">单价：</label>
            <span class="add_name">
            <input value="${bean.unitprice}" name="unitprice" type="text" id="unitprice" class="text_add" onchange="changevalue()"/>
        </span>
        </li>
        <li class="adderss"><label class="label_name" style="width: 130px">计量单位：</label>
                <span class="add_name">
                      <input value="${bean.umeasurement}" name="umeasurement" type="text" id="umeasurement" class="text_add" style=" width:350px"/>
                </span>
        </li>
        <li class="adderss"><label class="label_name" style="width: 130px">购买数量：</label>
            <span class="add_name">
                <input value="${bean.num}"  name="num" type="text" id="num" class="text_add" onchange="changevalue()"/>
            </span>
            <div class="prompt r_f"></div></li>
        <li class="adderss"><label class="label_name" style="width: 130px">总价：</label>
                    <span class="add_name">
                        <input value="${bean.price}"  name="price" type="text" id="price" class="text_add" style=" width:350px"/>
                    </span>
        </li>
        <li class="adderss"><label class="label_name" style="width: 130px">产品编号：</label>
            <span class="add_name">
                <input value="${bean.productnum}" name="productnum" type="text" id="productnum" class="text_add" style=" width:350px"/>
            </span>
        </li>
        <li class="adderss"><label class="label_name" style="width: 130px">生产商：</label>
                    <span class="add_name">
                        <input value="${bean.manufacturer}" name="manufacturer" type="text" id="manufacturer" class="text_add" style=" width:350px"/>
                    </span>
        </li>
              <li class="adderss"><label class="label_name" style="width: 130px">供应商：</label>
                     <span class="add_name">
                         <input value="${bean.provider}" name="provider" type="text" id="provider" class="text_add" style=" width:350px"/>
                     </span>
              </li>
               <li class="adderss"><label class="label_name" style="width: 130px">用途：</label>
                            <span class="add_name">
                            <select name="purpose" class="text_add" id="purpose" style=" width:350px" value="${bean.purpose}">
                            <option value="公用">公用</option>
                            <option value="私用">私用</option>
                            </select>

                            </span>
                        </li>
                <li class="adderss"><label class="label_name" style="width: 130px">实验目的：</label>
                            <span class="add_name">
                                <input value="${bean.expurpose}" name="expurpose" type="text" id="expurpose" class="text_add" style=" width:350px"/>
                            </span>
                        </li>

        </ul>
    </div>
        <div style="float: left; margin-top: 50px; margin-left: 40%">
            <input class="btn btn-primary radius" type="button"  onclick="save_info();" id="submit" value="提交" >
        </div>
        <div style="float: left; margin-top: 50px; margin-left: 40%">
             <input class="btn btn-primary radius" type="button"  onclick="finish();" id="finish" value="确认完成" >
        </div>
</form>
<script>
    function load(){
    console.log(${bean.id});
   // console.log(${bean});
    if(${bean.status}=="已审批"){
        $('.text_add').attr("disabled", true);
       document.getElementById('submit').style.display = "none";
       document.getElementById('finish').style.display = "";
    }
    else if (${bean.status}=='待审批'){

        document.getElementById('test1').style.display = "none";
        document.getElementById('submit').style.display = "";
        document.getElementById('finish').style.display = "none";
    }


    }

    function finish(){

    }
    function save_info(){
        var num=0;
        var str="";
        $(".add_menber_update input[type$='text']").each(function(n){
            if($(this).val()==""){
                layer.alert(str+=""+$(this).attr("id")+"不能为空！\r\n",{
                    title: '提示框',
                    icon:0,
                });
                num++;
                return false;
            }
        });
        if(num>0){  return false;}
        else{
            AJAX("laboratory_update.do", "修改成功", "update");
        }
    };
     function changevalue(){
            if($('#unitprice').val()!=''&&$('#num').val()!=''){
            let unitprice=parseInt($('#unitprice').val());
            let num=parseInt($('#num').val());
            let price=String(unitprice*num);
            $('#price').val(price);
            }
        }
</script>
</body>

</html>