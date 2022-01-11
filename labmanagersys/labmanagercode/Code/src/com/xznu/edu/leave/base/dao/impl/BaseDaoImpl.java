package com.xznu.edu.leave.base.dao.impl;


import java.lang.reflect.ParameterizedType;
import java.math.BigInteger;
import java.util.*;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.metadata.ClassMetadata;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;

import com.xznu.edu.leave.base.dao.BaseDao;
import com.xznu.edu.leave.utils.Pager;
import com.xznu.edu.leave.utils.SystemContext;


public class BaseDaoImpl<T> implements BaseDao<T> {
	@Autowired
	private SessionFactory sessionFactory;
	/**
	 * 创建一个Class的对象来获取泛型的class
	 */
	private Class<?> clz;
	
	public Class<?> getClz() {
		if(clz==null) {
			//获取泛型的Class对象
			clz = ((Class<?>)
					(((ParameterizedType)(this.getClass().getGenericSuperclass())).getActualTypeArguments()[0]));
		}
		return clz;
	}
	 
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	
	public T add(T t) {
		getSession().save(t);
		return t;
	}

	
	public void update(T t) {
		getSession().update(t);
	}

	
	public void delete(int id) {
		getSession().delete(this.load(id));
	}

	
	public T load(int id) {
		return (T)getSession().load(getClz(), id);
	}

    @Override
    public T findById(Integer id) {
        return (T)getSession().load(getClz(), id);
    }

    public T updates(T bean) {
        // 取得元数据
        ClassMetadata cm = sessionFactory.getClassMetadata(getClz());
        // 取得主键名称
        String identifierName = cm.getIdentifierPropertyName();
        // 反射取得主键值
        Integer id = (Integer) getSimpleProperty(bean, identifierName);
        // 取得数据库中的对象
        T po = findById(id);
        // 取得所有属性
        String[] propNames = cm.getPropertyNames();
        // 定义存储新值
        Object newValue;
        for (String propName : propNames) {
            // 如果是主键就跳过
            if (propName.equals(identifierName)) {
                continue;
            }
            // 反射取得新值
            newValue = getSimpleProperty(bean, propName);
            if (newValue != null) {
                // 设置新值
                cm.setPropertyValue(po, propName, newValue);
            }
        }
        return po;
    }

    public static Object getSimpleProperty(Object bean, String propName) {
        try {
            return bean.getClass().getMethod(getReadMethod(propName)).invoke(bean);
        } catch (Exception e) {
            throw new RuntimeException("get object property failed: '" + propName + "'", e);
        }
    }

    private static String getReadMethod(String name) {
        return "get" + name.substring(0, 1).toUpperCase(Locale.ENGLISH)
                + name.substring(1);
    }

    private static String setReadMethod(String name) {
        return "set" + name.substring(0, 1).toUpperCase(Locale.ENGLISH)
                + name.substring(1);
    }
    /**
	 * 通过参数查询一个
	 * @param hql
	 * @param alias
	 * @return
	 */
	public T getByParams(String hql, Map<String, Object> alias){
		List<T> t = this.list(hql, null, alias);
		if(t !=null){
			return t.get(0);
		}else{
			return null;
		}
	}
	public List<T> list(String hql, Object[] args) {
		return this.list(hql, args, null);
	}

	
	public List<T> list(String hql, Object arg) {
		return this.list(hql, new Object[]{arg});
	}

	
	public List<T> list(String hql) {
		return this.list(hql,null);
	}
	
	private String initSort(String hql) {
		String order = SystemContext.getOrder();
		String sort = SystemContext.getSort();
		if(sort!=null&&!"".equals(sort.trim())) {
			hql+=" order by "+sort;
			if(!"desc".equals(order)) hql+=" asc";
			else hql+=" desc";
		}
		return hql;
	}
	
	@SuppressWarnings("rawtypes")
	private void setAliasParameter(Query query,Map<String,Object> alias) {
		if(alias!=null) {
			Set<String> keys = alias.keySet();
			for(String key:keys) {
				Object val = alias.get(key);
				if(val instanceof Collection) {
					//查询条件是列表
					query.setParameterList(key, (Collection)val);
				} else {
					query.setParameter(key, val);
				}
			}
		}
	}
	
