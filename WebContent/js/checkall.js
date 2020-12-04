function checkall(all){
	//获取所有name为id的复选框
	var ids=document.getElementsByName("id");
	
	//实现循环全选/取消全选功能
	for(var i=0;i<ids.length;i++){
		ids[i].checked=all.checked;
	}
}