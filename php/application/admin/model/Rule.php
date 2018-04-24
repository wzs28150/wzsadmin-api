<?php
// +----------------------------------------------------------------------
// | Description: 规则
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\model;
use think\Db;
use app\admin\model\Common;

class Rule extends Common
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如微信模块用weixin作为数据表前缀
     */
	protected $name = 'admin_rule';
	/**
	 * [getDataList 获取列表]
	 * @linchuangbin
	 * @DateTime  2017-02-10T21:07:18+0800
	 * @param     string                   $type [是否为树状结构]
	 * @return    [array]
	 */
	public function getDataList($type = '')
	{
		if ($type == 'tree') {
			$data = Db::name('admin_rule')->field('id,pid,title as label,name,level,status')->where($map)->select();
		}else{
			$cat = new \com\Category('admin_rule', array('id', 'pid', 'title', 'name','status'));
			$data = $cat->getList('', 0, 'id');
			dump($data);
		}
		// 若type为tree，则返回树状结构
		if ($type == 'tree') {
			foreach ($data as $k => $v) {
				$data[$k]['check'] = false;
				if($v['status'] == 1){
					$data[$k]['status'] = true;
				}else{
					$data[$k]['status'] = false;
				}
			}
			$tree = new \com\Tree();
			$data = $tree->list_to_tree($data, 'id', 'pid', 'children', 0, true, array('pid'));
		}

		return $data;
	}

}
