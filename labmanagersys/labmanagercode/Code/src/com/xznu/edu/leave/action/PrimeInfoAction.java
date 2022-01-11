package com.xznu.edu.leave.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xznu.edu.leave.model.*;
import com.xznu.edu.leave.service.*;
import com.xznu.edu.leave.utils.*;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.xznu.edu.leave.dao.PrimeInfoDao;
import com.xznu.edu.leave.dao.LaboratoryDao;
import com.xznu.edu.leave.model.PrimeInfo;
import com.xznu.edu.leave.model.Laboratory;
import com.xznu.edu.leave.model.Equipment;
import com.xznu.edu.leave.service.EquipmentService;
import com.xznu.edu.leave.service.PrimeInfoService;


public class PrimeInfoAction extends ActionSupport implements ModelDriven<PrimeInfo>{
    private PrimeInfo primeinfo;
    @Autowired
    private PrimeInfoService primeinfoService;
    @Autowired
    private EquipmentService equipmentService;
    private Equipment equipment;
    private Map<String, Object> map = new HashMap();
    private File file;
    private String title;
    private String describe;

    /**
     * list
     *
     * @return
     */
    public String list() {
        User user1 = UserUtils.getUser();
        if (user1 == null || user1.getId() == null) {
            ActionContext.getContext().put("login", 1);
            return SUCCESS;
        }

        Pager<PrimeInfo> pagers = null;
        Role role = user1.getRole();
        pagers = primeinfoService.getList(primeinfo);
        ActionContext.getContext().put("pagers", pagers);
        ActionContext.getContext().put("user", user1);
        Pager<PrimeInfo> pagers2 = primeinfoService.getList(null);
//            System.out.println(equipmentService.findid());
        ActionContext.getContext().put("pagers2", pagers2);
        ActionContext.getContext().put("role", role.getEnName());
        ActionContext.getContext().put("bean", primeinfo);
        return SUCCESS;
    }

    /**
     * list
     *
     * @return
     */
    public String dataList() {
        User user1 = UserUtils.getUser();
        if (user1 == null || user1.getId() == null) {
            ActionContext.getContext().put("login", 1);
            return SUCCESS;
        }
        Pager<Equipment> pagers = null;
        Role role = user1.getRole();
        if (role.getEnName().equals("admin")) {
            pagers = equipmentService.getList(equipment);
            ActionContext.getContext().put("pagers", pagers);
            ActionContext.getContext().put("user", user1);
//            Pager<Laboratory> pagers2 = laboratoryService.getList(null);
//            ActionContext.getContext().put("pagers2", pagers2);
            ActionContext.getContext().put("bean", equipment);

        }
        return SUCCESS;
    }

    /**
     * 保存
     *
     * @return
     */
    public String save() throws IOException {
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String adate=dateFormat.format(now);
        primeinfo.setCreatetime(adate);
        primeinfoService.save(primeinfo);
        map.put("flag", true);
        map.put("url", "equipment_list.do");
        JsonUtils.toJson(map);
        return SUCCESS;
    }

    @Override
    public PrimeInfo getModel() {
        if (primeinfo == null) {
            primeinfo = new PrimeInfo();
        }
        return primeinfo;
    }
    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }
}
