<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fileinput-文件上传</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/fileinput.css" />
<script type="text/JavaScript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/fileinput.js"></script>

<script type="text/javascript" src="js/bootstrap.min.js"></script>

</head>
<body>
	<div>
		<label class="control-label">Select File</label>
		<input type="file" name="uploadfile" id="uploadfile" multiple class="file-loading" />
	</div>
</body>
<script type="text/javascript">
	$("#uploadfile").fileinput({
		language : 'zh', //设置语言
		uploadUrl : "upload.do", //上传的地址
		allowedFileExtensions : [ 'jpg', 'gif', 'png' ],//接收的文件后缀
		//uploadExtraData:{"id": 1, "fileName":'123.mp3'},
		uploadAsync : true, //默认异步上传
		showUpload : true, //是否显示上传按钮
		showRemove : true, //显示移除按钮
		showPreview : true, //是否显示预览
		showCaption : false,//是否显示标题
		browseClass : "btn btn-primary", //按钮样式     
		dropZoneEnabled : false,//是否显示拖拽区域
		//minImageWidth: 50, //图片的最小宽度
		//minImageHeight: 50,//图片的最小高度
		//maxImageWidth: 1000,//图片的最大宽度
		//maxImageHeight: 1000,//图片的最大高度
		//maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
		//minFileCount: 0,
		maxFileCount : 10, //表示允许同时上传的最大文件个数
		enctype : 'multipart/form-data',
		validateInitialCount : true,
		previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
		msgFilesTooMany : "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
	});
	//异步上传返回结果处理
	$('#uploadfile').on('fileerror', function(event, data, msg) {
		console.log(data.id);
		console.log(data.index);
		console.log(data.file);
		console.log(data.reader);
		console.log(data.files);
		// get message
		alert(msg);
	});
	//异步上传返回结果处理
	$("#uploadfile").on("fileuploaded",
			function(event, data, previewId, index) {
				console.log(data.id);
				console.log(data.index);
				console.log(data.file);
				console.log(data.reader);
				console.log(data.files);
				var obj = data.response;
				alert(JSON.stringify(data.success));

			});

	//同步上传错误处理
	$('#uploadfile').on('filebatchuploaderror', function(event, data, msg) {
		console.log(data.id);
		console.log(data.index);
		console.log(data.file);
		console.log(data.reader);
		console.log(data.files);
		// get message
		alert(msg);
	});
	//同步上传返回结果处理
	$("#uploadfile").on("filebatchuploadsuccess",
			function(event, data, previewId, index) {
				console.log(data.id);
				console.log(data.index);
				console.log(data.file);
				console.log(data.reader);
				console.log(data.files);
				var obj = data.response;
				alert(JSON.stringify(data.success));
			});
	//上传前
	$('#uploadfile')
			.on(
					'filepreupload',
					function(event, data, previewId, index) {
						var form = data.form, files = data.files, extra = data.extra, response = data.response, reader = data.reader;
						console.log('File pre upload triggered');
					});
</script>
</html>