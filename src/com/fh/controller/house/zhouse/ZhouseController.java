
package com.fh.controller.house.zhouse;

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
import com.fh.service.house.zhouse.ZhouseManager;
import com.fh.service.information.pictures.PicturesManager;

/** 
 * 说明：租房信息
 * 创建人：FH Q313596790
 * 创建时间：2016-11-12
 */
@Controller
@RequestMapping(value="/zhouse")
public class ZhouseController extends BaseController {
	
	String menuUrl = "zhouse/list.do"; //菜单地址(权限用)
	@Resource(name="zhouseService")
	private ZhouseManager zhouseService;
	@Resource(name="picturesService")
	private PicturesManager picturesService;
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Zhouse");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ZHOUSE_ID", this.get32UUID());	//主键
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		pd.put("USERID", user.getUSER_ID());
		pd.put("CZR", user.getNAME()); 
		pd.put("CZSJ",new Date()); 
		zhouseService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Zhouse");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		zhouseService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Zhouse");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CZSJ",new Date()); 
		zhouseService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
		/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Zhouse");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = zhouseService.list(page);	//列出Zhouse列表
		mv.setViewName("house/zhouse/zhouse_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String sessionUserid = user.getUSER_ID();
		mv.addObject("userid",sessionUserid);
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
		mv.setViewName("house/zhouse/zhouse_edit");
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
		pd = zhouseService.findById(pd);	//根据ID读取
		mv.setViewName("house/zhouse/zhouse_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		String bz = pd.getString("BZ");
		pd.put("BZ", pd.get("ZHOUSE_ID"));
		List<PageData>	pathList = picturesService.pathList(pd);	//列出Pictures列表
		mv.addObject("pathList", pathList);
		pd.put("BZ", bz);
		return mv;
	}	


 /**去修改页面
		 * @param
		 * @throws Exception
		 */
		@RequestMapping(value="/goView")
		public ModelAndView goView()throws Exception{
			ModelAndView mv = this.getModelAndView();
			PageData pd = new PageData();
			pd = this.getPageData();
			pd = zhouseService.findById(pd);	//根据ID读取
			mv.setViewName("house/zhouse/zhouse_view");
			mv.addObject("msg", "view");
			String bz = pd.getString("BZ");
			pd.put("BZ", pd.get("ZHOUSE_ID"));
//			List<PageData>	pathList = picturesService.pathList(pd);	//列出Pictures列表
//			mv.addObject("pathList", pathList);
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
			pd = zhouseService.findById(pd);	//根据ID读取
			mv.setViewName("house/zhouse/zhouse_viewpic");
			mv.addObject("msg", "view");
			String bz = pd.getString("BZ");
			pd.put("BZ", pd.get("ZHOUSE_ID"));
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
			pd = zhouseService.findById(pd);	//根据ID读取
			mv.setViewName("house/zhouse/zhouse_viewvideo");
			mv.addObject("msg", "view");
			String bz = pd.getString("BZ");
			pd.put("BZ", pd.get("ZHOUSE_ID"));
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Zhouse");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			zhouseService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Zhouse到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("出租房源");	//1
		titles.add("小区名称");	//2
		titles.add("面积");	//3
		titles.add("户室格局");	//4
		titles.add("楼层");	//5
		titles.add("房屋朝向");	//6
		titles.add("装修情况");	//7
		titles.add("屋里物品");	//8
		titles.add("家用电器");	//9
		titles.add("月租金");	//10
		titles.add("付款方式");	//11
		titles.add("押金金额");	//12
		titles.add("水费示数");	//13
		titles.add("电费示数");	//14
		titles.add("物业归属");	//15
		titles.add("供热归属");	//16
		titles.add("房主姓名");	//17
		titles.add("联系方式");	//18
		titles.add("是否委托");	//19
		titles.add("操作人");	//20
		titles.add("操作时间");	//21
		titles.add("备注");	//22
		titles.add("1");	//23
		dataMap.put("titles", titles);
		List<PageData> varOList = zhouseService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("CZFY"));	//1
			vpd.put("var2", varOList.get(i).getString("XQMC"));	//2
			vpd.put("var3", varOList.get(i).get("FWMJ").toString());	//3
			vpd.put("var4", varOList.get(i).getString("HSGJ"));	//4
			vpd.put("var5", varOList.get(i).get("FLOOR").toString());	//5
			vpd.put("var6", varOList.get(i).getString("FWCX"));	//6
			vpd.put("var7", varOList.get(i).getString("ZXQK"));	//7
			vpd.put("var8", varOList.get(i).getString("WLWP"));	//8
			vpd.put("var9", varOList.get(i).getString("JYDQ"));	//9
			vpd.put("var10", varOList.get(i).get("YZJ").toString());	//10
			vpd.put("var11", varOList.get(i).getString("FKFS"));	//11
			vpd.put("var12", varOList.get(i).get("YJJE").toString());	//12
			vpd.put("var13", varOList.get(i).get("SFSS").toString());	//13
			vpd.put("var14", varOList.get(i).get("DFSS").toString());	//14
			vpd.put("var15", varOList.get(i).getString("WYGS"));	//15
			vpd.put("var16", varOList.get(i).getString("GRGS"));	//16
			vpd.put("var17", varOList.get(i).getString("FZXM"));	//17
			vpd.put("var18", varOList.get(i).getString("LXFS"));	//18
			vpd.put("var19", varOList.get(i).getString("YNKEY"));	//19
			vpd.put("var20", varOList.get(i).getString("CZR"));	//20
			vpd.put("var21", varOList.get(i).getString("CZSJ"));	//21
			vpd.put("var22", varOList.get(i).getString("REMARK"));	//22
			vpd.put("var23", varOList.get(i).getString("USERID"));	//23
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
