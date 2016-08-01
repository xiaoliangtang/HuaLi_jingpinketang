<?php if (!defined('THINK_PATH')) exit();?><div class="weixin">
	<h2><span class="red">微信</span>平台</h2>
	<dl>
		<dt>
		  <img src="<?php echo sp_get_asset_upload_path($weixin_img);?>" width="142" height="142" alt="weixin" title="weixin">
		</dt>
		<dd><?php echo ($weixin_info); ?></dd>
	</dl>		   
</div>