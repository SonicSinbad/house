package com.fh.service.house.thouse.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.house.mhouse.MhouseManager;
import com.fh.service.house.thouse.ThouseManager;

/** 
 * 说明： 卖房信息
 * 创建人：FH Q313596790
 * 创建时间：2016-09-25
 * @version
 */
@Service("thouseService")
public class ThouseService implements ThouseManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("MhouseMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("MhouseMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("MhouseMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ThouseMapper.listAll", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ThouseMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MhouseMapper.findById", pd);
	}
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByBh(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MhouseMapper.findByBh", pd);
	}
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("MhouseMapper.deleteAll", ArrayDATA_IDS);
	}
	/**批量成交
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void guidangAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("MhouseMapper.guidangAll", ArrayDATA_IDS);
		dao.delete("MhouseMapper.deleteAll", ArrayDATA_IDS);
	}
}