	private void setParameter(Query query,Object[] args) {
		if(args!=null&&args.length>0) {
			int index = 0;
			for(Object arg:args) {
				query.setParameter(index++, arg);
			}
		}
	}

	
	public List<T> list(String hql, Object[] args, Map<String, Object> alias) {
		hql = initSort(hql);
		Query query = getSession().createQuery(hql);
		setAliasParameter(query, alias);
		setParameter(query, args);
		return query.list();
	}

	
	public List<T> listByAlias(String hql, Map<String, Object> alias) {
		return this.list(hql, null, alias);
	}

	
	public Pager<T> find(String hql, Object[] args) {
		return this.find(hql, args, null);
	}

	
	public Pager<T> find(String hql, Object arg) {
		return this.find(hql, new Object[]{arg});
	}

	
	public Pager<T> find(String hql) {
		return this.find(hql,null);
	}
	
	@SuppressWarnings("rawtypes")
	private void setPagers(Query query,Pager pages) {
		Integer pageSize = SystemContext.getPageSize();
		Integer pageOffset = SystemContext.getPageOffset();
		if(pageOffset==null||pageOffset<0) pageOffset = 0;
		if(pageSize==null||pageSize<0) pageSize = 15;
		pages.setOffset(pageOffset);
		pages.setSize(pageSize);
		query.setFirstResult(pageOffset).setMaxResults(pageSize);
	}
	
	private String getCountHql(String hql,boolean isHql) {
		String e = hql.substring(hql.indexOf("from"));
		String c = "select count(*) "+e;
		if(isHql)
			c.replaceAll("fetch", "");
		return c;
	}

	
	public Pager<T> find(String hql, Object[] args, Map<String, Object> alias) {
		hql = initSort(hql);
		String cq = getCountHql(hql,true);
		Query cquery = getSession().createQuery(cq);
		Query query = getSession().createQuery(hql);
		//设置别名参数
		setAliasParameter(query, alias);
		setAliasParameter(cquery, alias);
		//设置参数
		setParameter(query, args);
		setParameter(cquery, args);
		Pager<T> pages = new Pager<T>();
		setPagers(query,pages);
		List<T> datas = query.list();
		pages.setDatas(datas);
		long total = (Long)cquery.uniqueResult();
		pages.setTotal(total);
		return pages;
	}

	
	public Pager<T> findByAlias(String hql, Map<String, Object> alias) {
		return this.find(hql,null, alias);
	}
	//查找最大的id
	public Pager<T> findlastestid(){
		String hsql = "select e.contruct_id from Equipment e";
		Query query = this.getSession().createQuery(hsql);
		query.setString(0, "001");
		query.executeUpdate();
		Pager<T> pages = new Pager<T>();
		setPagers(query,pages);
		List<T> datas = query.list();
		pages.setDatas(datas);
		return pages;
	}
	public void deletestring(String id){
		String hql = "delete from Equipment e where e.contruct_id='" + id + "'";
//		String hql = "from Equipment where contruct_id:contruct_id";
//		Query query = this.getSession().createQuery(hql);
//		query.setParameter("contruct_id",id);
		Query query= getSession().createQuery(hql);
		query.executeUpdate();

	}
	public Object findbystringid(String id){
		String hql = "select createtime from Equipment e where e.contruct_id like'" + id + "'";
		String h="select contruct_id,expression_cassettes,original_id,vector_backbone,target,bacterium_selection,plant_selection,note,builder_id,remark,createtime from Equipment where contruct_id like'" + id + "'";
//		Pager<T> pages = new Pager<T>();
//		pages=this.find(h,null, alias);
//		return pages;
		Query query = getSession().createQuery(h);
//		query.setParameter(0,id);
//		Pager<Equipment> pages = new Pager<Equipment>();
//		setPagers(query,pages);
		List<Object> datas = query.list();
		return datas.get(0);
	}

	
	public Object queryObject(String hql, Object[] args) {
		return this.queryObject(hql, args,null);
	}

	
	public Object queryObject(String hql, Object arg) {
		return this.queryObject(hql, new Object[]{arg});
	}

	
	public Object queryObject(String hql) {
		return this.queryObject(hql,null);
	}

	
	public void updateByHql(String hql, Object[] args) {
		Query query = getSession().createQuery(hql);
		setParameter(query, args);
		query.executeUpdate();
	}

	
	public void updateByHql(String hql, Object arg) {
		this.updateByHql(hql,new Object[]{arg});
	}

	
	public void updateByHql(String hql) {
		this.updateByHql(hql,null);
	}

	
	public <N extends Object>List<N> listBySql(String sql, Object[] args, Class<?> clz,
			boolean hasEntity) {
		return this.listBySql(sql, args, null, clz, hasEntity);
	}

	
	public <N extends Object>List<N> listBySql(String sql, Object arg, Class<?> clz,
			boolean hasEntity) {
		return this.listBySql(sql, new Object[]{arg}, clz, hasEntity);
	}

	
	public <N extends Object>List<N> listBySql(String sql, Class<?> clz, boolean hasEntity) {
		return this.listBySql(sql, null, clz, hasEntity);
	}

