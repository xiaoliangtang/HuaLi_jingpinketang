<?php
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class AccessController extends AdminbaseController{
	
	protected $access_model;
	
	function _initialize() {
		parent::_initialize();
		$this->access_model = D("Common/Access");
	}
	
	function index(){

		//获取状态
		//$status=$this->access_model->field("status")->select();
		//评估与未评估的两种状态
		$status = array(array('status'=>0),array('status'=>1));
		$this->assign("status",$status);

		$where="";
		if(isset($_POST['status']) && $_POST['status']!=""){
			$status=$_POST['status'];
			$where="status=$status";
		}
		$this->assign("post_status",$status);
		$access=$this->access_model->where($where)->order("commit_time DESC")->select();
		$this->assign('access',$access);
		//var_dump($accesss);
		$this->display();
	}
	
	function delete(){
		if(isset($_POST['ids'])){
			$ids = implode(",", $_POST['ids']);
			if ($this->access_model->where("id in ($ids)")->delete()!==false) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}else{
			$id = intval(I("get.id"));
			if ($this->access_model->delete($id)!==false) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
		
	}
	
	//批量评估与取消评估
	function toggle(){
		if(isset($_POST['ids']) && $_GET["display"]){
			$ids = implode(",", $_POST['ids']);
			$data['status']=1;
			if ($this->access_model->where("id in ($ids)")->save($data)!==false) {
				$this->success("评估成功！");
			} else {
				$this->error("评估失败！");
			}
		}
		if(isset($_POST['ids']) && $_GET["hide"]){
			$ids = implode(",", $_POST['ids']);
			$data['status']=0;
			if ($this->access_model->where("id in ($ids)")->save($data)!==false) {
				$this->success("取消评估成功！");
			} else {
				$this->error("取消评估失败！");
			}
		}
	}
	
	//取消评估
	function ban(){
		
    	$id=intval($_GET['id']);
			$data['status']=0;
    	if ($id) {
    		$rst = $this->access_model->where("id in ($id)")->save($data);
    		if ($rst) {
    			$this->success("取消评估成功！");
    		} else {
    			$this->error('取消评估失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }
    //评估
    function cancelban(){
    	$id=intval($_GET['id']);
		$data['status']=1;
    	if ($id) {
    		$result = $this->access_model->where("id in ($id)")->save($data);
    		if ($result) {
    			$this->success("评估成功！");
    		} else {
    			$this->error('评估失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }

    //显示详细信息
    function displayinfo(){
    	$where = array('id'=>$_GET['id']);
    	$infos = $this->access_model->where($where)->select();
    	$this->assign("infos",$infos);
    	//var_dump($infos);
    	$this->display();
    }
	
}