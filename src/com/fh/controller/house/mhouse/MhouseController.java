package com.fh.controller.house.mhouse;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.service.house.mhouse.MhouseManager;
import com.fh.service.information.pictures.PicturesManager;
import com.sun.org.apache.bcel.internal.generic.NEW;

/** 
 * 说明：卖房信息
 * 创建人：FH Q313596790
 * 创建时间：2016-09-25
 */
@Controller
@RequestMapping(value="/mhouse")
public class MhouseController extends BaseController {
	
	String menuUrl = "mhouse/list.do"; //菜单地址(权限用)
	@Resource(name="mhouseService")
	private MhouseManager mhouseService;
	@Resource(name="picturesService")
	private PicturesManager picturesService;
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Mhouse");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MHOUSE_ID", this.get32UUID());	//主键
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		pd.put("USERID", user.getUSER_ID());  
		pd.put("CZR", user.getNAME()); 
		pd.put("CZSJ",new Date()); 
		int CSXZ = Integer.parseInt(pd.get("ZCS").toString());
		if(CSXZ <= 7)
			pd.put("CSXZ", "多层");
		else if(CSXZ >7 && CSXZ <=12)
			pd.put("CSXZ", "小高层");
		else if(CSXZ >12 && CSXZ <=24)
			pd.put("CSXZ", "中高层");
		else
			pd.put("CSXZ", "大高层");
		
		mhouseService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Mhouse");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		mhouseService.delete(pd);
		out.write("success");
		out.close();
	}    
	/**判断唯一
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/bhIsOne")
	@ResponseBody
	public Object bhIsOne() {
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(mhouseService.findByBh(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Mhouse");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		pd.put("USERID", user.getUSER_ID());  
		pd.put("CZR", user.getNAME()); 
		pd.put("CZSJ",new Date()); 
		
		int CSXZ = Integer.parseInt(pd.get("ZCS").toString());
		if(CSXZ <= 7)
			pd.put("CSXZ", "多层");
		else if(CSXZ >7 && CSXZ <=12)
			pd.put("CSXZ", "小高层");
		else if(CSXZ >12 && CSXZ <=24)
			pd.put("CSXZ", "中高层");
		else
			pd.put("CSXZ", "大高层");
		
		mhouseService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**内部人浏览列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Mhouse");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		String name = pd.getString("name");
		String sjzmj = pd.getString("sjzmj");
		String lastLoginStart = pd.getString("lastLoginStart");
		String lastLoginEnd = pd.getString("lastLoginEnd");
		
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String sessionUserid = user.getUSER_ID();
		mv.addObject("userid",sessionUserid);
		
		if("7".equals(name) || name == "7"){
			pd.put("keywords", user.getNAME());
			pd.put("name", Integer.parseInt(name.trim()));
		}
		else if(null != keywords && !"".equals(keywords) && null != name && !"".equals(name)){
			pd.put("keywords", keywords.trim());
			pd.put("name", Integer.parseInt(name.trim()));
		}
		
		if(null != lastLoginStart && !"".equals(lastLoginStart) && null != lastLoginEnd && !"".equals(lastLoginEnd)){
			pd.put("lastLoginStart", lastLoginStart.trim() + " 00:00:00");
			pd.put("lastLoginEnd", lastLoginEnd.trim() + " 23:59:59");
		}
		
		if(null != sjzmj && !"".equals(sjzmj))
			pd.put("sjzmj", sjzmj);
		
		page.setPd(pd);
		List<PageData>	varList = mhouseService.list(page);	//列出Zhouse列表
		mv.setViewName("house/mhouse/mhouse_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		
		return mv;
	}

	
	/**客户浏览列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list_c")
	public ModelAndView list_c(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Mhouse");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		String name = pd.getString("name");
		String sjzmj = pd.getString("sjzmj");
		String lastLoginStart = pd.getString("lastLoginStart");
		String lastLoginEnd = pd.getString("lastLoginEnd");
		
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String sessionUserid = user.getUSER_ID();
		mv.addObject("userid",sessionUserid);
		
		if("7".equals(name) || name == "7"){
			pd.put("keywords", user.getNAME());
			pd.put("name", Integer.parseInt(name.trim()));
		}
		else if(null != keywords && !"".equals(keywords) && null != name && !"".equals(name)){
			pd.put("keywords", keywords.trim());
			pd.put("name", Integer.parseInt(name.trim()));
		}
		
		if(null != lastLoginStart && !"".equals(lastLoginStart) && null != lastLoginEnd && !"".equals(lastLoginEnd)){
			pd.put("lastLoginStart", lastLoginStart.trim() + " 00:00:00");
			pd.put("lastLoginEnd", lastLoginEnd.trim() + " 23:59:59");
		}
		
		if(null != sjzmj && !"".equals(sjzmj))
			pd.put("sjzmj", sjzmj);
		
		page.setPd(pd);
		List<PageData>	varList = mhouseService.list(page);	//列出Zhouse列表
		mv.setViewName("house/mhouse/mhouse_list_c");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		
		return mv;
	}
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("house/mhouse/mhouse_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = mhouseService.findById(pd);	//根据ID读取
		mv.setViewName("house/mhouse/mhouse_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	/**去解锁页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goJiesuo")
	public ModelAndView goJiesuo()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = mhouseService.findById(pd);	//根据ID读取
		mv.setViewName("house/mhouse/mhouse_jiesuo");
		mv.addObject("msg", "jiesuo");
		mv.addObject("pd", pd);
		return mv;
	}	
	/**解锁页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/jiesuo")
	public ModelAndView jiesuo()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"解锁Mhouse");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "jiesuo")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = this.getPageData();
		pd = mhouseService.findById(pd);	//根据ID读取
		pd.put("FYBH", "0");
		mhouseService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}	
	/**去预定页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goYuding")
	public ModelAndView goYuding()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = mhouseService.findById(pd);	//根据ID读取
		mv.setViewName("house/mhouse/mhouse_yuding");
		mv.addObject("msg", "yuding");
		mv.addObject("pd", pd);
		return mv;
	}	
	/**预定页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/yuding")
	public ModelAndView yuding()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"预定Mhouse");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "yuding")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = this.getPageData();
		pd = mhouseService.findById(pd);	//根据ID读取
		pd.put("FYBH", "2");
		String bz = pd.getString("BZ");
		pd.put("BZ", bz);
		mhouseService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	 /**去浏览页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goView")
	public ModelAndView goView()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = mhouseService.findById(pd);	//根据ID读取
		mv.setViewName("house/mhouse/mhouse_view");
		mv.addObject("msg", "view");
		String bz = pd.getString("BZ");
		pd.put("BZ", pd.get("MHOUSE_ID"));
//		List<PageData>	pathList = picturesService.pathList(pd);	//列出Pictures列表
//		mv.addObject("pathList", pathList);
		pd.put("BZ", bz); 
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String sessionUserid = user.getUSER_ID();
		String zfuserid = pd.getString("USERID");
		String isuserid = "";
		if(sessionUserid.equals(zfuserid)){
			isuserid = "0";
		}else{
			isuserid = "1";
		}
		mv.addObject("isuserid",isuserid);
		mv.addObject("pd", pd);
		return mv;
	}	
	 /**去浏览页面（客户）
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goView_c")
	public ModelAndView goView_c()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = mhouseService.findById(pd);	//根据ID读取
		mv.setViewName("house/mhouse/mhouse_view_c");
		mv.addObject("msg", "view");
		String bz = pd.getString("BZ");
		pd.put("BZ", pd.get("MHOUSE_ID"));
//		List<PageData>	pathList = picturesService.pathList(pd);	//列出Pictures列表
//		mv.addObject("pathList", pathList);
		pd.put("BZ", bz); 
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String sessionUserid = user.getUSER_ID();
		String zfuserid = pd.getString("USERID");
		String isuserid = "";
		if(sessionUserid.equals(zfuserid)){
			isuserid = "0";
		}else{
			isuserid = "1";
		}
		mv.addObject("isuserid",isuserid);
		mv.addObject("pd", pd);
		return mv;
	}
	/**去预览图片
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goViewPic")
	public ModelAndView goViewPic()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = mhouseService.findById(pd);	//根据ID读取
		mv.setViewName("house/mhouse/mhouse_viewpic");
		mv.addObject("msg", "view");
		String bz = pd.getString("BZ");
		pd.put("BZ", pd.get("MHOUSE_ID"));
		List<PageData>	pathList = picturesService.pathList(pd);	//列出Pictures列表
		List<PageData>	pathnewList = new ArrayList();
		for(PageData pdn : pathList){
			String name = (String) pdn.get("PATH");
			String b = name.substring(name.length()-3, name.length());
			if(b.equals("jpg") || b.equals("JPG") || b.equals("gif") || b.equals("GIF") || b.equals("bmp")){
				pathnewList.add(pdn);
			}
		}
		mv.addObject("pathList", pathnewList);
		mv.addObject("pd", pd);
		return mv;
	}	
	/**去预览视频
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goViewVideo")
	public ModelAndView goViewVideo()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = mhouseService.findById(pd);	//根据ID读取
		mv.setViewName("house/mhouse/mhouse_viewvideo");
		mv.addObject("msg", "view");
		String bz = pd.getString("BZ");
		pd.put("BZ", pd.get("MHOUSE_ID"));
		List<PageData>	pathList = picturesService.pathList(pd);	//列出Pictures列表
		List<PageData>	pathnewList = new ArrayList();
		for(PageData pdn : pathList){
			String name = (String) pdn.get("PATH");
			String b = name.substring(name.length()-3, name.length());
			if(b.equals("mp4")){
				pathnewList.add(pdn);
			}
		}
		mv.addObject("pathList", pathnewList);
		mv.addObject("pd", pd);
		return mv;
	}	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Mhouse");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			mhouseService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	 /**批量归档
		 * @param
		 * @throws Exception
		 */
		@RequestMapping(value="/guidangAll")
		@ResponseBody
		public Object guidangAll() throws Exception{
			logBefore(logger, Jurisdiction.getUsername()+"批量归档Mhouse");
			if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
			PageData pd = new PageData();		
			Map<String,Object> map = new HashMap<String,Object>();
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				mhouseService.guidangAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
			return AppUtil.returnObject(pd, map);
		}
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Mhouse到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("图符丘幢号");	//1
		titles.add("小区名称");	//2
		titles.add("房屋坐落");	//3
		titles.add("所在层数");	//4
		titles.add("总层数");	//5
		titles.add("房屋朝向");	//6
		titles.add("建筑面积");	//7
		titles.add("建成年份");	//8
		titles.add("房源户式");	//9
		titles.add("产权类别");	//10
		titles.add("权证年限");	//11
		titles.add("是否为首套");	//12
		titles.add("装修程度");	//13
		titles.add("物业公司");	//14
		titles.add("是否钥匙委托");	//15
		titles.add("房主电话");	//16
		titles.add("产权人");	//17
		titles.add("房屋来源");	//18
		titles.add("房源类别");	//19
		titles.add("房源保护");	//20
		titles.add("备注");	//21
		dataMap.put("titles", titles);
		List<PageData> varOList = mhouseService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("TFQZH"));	//1
			vpd.put("var2", varOList.get(i).getString("XQMC"));	//2
			vpd.put("var3", varOList.get(i).getString("FWZL"));	//3
			vpd.put("var4", varOList.get(i).get("SZCS").toString());	//4
			vpd.put("var5", varOList.get(i).get("ZCS").toString());	//5
			vpd.put("var6", varOList.get(i).getString("FWCX"));	//6
			vpd.put("var7", varOList.get(i).get("JZMJ").toString());	//7
			vpd.put("var8", varOList.get(i).getString("JCNF"));	//8
			vpd.put("var9", varOList.get(i).getString("FYHS"));	//9
			vpd.put("var10", varOList.get(i).getString("CQLB"));	//10
			vpd.put("var11", varOList.get(i).getString("QZNX"));	//11
			vpd.put("var12", varOList.get(i).getString("ISONLYONE"));	//12
			vpd.put("var13", varOList.get(i).getString("ZXCD"));	//13
			vpd.put("var14", varOList.get(i).getString("WYGS"));	//14
			vpd.put("var15", varOList.get(i).getString("YNKEY"));	//15
			vpd.put("var16", varOList.get(i).getString("TEL"));	//16
			vpd.put("var17", varOList.get(i).getString("CQR"));	//17
			vpd.put("var18", varOList.get(i).getString("FWLY"));	//18
			vpd.put("var19", varOList.get(i).getString("FYLB"));	//19
			vpd.put("var20", varOList.get(i).getString("FYBH"));	//20
			vpd.put("var21", varOList.get(i).getString("BZ"));	//21
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