	public <N extends Object>List<N> listBySql(String sql, Object[] args,
			Map<String, Object> alias, Class<?> clz, boolean hasEntity) {
		sql = initSort(sql);
		SQLQuery sq = getSession().createSQLQuery(sql);
		setAliasParameter(sq, alias);
		setParameter(sq, args);
		if(hasEntity) {
			sq.addEntity(clz);
		} else 
			sq.setResultTransformer(Transformers.aliasToBean(clz));
		return sq.list();
	}

	
	public <N extends Object>List<N> listByAliasSql(String sql, Map<String, Object> alias,
			Class<?> clz, boolean hasEntity) {
		return this.listBySql(sql, null, alias, clz, hasEntity);
	}

	
	public <N extends Object>Pager<N> findBySql(String sql, Object[] args, Class<?> clz,
			boolean hasEntity) {
		return this.findBySql(sql, args, null, clz, hasEntity);
	}

	
	public <N extends Object>Pager<N> findBySql(String sql, Object arg, Class<?> clz,
			boolean hasEntity) {
		return this.findBySql(sql, new Object[]{arg}, clz, hasEntity);
	}

	
	public <N extends Object>Pager<N> findBySql(String sql, Class<?> clz, boolean hasEntity) {
		return this.findBySql(sql, null, clz, hasEntity);
	}

	
	public <N extends Object>Pager<N> findBySql(String sql, Object[] args,
			Map<String, Object> alias, Class<?> clz, boolean hasEntity) {
		sql = initSort(sql);
		String cq = getCountHql(sql,false);
		SQLQuery sq = getSession().createSQLQuery(sql);
		SQLQuery cquery = getSession().createSQLQuery(cq);
		setAliasParameter(sq, alias);
		setAliasParameter(cquery, alias);
		setParameter(sq, args);
		setParameter(cquery, args);
		Pager<N> pages = new Pager<N>();
		setPagers(sq, pages);
		if(hasEntity) {
			sq.addEntity(clz);
		} else {
			sq.setResultTransformer(Transformers.aliasToBean(clz));
		}
		List<N> datas = sq.list();
		pages.setDatas(datas);
		long total = ((BigInteger)cquery.uniqueResult()).longValue();
		pages.setTotal(total);
		return pages;
	}

	public <N extends Object>Pager<N> findByAliasSql(String sql, Map<String, Object> alias,
			Class<?> clz, boolean hasEntity) {
		return this.findBySql(sql, null, alias, clz, hasEntity);
	}

	public Object queryObject(String hql, Object[] args,
			Map<String, Object> alias) {
		Query query = getSession().createQuery(hql);
		setAliasParameter(query, alias);
		setParameter(query, args);
		return query.uniqueResult();
	}

	public Object queryObjectByAlias(String hql, Map<String, Object> alias) {
		return this.queryObject(hql,null,alias);
	}


}
